# This is just an example to get you started. A typical hybrid package
# uses this file as the main entry point of the application.

import os

import colormapgenpkg/readCM
import colormapgenpkg/writeCM

when isMainModule:

  let argSeq = commandLineParams()
  assert argSeq.len() > 0, "Usage: ./colormapgen COLOR_MAP_NAME"
  let cmName = argSeq[0]

  let cmData = readColorMapFile("colormaps/" & cmName & ".txt")
  cmData.writeColorMapNim(cmName, cmName & ".nim")
