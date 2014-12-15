
**************************
Configuration & Data Paths
**************************

Blender can be installed system wide or run from an extracted bundle with all necessary files
contained.

There are 3 different directories Blender may use,
their exact locations are operating system dependent.

LOCAL
   Location of configuration and runtime data (for self contained bundle)
USER
   Location of configuration files (normally in the user's home directory).
SYSTEM
   Location of runtime data for system wide installation (may be read-only).

For system installations both **SYSTEM** & **USER** directories are needed.

For locally extracted Blender distributions, the user configuration and data runtime data are
kept in the same sub-directory, allowing multiple Blender versions to run without conflict,
ignoring the **USER** and **SYSTEM** files.

Here are the default locations for each system:


OSX
===

LOCAL
   .. parsed-literal:: ./|BLENDER_VERSION|/
USER
   .. parsed-literal:: /Users/{user}/Library/Application Support/Blender/|BLENDER_VERSION|/
SYSTEM
   .. parsed-literal:: /Library/Application Support/Blender/|BLENDER_VERSION|/

.. note::
   OSX stores the Blender binary in ``./blender.app/Contents/MacOS/blender``,
   so the local path to data & config is:
   .. parsed-literal:: ./blender.app/Contents/MacOS/|BLENDER_VERSION|/


Windows
=======

LOCAL
   .. parsed-literal:: .\\\ |BLENDER_VERSION|\\.
USER
   .. parsed-literal:: C:\\Documents and Settings\\{username}\\AppData\\Roaming\\Blender Foundation\\Blender\\\ |BLENDER_VERSION|\\
SYSTEM
   .. parsed-literal:: C:\\Documents and Settings\\All Users\\AppData\\Roaming\\Blender Foundation\\Blender\\\ |BLENDER_VERSION|\\


Unix (Linux/BSD/Solaris)
========================

LOCAL
   .. parsed-literal:: ./|BLENDER_VERSION|/
USER
   .. parsed-literal:: $HOME/.config/blender/|BLENDER_VERSION|/
SYSTEM
   .. parsed-literal:: /usr/share/blender/|BLENDER_VERSION|/


.. note::
   The path ./|BLENDER_VERSION|/ is relative to the Blender Executable &
   used for self contained bundles distributed by official blender.org builds.

.. note::
   The USER path will use ``$XDG_CONFIG_HOME`` if its set:

   .. parsed-literal:: $XDG_CONFIG_HOME/blender/|BLENDER_VERSION|/


Path Layout
===========

This is the path layout which is used within the directories described above.

Where ``./config/startup.blend`` could be ~/.blender/|BLENDER_VERSION|/config/startup.blend
for example.


``./autosave/ ...``
   Autosave blend file location. *Windows only, temp directory used for other systems.*
   Search order: **LOCAL, USER**.

``./config/ ...``
   Defaults & session info.
   Search order: **LOCAL, USER**.

``./config/`` **startup.blend**
   Default file to load on startup.

``./config/`` **userpref.blend**
   Default preferences to load on startup.

``./config/`` **bookmarks.txt**
   File selector bookmarks.

``./config/`` **recent-files.txt**
   Recent file menu list.

``./datafiles/ ...``
   Runtime files.
   Search order: ``LOCAL, USER, SYSTEM``

``./datafiles/locale/{language}/``
   Static precompiled language files for UI translation.

``./datafiles/icons/*.png``
   Icon themes for Blenders user interface. *Not currently selectable in the theme preferences.*

``./datafiles/brushicons/*.png``
   Images for each brush.

``./scripts/ ...``
   Python scripts for the user interface and tools.
   Search order: ``LOCAL, USER, SYSTEM``.

``./scripts/addons/*.py``
   Python addons which may be enabled in the user preferences, includes import/export format support,
   render engine integration and many handy utilities.

``./scripts/addons/modules/*.py``
   Modules for addons to use (added to Python's sys.path).

``./scripts/addons_contrib/*.py``
   Another addons directory which is used for community maintained addons (must be manually created).

``./scripts/addons_contrib/modules/*.py``
   Modules for addons_contrib to use (added to Python's sys.path).

``./scripts/modules/*.py``
   Python modules containing our core API and utility functions for other scripts to import (added to Python's sys.path).

``./scripts/startup/*.py``
   Scripts which are automatically imported on startup.

``./scripts/presets/{preset}/*.py``
   Presets used for storing user defined settings for cloth, render formats etc.

``./scripts/templates/*.py``
   Example scripts which can be accessed from: Text Space's Header → Text → Script Templates.

``./python/ ...``
   Bundled Python distribution, only necessary when the system Python installation is absent or incompatible.
   Search order: ``LOCAL, SYSTEM``.


Notes
=====

User Scripts Path
-----------------

The user preferences script path provides a way to set your own directory which is used for
scripts as well as the user scripts path. Be sure to create subfolders within this directory
which match the structure of Blenders scripts directory, startup/, addons/, modules/ etc.
because copying scripts directly into this folder will not load them on startup or as addons.


Environment Variables
---------------------

Environment variables can be used to override default path locations, e.g.:
``$BLENDER_USER_CONFIG``, ``$BLENDER_SYSTEM_PYTHON``.

This is not normally something which needs setting but can be useful for custom configurations.

For details see the 'Environment Variables' section in 'blender --help'


Scripts Path & Missing Buttons
------------------------------

If Blender starts with no interface this is probably because the scripts are not loading
correctly and can be caused by:

- script path not found.
- an error in one of the scripts.
- a version mismatch between Blender and the scripts.

In this case, it's best to load Blender from a terminal to see any error messages.
