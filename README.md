# C++ OpenGL Project Template

## Components
1. [OpenGL](https://www.opengl.org/) (Obviously)
2. [GLFW](https://github.com/glfw/glfw) (abstracts window handling, mouse, keyboard and etc...)
3. [linmath](https://github.com/datenwolf/linmath.h) (linear algebra)
4. [stb_image](https://github.com/nothings/stb/blob/master/stb_image.h) (image loading)

## Building
1. Make sure you have cmake installed. Windows installer [here](https://github.com/Kitware/CMake/releases/download/v3.26.1/cmake-3.26.1-windows-x86_64.msi).
2. Open a terminal/cmd and move to the root directory.
3. Run one of the following commands depending on your platform:
* Linux/MacOS: `cmake -S. -Bbuild`
* Windows (MinGW): `cmake -S. -Bbuild -G"MinGW Makefiles"`
* Windows (MSVC): `cmake -S. -Bbuild -G"Visual Studio {major-version-number} {release-year}"`

  **NOTE**: Those commands may take a while to finish because they download GLFW.
    
4. Run `cmake --build build`.
5. You should be able to see and run an executable called **example** inside a new directory called build.

## PLEASE READ THIS
Jesus loves you and wants to protect us, help us, bring happiness to us and save us from hell.
Give him the chance. Give yourself the chance!
If you remotely feel something, please watch this: https://www.youtube.com/watch?v=ZXqQGuAt7SE.
It's just 3 minutes long.
