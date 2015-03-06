#########
  Readme
#########

This directory is customized contents from the **blender_docs** SVN repository.

.. note::
   Currently, this repository is for testing:
   
      * to make the steps how to make i18ned documentation workflow.

.. caution::
    Do not commit files to original BF documentation repogitory from this repo.


Translation steps for blender-manual
*************************************

(on OS X 10.10 & Python 2.7)

below is a sample for adding 'ja' locale.
you can try translation to your own Sphinx project.

:svnroot: ~/GitHub/blender_docs
:projectroot: ~/GitHub/blender-manual_i18n
:documentroot: ~/GitHub/blender-manual_i18n/manual
:pot files: ~/GitHub/blender-manual_i18n/locale/pot
:po files(ja): ~/GitHub/blender-manual_i18n/locale/ja
:html files(en): ~/GitHub/blender-manual_i18n/build/html/en
:html files(ja): ~/GitHub/blender-manual_i18n/build/html/ja


Install sphinx-intl package
==============================

After installation blender manual steps, IInstall sphinx-intl package for translation

   ::
      $ pip install sphinx-intl 

Download/Update from svn
===========================

Run a svn command to download files from svn repository.

   .. code-block::

      $ cd ~/GitHub/
      $ svn checkout https://svn.blender.org/svnroot/bf-manual/trunk/blender_docs

Edit Configuration files
=========================

Change  locale directory and gettext option in manual/conf.py

   .. code-block::

      locale_dirs = ['../locale/']   # path is example but recommended.
      gettext_compact = False     # optional. 

Chanege output folder in Make file

   .. code-block::

      all: FORCE
          # './' (input), './html/en' (output)
          QUICKY_CHAPTERS=$(QUICKY_CHAPTERS) \
          $(SPHINXBUILD) -b html $(SPHINXOPTS) ./manual $(BUILDDIR)/html/en
          @echo "firefox" $(shell pwd)"$(BUILDDIR)/html/en"

Bluld POT files
=================

after add 'gettext' target , run ``make gettext`` command.

   .. code-block::

      $ cd ~/GitHub/blender-manual_i18n
      $ sphinx-build -b gettext ./manual ./locale/pot


Update message file
======================

To sync messages to ja locale, run the command

   .. code-block::

      $ cd ~/GitHub/blender-manual_i18n
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

   .. note::
   	  please make sure if current directory is "~/GitHub/blender-manual_i18n" 
   	  before run these commands.

   .. code-block::

      $ sphinx-intl build -d ./locale/

Bulid html files(ja)

   .. code-block::

      $ sphinx-build -D language='ja' -b html ./manual ./build/html/ja

Bulid html files(en)

   .. code-block::

      $ make all


Template customize
*************************************

   .. note::
   	  This is temporarily change to access two language page.

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

* http://blender-manual-i18n.readthedocs.org/ja/latest/contents.html





#########
  Readme
#########

Blender-Manual is Blender's official project to provide the user with a clear, concise and up-to-date description of
Blender's functioning in the current version.

Complementary projects are the `Python API <http://www.blender.org/documentation/250PythonDoc>`__ as a reference,
`StackExcange <http://blender.stackexchange.com>`__ for question answering and
`Blender Cloud <http://cloud.blender.org/>`__ for training.


**************
Project Status
**************

There are some left over TODOs from the MediaWiki migration and sections on the process of being reviewed.
See also the `current open tasks <https://developer.blender.org/project/view/53/>`__ and the
`section overview <http://www.blender.org/documentation/manual-sections/>`__


*******************
Building the Manual
*******************

See install.rst for how to build and the `Getting Started section <http://www.blender.org/documentation/contribute>`__
for an explanation on the full workflow and other tips.

