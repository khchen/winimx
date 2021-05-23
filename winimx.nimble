# Package

version       = "1.0.0"
author        = "Ward"
description   = "Winimx - Winim minified code generator"
license       = "MIT"
skipDirs      = @["examples"]
bin           = @["winimx"]

# winim_version = "3.6.1"

# Dependencies

requires "nim >= 1.4.0", "winim >= 3.6.0", "zippy >= 0.5.7", "jsony >= 1.0.1"

# Examples

task example, "Build the examples":
  withDir "examples":
    exec "cmd /c winimx -s:windef com.nim clr.nim keywords.txt > miniwinim.nim"
    exec "nim c hellowin"
    exec "nim c VBScript_RegExp.nim"
    exec "nim c simple_gui.nim"

# Clean

task clean, "Delete all the executable files":
  exec "cmd /c IF EXIST *.exe del *.exe"
  exec "cmd /c IF EXIST examples\\*.exe del examples\\*.exe"
  rmFile "examples/miniwinim.nim"
