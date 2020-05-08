# Marching Cubes
🧊 A graphical program for exploring marching cubes + compute shaders in real-time.

<p align="center">
  <img src="https://raw.githubusercontent.com/mwalczyk/marching-cubes/master/screenshots/marching_cubes.png" alt="screenshot" width="400" height="auto"/>
</p>

## Description

Marching cubes is one of the most widely used algorithms for constructing a polygonal (triangle) mesh from a scalar field. A scalar field can be thought of as a function that, for a given point in 3-space, returns a floating-point (scalar) value. Examples of scalar fields include MRI scan data, signed-distance fields, and other volumes (point clouds, etc.).

The task of marching cubes is to discretize space into a 3D grid and extract an isosurface, which is a surface containing points whose values within the scalar field are a constant (i.e. the "isolevel" - a user-specified float). In particular, each "voxel" (i.e. cell within the grid) can be in one of 256 configurations, depending on which of its 8 vertices are "inside" or "outside" the isosurface. Paul Bourke's method (see the links below) uses a pre-computed edge table and bitwise operators to quickly compute which configuration a voxel is in. From this, we can calculate the necessary vertex information.

The algorithm readily lends itself to parallelization, as the results from any one cell are not dependent on its neighbors. Therefore, we can use GPGPU constructs (in this case, OpenGL compute shaders) to perform the isosurface extraction in real-time.

### Method

The volume data is held within a 3D texture that is "animated" every frame by the first compute shader pass. By default, a (sculpted) noise field is drawn. The next compute shader pass runs the marching cubes algorithm. Specifically, it examines each cell (voxel) of the 3D volume texture and determines which (and how many) triangles to draw. The resulting triangle data (positions and normals) is written into two write-only buffers, which are subsequently used to draw a triangular mesh with a vertex + fragment shader. For now, the normals are calculated by taking the gradient of the signed-distance function (see Inigo Quilez's website below for details).

## Tested On
- Windows 10
- NVIDIA GeForce GTX 1660 Ti

NOTE: this project will only run on graphics cards that support OpenGL [Direct State Access](https://www.khronos.org/opengl/wiki/Direct_State_Access) (DSA).

## To Build
1. Clone this repo and initialize submodules: 
```shell
git submodule init
git submodule update
```
2. From the root directory, run the following commands:
```shell
mkdir build
cd build
cmake ..
```
3. Open the project file for your IDE of choice (generated above)
4. Build and run the project

## To Use

<p align="center">
  <img src="https://github.com/mwalczyk/marching-cubes/blob/master/screenshots/interface.png" alt="screenshot" width="400" height="auto"/>
</p>

Upon launching the application, you should see two separate UI panels labeled:

- **Marching Cubes on the GPU**: contains controls for adjusting the isolevel, mode selection, etc.
- **Debug**: displays different "slices" (layers) of the 3D volume texture

You can choose between five basic modes:
- Fractal noise (default)
- Sphere
- Box
- Torus
- Metaballs

Each mode corresponds to a change in the underlying scalar field that will be used to generate triangles.

You can use your mouse to rotate the model in space. You can zoom in or out with your scroll wheel. Finally, you can "home" (i.e. reset) the current view by pressing `h` on your keyboard.

## To Do
- [ ] Add shadows
- [ ] Add GLSL editor for prototyping SDFs

## Credits
This project was largely inspired by and based on previous work done by [Paul Bourke](http://paulbourke.net/geometry/polygonise/). Many of the functions used for the signed-distance field evaluation are taken from [Inigo Quilez's](https://iquilezles.org/www/articles/distfunctions/distfunctions.htm) amazing website. The 3D noise function is taken from [Patricio Gonzalez Vivo's](https://gist.github.com/patriciogonzalezvivo/670c22f3966e662d2f83) GitHub.

### License
[Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/)
