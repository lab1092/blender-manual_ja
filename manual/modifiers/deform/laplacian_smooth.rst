*************************
Laplacian Smooth Modifier
*************************

The Laplacian Smooth modifier allows you to reduce noise on a mesh's surface with minimal changes to its shape.

It can also exaggerate the shape using a negative *Factor*.

The Laplacian Smooth is useful for objects that have been reconstructed from the
real world and contain undesirable noise. It removes noise while still
preserving desirable geometry as well as the shape of the original model.

The Laplacian Smooth modifier is based on a curvature flow Laplace Beltrami operator in a diffusion equation.


Options
=======

.. figure:: /images/Apinzonf_Diagram_Modifier_Panel.jpg
   :width: 369px
   :figwidth: 369px

   Laplacian Smooth modifier


Repeat
   Repetitions allow you to run the Laplacian smoothing multiple times.
   Each repetition causes the flow curvature of the mesh to be recalculated again,
   and as a result it removes more noise with every new iteration using a small *Factor* < ``1.0``.

   When on ``0``, no smoothing is done.

   .. note::

      More repetitions will take longer to calculate - beware of doing so on meshes with a large number of vertices.


   +----------------------------------------------------------+----------------------------------------------------------+----------------------------------------------------------+-----------------------------------------------------------+
   +.. figure:: /images/Apinzonf_GSOC_2012_Diagram_repeat0.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_repeat1.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_repeat5.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_repeat10.jpg+
   +   :width: 130px                                          |   :width: 130px                                          |   :width: 130px                                          |   :width: 130px                                           +
   +   :figwidth: 130px                                       |   :figwidth: 130px                                       |   :figwidth: 130px                                       |   :figwidth: 130px                                        +
   +                                                          |                                                          |                                                          |                                                           +
   +   Repeat: ``0``                                          |   Repeat: ``1``                                          |   Repeat: ``5``                                          |   Repeat: ``10``                                          +
   +----------------------------------------------------------+----------------------------------------------------------+----------------------------------------------------------+-----------------------------------------------------------+
   +(with a *factor* of ``0.5``)                                                                                                                                                                                                                +
   +----------------------------------------------------------+----------------------------------------------------------+----------------------------------------------------------+-----------------------------------------------------------+


   +---------------------------------------------------------------+---------------------------------------------------------------+---------------------------------------------------------------+----------------------------------------------------------------+
   +.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_repeat0.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_repeat1.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_repeat5.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_repeat10.jpg+
   +   :width: 130px                                               |   :width: 130px                                               |   :width: 130px                                               |   :width: 130px                                                +
   +   :figwidth: 130px                                            |   :figwidth: 130px                                            |   :figwidth: 130px                                            |   :figwidth: 130px                                             +
   +                                                               |                                                               |                                                               |                                                                +
   +   Repeat: ``0``                                               |   Repeat: ``1``                                               |   Repeat: ``5``                                               |   Repeat: ``10``                                               +
   +---------------------------------------------------------------+---------------------------------------------------------------+---------------------------------------------------------------+----------------------------------------------------------------+
   +(with a *factor* of ``2.0``)                                                                                                                                                                                                                                    +
   +---------------------------------------------------------------+---------------------------------------------------------------+---------------------------------------------------------------+----------------------------------------------------------------+


   +------------------------------------------------------+------------------------------------------------------+------------------------------------------------------+-------------------------------------------------------+
   +.. figure:: /images/Apinzonf_Diagram_camel_repeat0.jpg|.. figure:: /images/Apinzonf_Diagram_camel_repeat1.jpg|.. figure:: /images/Apinzonf_Diagram_camel_repeat5.jpg|.. figure:: /images/Apinzonf_Diagram_camel_repeat10.jpg+
   +   :width: 130px                                      |   :width: 130px                                      |   :width: 130px                                      |   :width: 130px                                       +
   +   :figwidth: 130px                                   |   :figwidth: 130px                                   |   :figwidth: 130px                                   |   :figwidth: 130px                                    +
   +                                                      |                                                      |                                                      |                                                       +
   +   Repeat: ``0``                                      |   Repeat: ``1``                                      |   Repeat: ``5``                                      |   Repeat: ``10``                                      +
   +------------------------------------------------------+------------------------------------------------------+------------------------------------------------------+-------------------------------------------------------+
   +(with a *factor* of ``-0.5``)                                                                                                                                                                                               +
   +------------------------------------------------------+------------------------------------------------------+------------------------------------------------------+-------------------------------------------------------+


