
********************
Debian based systems
********************

Installing Blender on Debian and its derivatives (Ubuntu, Mint and others), is quite straightforward.

A default install of these distros don't come with some of the libraries Blender needs to work,
so just downloading Blender and extracting it is usually not enough, we'll also have to install its
dependencies.

On this page, we explain the easiest way to install Blender for a regular, Debian based Linux system.


Instructions
------------

.. tip::
   You must be able to run commands as root to follow this guide.

.. tip::
   In some Debian based systems, the sudo command is not enabled by default. If this is so on your
   system you will have to type ``su -``, and type the root password to be logged in as root.

**Those instructions were tested for Blender 2.65 using Debian 6.0, Ubuntu 12.04 and 12.10**.

You should first update your system. Open a terminal and enter the following command to do this:

``sudo apt-get update``

You'll need to type your root password. Wait for the system to update the repo metadata, then type
in the terminal:

``sudo apt-get upgrade``

This command will download and update all installed packages on your system. You should now reboot.

After the reboot, again open your terminal and enter:

``sudo apt-get install blender``

apt-get will then install the repo build of Blender for your system. It will automatically install all
dependencies as well.

Now you will have a working Blender version installed, you should test to see if it runs correctly.
If so then you're ready to download the latest Blender version from the Blender website.

Blender is provided in two different architectures, a 32 bit version and 64 bit version. Prior to
downloading Blender from the website, you need to know the architecture of your system. To find out, enter
the command ``uname -m`` in a terminal.

If it prints 'i686', you have a 32 bit system, if it prints 'x86_64', then you have a 64 bit system.
Now you can download an appropriate Blender version for your system. If your system is 32 bit you must
download the 32 bit version of Blender. If your system is 64 bit, then you can download either the 64 bit
or 32 bit version, but this means Blender will only be able to use up to 4GB of RAM.

Go to the `blender.org download website <http://www.blender.org/download/>`__ and download the correct
version for your system. The Blender packages from blender.org for Linux systems come in a tarball (tar.bz2).
After the download, untar the file, click twice on the ``blender`` binary and you should see Blender open up!


Hints
-----

- You can copy the extracted contents of the downloaded Blender release over your distributions Blender
  version (you'll need root permissions). But be aware that you will have to clean up the old blender
  folders every time you update.


