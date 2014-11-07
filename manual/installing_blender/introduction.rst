Installing the Binaries
***********************

Blender is available both as a binary executable and as source code from the `Blender website <http://www.blender.org/download/>`__.


Downloading and installing the binary distribution
==================================================

Binary distributions are provided for the following operating system families:

- :doc:`Windows </installing_blender/windows>`
- :doc:`Linux </installing_blender/linux/introduction>`
- :doc:`Mac OSX </installing_blender/mac>`
- :doc:`FreeBSD </installing_blender/other_oss>`

Some unofficial distributions may exist for other operating systems, but as they're not
supported by the Blender Foundation, you should report any issues you may have with them directly to their maintainers.


Hardware Support
================

Blender supports 64-bit hardware platforms, removing the 4GB addressable memory limit.

Blender also supports multi-threading, a :guilabel:`Threads` setting is provided in the performance
section of the render options to indicate how many cores to use in parallel when rendering.
The :guilabel:`Auto-detect` setting will utilize all the cores available on your system, while
the :guilabel:`Fixed` setting allows the user to manually specify the number of cores to be
used when rendering.

Blender supports a wide variety of pen-based tablets on all major operating systems.

Information on how to optimize renders can be found in the
:doc:`Render </render/performance/introduction>` section of the manual.


Developers platforms
====================

A list of platforms used by Blender developers can be found here: http://wiki.blender.org/index.php/Dev:Ref/Supported_platforms


.. _install_linux_snapshots:

Obtaining snapshot builds of Blender
====================================

If you want to get snapshot builds of Blender from the git repository, you have a couple of options.


`builder.blender.org <http://builder.blender.org/download>`__
   The BuildBot is the official Blender Foundation snapshot builds from git.
   The builds provided here are built daily for all supported platforms.

`www.graphicall.org <http://www.graphicall.org>`__
   Graphicall is a Blender users site where many different snapshots of Blender are compiled by users and made available
   for download. This website hosts many builds of Blender with experimental features enabled.

`Official compile guide <http://wiki.blender.org/index.php/Dev:Doc/Building_Blender>`__
   If you want to build Blender from source, you can follow the official instructions on the wiki.
   Building Blender from source is not difficult compared to trying to build other software of comparable complexity,
   but it takes some preparation and configuration to get right.

If you still need help then you can always go to the #blendercoders channel on the Freenode IRC network and report the
problem you are having. Many of coders are busy or in other time zones, so you may have to wait a while for them to see
your message. If you don't have an IRC client on your machine you can access the #blendercoders channe
`through a web client <https://kiwiirc.com/client/irc.freenode.net/blendercoders>`__.
