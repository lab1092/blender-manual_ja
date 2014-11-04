#########
  Readme
#########

This directory is a copy from the **blender-manual** git repository.

.. note::
   this repository is for testing:
   
      * to make the steps to build i18ned document.

.. caution::
    Do not commit files to original BF documentation repogitory from this repo.


Translation steps for blender-manual
*************************************

(on OS X 10.10)

below is a sample for adding 'ja' locale.
you can try translation to your own Sphinx project.

:projectroot: ~/GitHub/blender-manual_i18n
:documentroot: ~/GitHub/blender-manual_i18n/manual
:pot files: ~/GitHub/blender-manual_i18n/locale/pot
:po files(ja): ~/GitHub/blender-manual_i18n/ja
:html files(en): ~/GitHub/blender-manual_i18n/html/en
:html files(ja): ~/GitHub/blender-manual_i18n/html/ja


Install sphinx-intl package
==============================

Install sphinx-intl package for translation

   ::
      $ pip install sphinx-intl 

Edit files
============

Change 'all' target on ./Makefile 

   .. code-block::

      all:
          # './' (input), './html/en/' (output)
          QUICKY_CHAPTERS=$(QUICKY_CHAPTERS) \
          sphinx-build -b html ./manual ./html/en
          @echo "firefox" $(shell pwd)"/html/en"

Add 'allja' and 'gettext' target to ./Makefile

   .. code-block::

      allja:
          # './' (input), './html/ja/' (output)
          QUICKY_CHAPTERS=$(QUICKY_CHAPTERS) \
          sphinx-build -D language='ja' -b html ./manual ./html/ja
          @echo "firefox" $(shell pwd)"/html/ja"  

   .. code-block::

      gettext:
	      # './' (input), './locale/pot/' (output)
	      QUICKY_CHAPTERS=$(QUICKY_CHAPTERS) \
	      sphinx-build -b gettext ./manual ./locale/pot
	      @echo "pot files are updated. "


Add locale directory and gettext option to manual/conf.py

   .. code-block::

      locale_dirs = ['../locale/']   # path is example but recommended.
      gettext_compact = False     # optional. 


Bluld POT files
=================

after add 'gettext' target , run ``make gettext`` command.

   .. code-block::

      $ make gettext


Update message file
======================

To sync messages to ja locale, run the command

   .. code-block::

      $ sphinx-intl update -d ./locale/ -p ./locale/pot -l ja


Translate it
=============

You can translate message text (.po file ). 

   Before
   
   .. code-block:: 
   
      #: ../manual/contents.rst:3
      msgid "Blender Manual contents"
      msgstr ""

   After

   .. code-block::
    
      #: ../manual/contents.rst:3
      msgid "Blender Manual contents"
      msgstr "Blenderマニュアルコンテンツ"

Build i18ned html
==========================

Bulid mo files:

   .. code-block::
    
      $ sphinx-intl build -d locale

Bulid html files

   .. code-block::
    
      $ make allja


Template customize
*************************************

*This is temporarily change*

 /Library/Python/2.7/site-packages/sphinx_rtd_theme/breadcrumbs.html

   .. code-block::
      
      <li>{{ title }}</li>
        <li class="wy-breadcrumbs-aside">
          <a href="{{ url_root +'../en/contents.html' }}"> [EN]</a> | 
          <a href="{{ url_root +'../ja/contents.html' }}"> [JA]</a> | 


result
*************************************


Japanese Translation Sample
=====================================

* http://lab1092.site44.com/blender-manual/ja/contents.html
* http://lab1092.site44.com/blender-manual/en/contents.html



[EOF]