Factor
   Controls the amount of displacement of every vertex along the curvature flow.

   - Using a small *Factor*, you can remove noise from the shape without affecting desirable geometry.
   - Using a large *Factor*, you get smoothed versions of the shape at the cost of fine geometry details.
   - Using a negative *Factor*, you can enhance the shape, preserving desirable geometry.
   - When the *Factor* is negative, multiple iterations can magnify the noise.


   +-----------------------------------------------------------------+-----------------------------------------------------------------+------------------------------------------------------------------+------------------------------------------------------------------+
   +.. figure:: /images/Apinzonf_GSOC_2012_Diagram_lambda0_0.jpg     |.. figure:: /images/Apinzonf_GSOC_2012_Diagram_lambda0_5.jpg     |.. figure:: /images/Apinzonf_GSOC_2012_Diagram_lambda2_5.jpg      |.. figure:: /images/Apinzonf_GSOC_2012_Diagram_lambda5_0.jpg      +
   +   :width: 130px                                                 |   :width: 130px                                                 |   :width: 130px                                                  |   :width: 130px                                                  +
   +   :figwidth: 130px                                              |   :figwidth: 130px                                              |   :figwidth: 130px                                               |   :figwidth: 130px                                               +
   +                                                                 |                                                                 |                                                                  |                                                                  +
   +   Factor: ``0.0``                                               |   Factor: ``0.5``                                               |   Factor: ``2.5``                                                |   Factor: ``5.0``                                                +
   +-----------------------------------------------------------------+-----------------------------------------------------------------+------------------------------------------------------------------+------------------------------------------------------------------+
   +.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_lambda0_0.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_lambda1_0.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_lambda10_0.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_lambda50_0.jpg+
   +   :width: 130px                                                 |   :width: 130px                                                 |   :width: 130px                                                  |   :width: 130px                                                  +
   +   :figwidth: 130px                                              |   :figwidth: 130px                                              |   :figwidth: 130px                                               |   :figwidth: 130px                                               +
   +                                                                 |                                                                 |                                                                  |                                                                  +
   +   Factor: ``0.0``                                               |   Factor: ``1.0``                                               |   Factor: ``10.0``                                               |   Factor: ``50.0``                                               +
   +-----------------------------------------------------------------+-----------------------------------------------------------------+------------------------------------------------------------------+------------------------------------------------------------------+
   +.. figure:: /images/Apinzonf_Diagram_camel_lambda0_0.jpg         |.. figure:: /images/Apinzonf_Diagram_camel_lambda20_0.jpg        |.. figure:: /images/Apinzonf_Diagram_camel_lambda50_0.jpg         |.. figure:: /images/Apinzonf_Diagram_camel_lambda300_0.jpg        +
   +   :width: 130px                                                 |   :width: 130px                                                 |   :width: 130px                                                  |   :width: 130px                                                  +
   +   :figwidth: 130px                                              |   :figwidth: 130px                                              |   :figwidth: 130px                                               |   :figwidth: 130px                                               +
   +                                                                 |                                                                 |                                                                  |                                                                  +
   +   Factor: ``0.0``                                               |   Factor: ``-20.0``                                             |   Factor: ``-50.0``                                              |   Factor: ``-300.0``                                             +
   +-----------------------------------------------------------------+-----------------------------------------------------------------+------------------------------------------------------------------+------------------------------------------------------------------+


