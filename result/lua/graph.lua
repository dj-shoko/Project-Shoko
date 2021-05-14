local module = {}

module.gaugegraph = {{
  id = "gaugegraph",
  assistClearBGColor = "440044"; --Purple
  assistAndEasyFailBGColor = "004444"; --Cyan
  grooveFailBGColor = "004400"; --Green
  grooveClearAndHardBGColor = "440000"; --Red
  exHardBGColor = "444400"; --Door Hinge
  hazardBGColor = "444444"; --White

  assistClearLineColor = "ff00ff"; --Purple
  assistAndEasyFailLineColor = "00ffff"; --Cyan
  grooveFailLineColor = "00ff00"; --Green
  grooveClearAndHardLineColor = "ff0000"; --Red
  exHardLineColor = "ffff00"; --Door Hinge
  hazardLineColor = "cccccc"; --White
  
  borderlineColor = "ff0000"; --Red
  borderColor = "440000"; --Red
  }
}

module.judgegraph = {
  {id = "judgegraph_timing",
  type = 1,
  noGap = 0,
  orderReverse = 1,
  backTexOff = 1},
}

module.timingdistributiongraph = {
  {id = "timingdistributiongraph"}
}

return module
