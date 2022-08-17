# Winimx
[Winim](https://github.com/khchen/winim) contains a lot of Windows SDK definitions, so the source that `import winim` often needs a lot of time to compile, especially for large project (for example, [wNim](https://github.com/khchen/wNim)).

Here is the solution.  Winimx  is a standalone tool to generate the minfied Winim module. It catches all identifiers from source files and outputs necessary definitions. The input can be nim source file or just keyword list. Wildcard is allowed. For example, [here](https://gist.github.com/khchen/101aa8c0783ff821216bc7d1608e3896) is the steps to create minified `winim/clr` module.

Furthermore, winimx also can be used as a nim module to generate the definitions at compile time. In general, you should add following lines at beginning of file:

    import winimx, winim/[winstr, utils]
    winimx currentSourcePath()

Second winimx  is a template here. It accepts one or multiple filenames and use system.gorge() to call *winimx.exe*. Notice, the filenames  **must include the full path**, otherwise winimx cannot find it (There is no getAppDir() at compile time for now). Here is a technic to get the full path of source code directory:

    import os
    winimx currentSourcePath().parentDir() / "keywords.txt"

If *winimx* is installed by nimble, the *winimx.exe* should be placed in the correct directory to use. In other case, you should make sure *winimx.exe* can be found by system (add to %PATH%).

## License
Read license.txt for more details.

Copyright (c) 2016-2022 Kai-Hung Chen, Ward. All rights reserved.