Border
   Since there is no way to calculate the curvature flow on border edges, they must be controlled separately.
   Border edges are smoothed using a much simpler method, using this property to control the influence.

   Positive values will smooth the vertex positions,
   while negative values will "enhance" them by transforming them in the opposite direction.


   +-----------------------------------------------------------------+-----------------------------------------------------------------+-----------------------------------------------------------------+------------------------------------------------------------------+
   +.. figure:: /images/Apinzonf_GSOC_2012_Diagram_border0_0.jpg     |.. figure:: /images/Apinzonf_GSOC_2012_Diagram_border1_0.jpg     |.. figure:: /images/Apinzonf_GSOC_2012_Diagram_border2_5.jpg     |.. figure:: /images/Apinzonf_GSOC_2012_Diagram_border10_0.jpg     +
   +   :width: 130px                                                 |   :width: 130px                                                 |   :width: 130px                                                 |   :width: 130px                                                  +
   +   :figwidth: 130px                                              |   :figwidth: 130px                                              |   :figwidth: 130px                                              |   :figwidth: 130px                                               +
   +                                                                 |                                                                 |                                                                 |                                                                  +
   +   Border: 0.0                                                   |   Border: 1.0                                                   |   Border: 2.5                                                   |   Border: 10.0                                                   +
   +-----------------------------------------------------------------+-----------------------------------------------------------------+-----------------------------------------------------------------+------------------------------------------------------------------+
   +(with a *factor* of ``2.5``)                                                                                                                                                                                                                                            +
   +-----------------------------------------------------------------+-----------------------------------------------------------------+-----------------------------------------------------------------+------------------------------------------------------------------+


   +-----------------------------------------------------------------+-----------------------------------------------------------------+-----------------------------------------------------------------+------------------------------------------------------------------+
   +.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_border0_0.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_border1_0.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_border5_0.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_border20_0.jpg+
   +   :width: 130px                                                 |   :width: 130px                                                 |   :width: 130px                                                 |   :width: 130px                                                  +
   +   :figwidth: 130px                                              |   :figwidth: 130px                                              |   :figwidth: 130px                                              |   :figwidth: 130px                                               +
   +                                                                 |                                                                 |                                                                 |                                                                  +
   +   Border: 0.0                                                   |   Border: 1.0                                                   |   Border: 5.0                                                   |   Border: 20.0                                                   +
   +-----------------------------------------------------------------+-----------------------------------------------------------------+-----------------------------------------------------------------+------------------------------------------------------------------+
   +(with a *factor* of ``20.0``)                                                                                                                                                                                                                                           +
   +-----------------------------------------------------------------+-----------------------------------------------------------------+-----------------------------------------------------------------+------------------------------------------------------------------+


   +-----------------------------------------------------------------+-----------------------------------------------------------------+-----------------------------------------------------------------+------------------------------------------------------------------+
   +.. figure:: /images/Apinzonf_Diagram_cup_border0_0.jpg           |.. figure:: /images/Apinzonf_Diagram_cup_border20_0.jpg          |.. figure:: /images/Apinzonf_Diagram_cup_border50_0.jpg          |.. figure:: /images/Apinzonf_Diagram_cup_border200_0.jpg          +
   +   :width: 130px                                                 |   :width: 130px                                                 |   :width: 130px                                                 |   :width: 130px                                                  +
   +   :figwidth: 130px                                              |   :figwidth: 130px                                              |   :figwidth: 130px                                              |   :figwidth: 130px                                               +
   +                                                                 |                                                                 |                                                                 |                                                                  +
   +   Border: 0.0                                                   |   Border: -20.0                                                 |   Border: -50.0                                                 |   Border: -200.0                                                 +
   +-----------------------------------------------------------------+-----------------------------------------------------------------+-----------------------------------------------------------------+------------------------------------------------------------------+
   +(with a *factor* of ``-30.0``)                                                                                                                                                                                                                                          +
   +-----------------------------------------------------------------+-----------------------------------------------------------------+-----------------------------------------------------------------+------------------------------------------------------------------+


