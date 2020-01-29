# marching cubes
🧊 A graphical program for exploring marching cubes + compute shaders in real-time.

<p align="center">
  <img src="https://github.com/mwalczyk/marching-cubes/blob/master/screenshots/marching_cubes.png" alt="screenshot" width="400" height="auto"/>
</p>

## Description

Some information about the marching cubes algorithm.

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

You can use your mouse to rotate the model in space. You can zoom in or out with your scroll wheel. Finally, you can "home" (i.e. reset) the current view by pressing `h` on your keyboard.

## To Do
- [ ] Add shadows

## Credits
This project was largely inspired by and based on previous work done by [Paul Bourke](http://paulbourke.net/geometry/polygonise/). Many of the functions used for the signed-distance field evaluation are taken from [Inigo Quilez's](https://iquilezles.org/www/articles/distfunctions/distfunctions.htm) amazing website.

### License
[Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/)
