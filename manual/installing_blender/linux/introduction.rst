
********************
Generic Instructions
********************

Download
========

You can obtain the latest stable version of Blender for Linux from the
`Blender download page <http://www.blender.org/download>`__
or from your distros repositories if it provides a Blender package.


Version
=======

Blender for Linux is currently available in 32-bit and 64-bit versions.
Users with a 32-bit version of Linux must download the 32-bit version of Blender. Users with a
64-bit version of Linux can choose to use either the 32-bit or 64-bit version of Blender,
however you will likely notice an increase in performance when using the 64-bit version of
Blender, especially on systems with large amounts of RAM.

To determine whether you have a 32-bit or 64-bit version of Linux, you can either consult your
distributions documentation or use the ``uname -m`` command, which will print the systems architecture.
If you have a 32-bit system, ``uname -m`` will return a value of ``i686``, while a 64-bit system will return ``x86_64``.


Distribution releases
=====================

Most major distributions such as Ubuntu, Debian, Open SUSE, Fedora and many others will
provide a build of Blender in their software repository that can be accessed through that
distributions package manager. If your distribution does not do this,
or has not updated their repository to include the latest Blender release,
you can install it yourself with the instructions below.
Note that depending on your distribution the version available in the software repository may
be outdated compared to the offical release, or not include some features of Blender. For example,
some distros do not build Blender with CUDA support for licensing reasons.


Installation
============
If your distro doesn't have a recent Blender version in the repos, download the appropriate version of
Blender for Linux from the `Blender download page <http://www.blender.org/download>`__
and unpack the archive to a location of your choice.

This will create a directory named ``blender-VERSION-linux-glibcVERSION-ARCH``,
where ``VERSION`` is the Blender release version, ``glibcVERSION`` is the
version of glibc required and ``ARCH`` is your computer architecture
(``i686`` or ``x86_64``).
In this directory you will find the ``blender`` binary.

To run Blender, navigate to the Blender directory using a file manager and double click the Blender
executable. Or open a terminal console, navigate to the Blender directory, and execute the command ``./blender``.


Installing into ``/opt`` or ``/usr/local``
------------------------------------------

You can also install Blender into ``/opt`` or ``/usr/local`` by moving the
Blender directory into one of those locations. If you want to be able to run Blender from any
directory you will also need to update your PATH variable.
Consult your operating system documentation for the recommended method of setting your PATH.


Configuration
=============


Alt+Mouse Conflict
------------------

Many Linux distributions default to :kbd:`Alt-LMB` for moving windows.
Since Blender uses :kbd:`Alt-Click` it's normally easier to disable this feature or change
the key used by the window manager to Super (Windows Key)

- Ubuntu 11.04: Settings > Window Manger Tweak > Accessibility > Change Window Key to Super
- Ubuntu 12.04 (Unity/Gnome): Command line (effective at next login):
  gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier 'none'
- KDE: System Settings > Window Behavior > Window Behavior > Window Actions , Switch 'Alt' for 'Meta' key
- Other versions: todo


Compositing Desktop Environments
================================

Many recent Linux distributions enable compositing when hardware support is available. This is
a feature where the graphics card is used to do window drawing and accelerated desktop effects
(for example: drop shadow and window transparency). Notably - Ubuntu Unity,
Gnome Shell and KDE will use compositing.

While many users find this works flawlessly, some graphics cards have buggy drivers which
cause drawing glitches with Blender but work correctly for regular applications which don't
use OpenGL acceleration. Another downside to using hardware accelerated desktop effects is
that the windows you have open share texture memory with Blender's OpenGL display and GPU
rendering.

If you experience these problems they can be avoided by disabling desktop effects or by
switching to a desktop environment that does not use desktop effects such as:

- Unity2D
- Gnome Fallback
- XFCE
- LXDE
- light weight window managers like openbox, jwm, sawfish, icewm... etc.

For details on this topic,
see: `Wikipedia - Compositing Window Managers <http://en.wikipedia.org/wiki/Compositing_window_manager>`__


Drivers for 3D Graphic Cards
============================

To run some software such as Blender which uses your GPU's 3D capabilities, your system will need libraries
that interpret 3D drawing commands from Blender into drawing commands for your GPU.

Blender uses OpenGL which is a free graphics language library that works on multiple platforms.
The OpenGL drivers can be implemented in 2 different ways in Linux:

- Via Software

  MesaGL is a software library that uses your CPU to interpret OpenGL commands and convert those
  commands into pixels that get displayed on your screen. Interpreting the OpenGL commands with your
  CPU is much slower and less efficient and so will result in slower display drawing performance
  (noticeable when working with dense scenes).

- Via Hardware

  When OpenGL drawing commands are processed in hardware, the drawing commands are sent directly to your
  GPU. The CPU is bypassed for the most part and this results in much better performance.
  This is called Hardware Acceleration.

Most modern Linux distributions come with MesaGL or other OpenGL libraries bundled so you can run software
like Blender without needing a GPU to calculate screen drawing commands.

For hardware acceleration, you have two choices: use open source drivers or proprietary ones.

Open source drivers are used automatically by most distros if your graphics card is supported by the driver.
Some graphics card manufactures make available graphic card API's and source code, allowing the Linux
community to write drivers for those cards and allowing Linux to communicate reliably and efficiently
with those GPU's. This mean that those cards perform very well on Linux.

