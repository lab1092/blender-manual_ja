Fedora based systems
********************

Fedora is the upstream distro for Redhat Enterprise Linux, and is used by Redhat
to test new technologies which are eventually used within the official RHEL releases.
This means that Fedora is quite bleeding edge and the libraries and software that are
included with Fedora are usually quite up-to-date.


Installing Missing Blender dependencies with yum
================================================

If you have recently installed Fedora, the first thing you should do is update your system.
To do this, type the following command in a terminal window and reboot when it's finished:

``sudo yum -y update``

Note: You will be asked to enter your root password, don't worry if you don't actually see
anything on the screen when you type since your password is not echoed to the screen for security reasons.

By default, Fedora is missing the SDL library, which is required by Blender.
To install this, type the following command in the terminal window (after updating with the previous command):

``sudo yum -y install SDL``

.. tip::
   It is important that you type 'SDL' and not 'sdl', case matters.

Now that you have all the dependencies installed, you can go to the
`download page <http://www.blender.org/download/>`__, and choose a version to install.


Determining your hardware configuration
=======================================

Blender comes in two different architectures, a 32 bit version and 64 bit version.

You can determine whether you're running a 32 bit or 64 bit system by running the ``uname -m`` command
in the terminal.
If the output is 'x86_64', you have a 64 bit system and should download the 64 bit version of Blender.
If it's something else, like 'i686', you should download the 32 bit version.

.. tip::
   If you are using a 64 bit system of Fedora you can also use the 32 bit version of Blender,
   but doing so will mean you cannot use more than 4GB of memory.


Executing Blender after it has been extracted
=============================================

Once you have download and extracted the archive, you can start Blender by either double clicking on
the ``blender`` binary from your file manager, or from a terminal with the ``./blender`` command (note
that you'll need to be in the same directory as the binary).

At this point if everything went well, you should see Blender displayed on screen.


Operating System keyboard conflicts
===================================

Blender has a massive amount of hotkeys that it uses. However, some of the hotkeys that Blender uses
are also used by Gnome Shell. What follows is a list of the major conflicting keyboard shortcuts and how to change them.

.. tip::
   Unfortunately the Gnome Shell developers have a habit of changing the way you alter the keyboard shortcut assignment. If you find that methods mentioned no longer work, please do a google search and you will find how to do it. The following commands work for Fedora 19/20 when using Gnome Shell.


ALT+Left Mouse Button
---------------------

:kbd:`ALT+LMB` is a common keyboard shortcut used by Blender. It is also used by Gnome Shell to move windows around. Because of this conflict, using this keyboard shortcut to do edge loop selection does work as expected. A common fix for this is to tell Gnome Shell to instead use :kbd:`SUPER+LMB`. The :kbd:`SUPER` key is also often called the :kbd:`Windows` key.

To have Gnome Shell use the :kbd:`SUPER` key rather than :kbd:`ALT`
key when moving windows on the desktop, type the following command in a terminal window:

``dconf write "/org/gnome/desktop/wm/preferences/mouse-button-modifier" "'<Super>'"``


Obtaining snapshot builds of Blender
====================================

See the main ways of getting snapshot builds here: :ref:`install_linux_snapshots`

Being a Fedora user there's one more option for obtaining the latest development snapshot
version of Blender from git. It comes in the form of a special script which automatically
downloads all the source code and library dependencies that are required to build Blender
directly from source code on a Fedora system. This will only work for recent versions of Fedora,
and has only been tested to work with 32 bit and 64 bit Intel versions of Fedora
(the script probably won't work for Mac computers). This is *extremely* experimental and not officially
supported by the Blender Foundation. But if you are a person who really wants to build Blender yourself
and can't make sense of the official instructions, this script makes it slightly easier (when it works).

- `AutoCompileBlender Script <http://wiki.blender.org/index.php?title=User:Terrywallwork&section=1>`__


Enabling RPM Fusion for Fedora
==============================

Fedora aims to be an entirely open source operating system, and as such it does not include any closed
source software in its official repositories. This means that some important software such as codecs,
libraries, and proprietary drivers are not available in a Fedora system.

To get around some of these limitations an external software repository was set up called RPM Fusion,
which provides lots of extra software that does not meet the licensing standards of the Fedora Project.

Some features of Blender require certain libraries (i.e. FFMPEG codecs) that are only provided in
RPM Fusion, so you may want to install RPM Fusion for your system.

You can find instructions for how to do this on the `RPM Fusion website <http://rpmfusion.org/Configuration>`__


Installing CUDA for GPU rendering with Cycles
=============================================

*ToDo*
