
..    TODO/Review: {{review|im=needs examples}} .


Multiresolution Modifier
************************

.. figure:: /images/Multires_modifier_image.jpg
   :width: 500px
   :figwidth: 500px

   Multires modifier


The :guilabel:`Multiresolution` modifier gives the ability to subdivide a mesh to different
levels depending on whether you are viewing it from the 3D View, Sculpt Mode or in a render.

.. note::

   The *Multiresolution Modifier* is the only modifier that cannot be repositioned in the stack if it means that
   there will be geometry or other object data created or removed before it
   (i.e. all *Generate*, some *Modify* and some *Simulate* modifiers cannot come before the Multiresolution modifier.)


Options
=======

Catmull-Clark / Simple
   Set the type of subdivision.

   Simple
      Maintains the current shape, and simply subdivides edges.
   Catmull-Clark
      Creates a smooth surface, usually smaller than the original, using the standard
      `Catmull-Clark <http://en.wikipedia.org/wiki/Catmull%E2%80%93Clark_subdivision_surface>`_
      subdivision surface algorithm.

Preview
   Set the level of subdivisions to use in the 3D View.
Sculpt
   Set the number of subdivisions to use in :guilabel:`Sculpt Mode`.
Render
   Set the number of subdivisions to use when rendering.

Subdivide
   Add a higher level of subdivision.
Delete Higher
   Deletes all subdivision levels that are higher than the current one.
Reshape
   Copies vertex coordinates from another mesh.
   To use, select a different mesh with matching topology and vertex coordinates,
   then :kbd:`Shift` select the mesh and click :guilabel:`Reshape`. The mesh will take the shape of the other one.
Apply Base
   Modifies the mesh to match the form of the subdivided mesh.

Optimal Display
   Skips the drawing of edges added from subdivision.

Save External
   Saves displacements to an external .btx file.