Proprietary drivers need the user to install third party software (the drivers), which aren't open source
(meaning no source code is released).  These drivers are released by the manufacturer in binary
only, and they are in control of what features the driver supports for a particular GPU. These binary only
drivers can't be examined by the Linux community and any bugs can't be fixed by Linux developers. So,
there are advantages and disadvantages when using proprietary drivers. The advantages is that the proprietary
drivers are generally more efficient when it comes to hardware acceleration, but the disadvantages are related
to software updates, fixes, and general support.

Some distributions such as Ubuntu include programs to simplify driver installation (available to the
majority of Ubuntu variants), while others like Fedora will need the user to download the drivers
from an external repo.

Consult your distros documentation to find how to install proprietary drivers. If you find problems when
using them, contact your card manufacturer, they are the only ones who can fix bugs in their drivers.
Happily, proprietary drivers are an exception rather than the rule in the Linux world.

.. tip::

   By default, Blender will try to use hardware acceleration, but if this is not available you
   may find Blender becoming more unstable. If this happens for you then you can run Blender in Software
   OpenGL Mode by entering ``./blender-softwaregl`` (note that you must be in the same directory as  the
   blender-softwaregl binary, which is in the tarball from blender.org).


Intel Graphic Cards
-------------------

Intel is currently the largest supplier of Integrated 3D Graphics chips in the world that go
inside laptops and servers.

Unfortunately they are not very good on performance graphics hardware, not only are they often very slow,
they also often do not properly implement certain OpenGL commands that can result in screen items not
being displayed correctly when Blender is being used.

The only real solution for this is to always keep your Intel graphics card drivers up to date and hope
that the updated driver fixes any issues you may have.


GPU rendering with Cycles
-------------------------

Cycles is Blender's new render engine. One of its major features is its ability to use the GPU for rendering.
GPU's are specifically designed for graphics processing, so Cycles will often render an image many times
faster with a powerful GPU than a similarly powerful CPU. The downside is that at the moment, only Nvidia GPU's
with CUDA are able to compile Cycles' kernel, so it's not yet possible to use an AMD GPU for rendering.
CUDA is proprietary Nvidia technology, and there are no free drivers available to users for now, so,
the only way to use your GPU with Cycles is to have a Nvidia card and
Nvidia's proprietary drivers installed on your system.

Linux systems and Blender fully support the use of multiple CPU's/GPU to spread render
tasks in Cycles. Appropriate drivers are all that is required for the particular hardware to
shared between multiple devices. Unfortunately, you will need to use the proprietary Nvidia drivers for this.
Blender will then automatically detect any capable GPU's on your computer.

If you have installed the proprietary drivers and your GPU is capable enough to use with Cycles, you
will be able to enable GPU rendering from the user preferences. In the *System* tab, you will find the
*Compute Device* settings from which you can select your GPU as the compute device.


Troubleshooting
===============

Most Linux distros work flawlessly with Blender.
Minor problems may be found depending on the distribution and its configuration.
If Blender doesn't work, you may have to see your specific Linux distribution documentation
and/or ask it's community.

The most common causes of problems are shown below with possible solutions.


Desktop Effects
---------------

Sometimes, desktop effects and compositors such as compiz, are resource hungry and heavy to use in conjunction
with heavy graphical applications like Blender

Some Debian based distributions like Ubuntu, enables desktop effects out of the box, while others,
uses lightweight window managers which require far less resources from your system and GPU.

If you're experiencing problems such as flickering during window transitions, window fades shown at a
frame by frame rate and others, you may have to disable your desktop effects or use another lighter weight
window manager without desktop effects enabled.

.. tip::

   As a general rule, the best usage scenario for Blender (as with any other 3D software),
   is to have all possible system resources free, available and ready for use. Desktop
   effects can be quite resource-hungry so it's often best to disable them when using Blender.

- Ubuntu:
  There is no easy way *out of the box* to disable the desktop effects that comes with Ubuntu
  default install, because there is no shortcut,
  icon or preferences tab available to disable desktop effects for the users.

  The easiest way to disable desktop effects when using Ubuntu with Unity (default), is to install the
  compiz settings manager with ``sudo apt-get install compizconfig-settings-manager``.
  Once installed, go to Ubuntu Unity Plugin → Experimental (Tab).
  From there you can set Launch Animation, Urgent Animation and Dash Blur to 'None'. Set the Hide
  Animation to Slide only. If you want, you can change the panel and dash transparency to be full opaque (recommended).

  `External link to askubuntu.com <http://askubuntu.com/questions/138622/how-to-disable-all-unity-animations>`__.

  You can also use another Ubuntu based distribution (like Xubuntu or Lubuntu) that uses another lightweight
  window manager, or install another window manager in your default Ubuntu install.

  Consult the Ubuntu documentation, or ask your system administrator on how to install another
  Window manager with no desktop effects to improve performance.

- For other Debian based systems:

  In general, if you don't have a compositing window manager installed using desktop effects, you don't
  have anything to worry about it.
  If you do have something like Compiz or Metacity installed, consult the documentation on how to disable
  desktop effects.

