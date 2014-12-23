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
`section overview  <http://www.blender.org/documentation/manual-sections/>`__


*******************
Building the Manual
*******************

See install.rst for how to build and the `Getting Started section <http://www.blender.org/documentation/contribute>`__
for an explanation on the full workflow and other tips.


****************
Style guidelines
****************

Writing Style
-------------

- American English (eg: modeling and not modelling, color and not colour).
- Use of correct grammar, appropriate wording and simple English.
- Sentences should be kept short and clear, resulting in text that is easy to read, objective and to the point.
- *Spell checking is strongly recommended.*


Conventions
-----------

- 3 space indentation.
- Lines should be under 120 length.
- Use italics for button/menu names.


Headings
--------

.. code-block:: rst

   ################
    Document Part
   ################

   ****************
   Document Chapter
   ****************

   Document Section
   ================

   Document Subsection
   -------------------

   Document Subsubsection
   ^^^^^^^^^^^^^^^^^^^^^^

   Document Paragraph
   """"""""""""""""""

.. note:: *Parts* should only be used for contents or index pages.

.. note:: each ``.rst`` file should only have one chapter heading (``*``) per file.


Text Styling
------------


See the `overview on ReStructured Text <http://sphinx-doc.org/rest.html>`__
for more information on how to style the various elements of the documentation and on how to add lists, tables,
pictures and code blocks.
The `sphinx reference <http://sphinx-doc.org/markup/index.html>`__ provides more insight additional constructs.

The following are useful markups for text styling:

- ``*italic*``
- ``**bold**``
- \`\`literal\`\`


Interface Elements
------------------

- ``:kbd:`Lmb``` - keyboard and mouse shortcuts.
- ``*Mirror*`` - interface labels.
- ``:menuselection:`3D View --> Add --> Mesh --> Monkey``` - menus.


Code Samples
------------

There is support for syntax highlighting if the programming language is provided,
and line numbers can be optionally shown with the `:linenos:` option.


.. code-block:: rst

   .. code-block:: python
      :linenos:

      import bpy
      def some_function():
          ...

Figures
-------

Figures should be used to place images.


.. code-block:: rst

   .. figure:: /images/modifiers_subsurf_example.jpg


Useful Constructs
-----------------

- `|BLENDER_VERSION|` -
  Automatically resolves to the current Blender version.
- `:abbr`SSAO (Screen Space Ambient Occlusion)` -
  Abbreviations display the full text as a tooltip for the reader.


Cross References and Linkage
----------------------------

You can link to another document in the manual with:

.. code-block:: rst

   :doc:`The Title </section/path/to/file>`


For intra document references, explicit labels are available:

.. code-block:: rst

   .. _sample-label:

   [section or image to reference]

   Some text :ref:`Optional Title <sample-label>`


Linking to a title in the same file.

.. code-block:: rst

   Titles are Targets
   ==================

   Body text.

   Implicit references, like `Titles are Targets`_


Linking to the outside world:

.. code-block:: rst

   `Blender Website <http://www.blender.org>`__


Directory layout
----------------

Sections should be generally structured as follows:

- *directory_name*

  - ``index.rst`` (contains links to internal files)
  - ``introduction.rst``
  - ``section_1.rst``
  - ``section_2.rst``

For example:

- rendering/

  - ``index.rst``
  - ``cycles/``

    - ``index.rst``
    - ``introduction.rst``
    - ``materials/``

      - ``index.rst``
      - ``introduction.rst``
      - ``volumes.rst``

The idea is to enclose all the content of a section inside of a folder. Ideally every section
should have an index.rst (containing the TOC for that section) and an ``introduction.rst``
(introducing) to the contents of the section.


Table of Contents
-----------------

By default a table of contents should show two levels of depth.

.. code-block:: rst

   .. toctree::
      :maxdepth: 2

      introduction.rst
      perspective.rst
      depth_of_field.rst