X, Y, Z
   Toggle buttons to enable/disable deforming vertices in the X, Y and/or Z axis directions.


   +------------------------------------------------------------+----------------------------------------------------------------+---------------------------------------------------------------+--------------------------------------------------------------+
   +.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_axis.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_axis_xyz.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_axis_xy.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_axis_x.jpg+
   +   :width: 130px                                            |   :width: 130px                                                |   :width: 130px                                               |   :width: 130px                                              +
   +   :figwidth: 130px                                         |   :figwidth: 130px                                             |   :figwidth: 130px                                            |   :figwidth: 130px                                           +
   +                                                            |                                                                |                                                               |                                                              +
   +   X, Y, Z: Unselected                                      |   X, Y, Z: Selected                                            |   X, Y: Selected                                              |   X: Selected                                                +
   +------------------------------------------------------------+----------------------------------------------------------------+---------------------------------------------------------------+--------------------------------------------------------------+
   +.. figure:: /images/Apinzonf_GSOC_2012_Diagram_t_axis.jpg   |.. figure:: /images/Apinzonf_GSOC_2012_Diagram_t_axis_xyz.jpg   |.. figure:: /images/Apinzonf_GSOC_2012_Diagram_t_axis_xy.jpg   |.. figure:: /images/Apinzonf_GSOC_2012_Diagram_t_axis_x.jpg   +
   +   :width: 130px                                            |   :width: 130px                                                |   :width: 130px                                               |   :width: 130px                                              +
   +   :figwidth: 130px                                         |   :figwidth: 130px                                             |   :figwidth: 130px                                            |   :figwidth: 130px                                           +
   +                                                            |                                                                |                                                               |                                                              +
   +   X, Y, Z: Unselected                                      |   X, Y, Z: Selected                                            |   X, Y: Selected                                              |   X: Selected                                                +
   +------------------------------------------------------------+----------------------------------------------------------------+---------------------------------------------------------------+--------------------------------------------------------------+


Preserve Volume
   The smoothing process can produce shrinkage.
   That is significant for large *Factor* or large *Repeat* values;
   to reduce that effect you can use this option.

   +-------------------------------------------------------------------+------------------------------------------------------------------+--------------------------------------------------------------------+-------------------------------------------------------------------+
   +.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_volumeFalse.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_volumeTrue.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_volume2False.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_cube_volume2True.jpg+
   +   :width: 130px                                                   |   :width: 130px                                                  |   :width: 130px                                                    |   :width: 130px                                                   +
   +   :figwidth: 130px                                                |   :figwidth: 130px                                               |   :figwidth: 130px                                                 |   :figwidth: 130px                                                +
   +                                                                   |                                                                  |                                                                    |                                                                   +
   +   Off                                                             |   On                                                             |   Off                                                              |   On                                                              +
   +-------------------------------------------------------------------+------------------------------------------------------------------+--------------------------------------------------------------------+-------------------------------------------------------------------+


Vertex Group
   A vertex group name, to constrain the effect to a group of vertices only.
   Allows for selective, real-time smoothing or enhancing, by painting vertex weights.


   +-----------------------------------------------------------+------------------------------------------------------------+--------------------------------------------------------------+---------------------------------------------------------------+
   + Original Geometry                                         + No Group Chosen                                            + Vertex Weights                                               + Result                                                        +
   +===========================================================+============================================================+==============================================================+===============================================================+
   +.. figure:: /images/Apinzonf_GSOC_2012_Diagram_repeat0.jpg |.. figure:: /images/Apinzonf_GSOC_2012_Diagram_lambda2_5.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_femme_paint.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_femme_wgroup.jpg+
   +   :width: 130px                                           |   :width: 130px                                            |   :width: 130px                                              |   :width: 130px                                               +
   +   :figwidth: 130px                                        |   :figwidth: 130px                                         |   :figwidth: 130px                                           |   :figwidth: 130px                                            +
   +-----------------------------------------------------------+------------------------------------------------------------+--------------------------------------------------------------+---------------------------------------------------------------+
   +.. figure:: /images/Apinzonf_GSOC_2012_Diagram_t_normal.jpg|.. figure:: /images/Apinzonf_GSOC_2012_Diagram_t_smooth.jpg |.. figure:: /images/Apinzonf_GSOC_2012_Diagram_t_paint.jpg    |.. figure:: /images/Apinzonf_GSOC_2012_Diagram_t_wgroup.jpg    +
   +   :width: 130px                                           |   :width: 130px                                            |   :width: 130px                                              |   :width: 130px                                               +
   +   :figwidth: 130px                                        |   :figwidth: 130px                                         |   :figwidth: 130px                                           |   :figwidth: 130px                                            +
   +-----------------------------------------------------------+------------------------------------------------------------+--------------------------------------------------------------+---------------------------------------------------------------+
   +.. figure:: /images/Apinzonf_Diagram_camel_vertex0.jpg     |.. figure:: /images/Apinzonf_Diagram_camel_vertex1.jpg      |.. figure:: /images/Apinzonf_Diagram_camel_vertex2.jpg        |.. figure:: /images/Apinzonf_Diagram_camel_vertex3.jpg         +
   +   :width: 130px                                           |   :width: 130px                                            |   :width: 130px                                              |   :width: 130px                                               +
   +   :figwidth: 130px                                        |   :figwidth: 130px                                         |   :figwidth: 130px                                           |   :figwidth: 130px                                            +
   +-----------------------------------------------------------+------------------------------------------------------------+--------------------------------------------------------------+---------------------------------------------------------------+


Normalized
   When enabled, the results will depend on face sizes. When disabled, geometry spikes may occur.


   +-----------------------------------------------------------+-----------------------------------------------------------+-----------------------------------------------------------+-----------------------------------------------------------+
   +.. figure:: /images/Apinzonf_Diagram_monkey_normalized0.jpg|.. figure:: /images/Apinzonf_Diagram_monkey_normalized1.jpg|.. figure:: /images/Apinzonf_Diagram_monkey_normalized2.jpg|.. figure:: /images/Apinzonf_Diagram_monkey_normalized3.jpg+
   +   :width: 130px                                           |   :width: 130px                                           |   :width: 130px                                           |   :width: 130px                                           +
   +   :figwidth: 130px                                        |   :figwidth: 130px                                        |   :figwidth: 130px                                        |   :figwidth: 130px                                        +
   +                                                           |                                                           |                                                           |                                                           +
   +   Original Geometry                                       |   On                                                      |   Off                                                     |   Off, High Factor                                        +
   +-----------------------------------------------------------+-----------------------------------------------------------+-----------------------------------------------------------+-----------------------------------------------------------+


Hints
=====

Meshes with a great number of vertices, more than ten thousand (10,000),
may take several minutes for processing; you can use small portions of the mesh for testing
before executing the modifier on the entire model.


Examples
========

+-------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------+
+.. figure:: /images/Apinzonf_GSOC_2012_Diagram_repeat0.jpg                                                         |.. figure:: /images/Apinzonf_GSOC_2012_Diagram_t_wgroup.jpg                                                        +
+   :width: 200px                                                                                                   |   :width: 200px                                                                                                   +
+   :figwidth: 200px                                                                                                |   :figwidth: 200px                                                                                                +
+                                                                                                                   |                                                                                                                   +
+   `Femme Front blend file <http://wiki.blender.org/index.php/Media:Apinzonf_GSOC_2012_Media_femme_front.blend>`__ |   `Cube Smooth blend file <http://wiki.blender.org/index.php/Media:Apinzonf_GSOC_2012_Media_cube_smooth.blend>`__ +
+-------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------+


See Also
========

- :doc:`Smooth Modifier </modifiers/deform/smooth>`


