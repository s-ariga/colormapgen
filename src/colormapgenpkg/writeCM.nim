# Seiichi Ariga <seiichi.ariga@gmail.com>

# Nimの2次元seqとして読み込めるように出力

proc writeColorMapNim*(cmData: seq[seq[float]], cmName: string, ofName: string) =
    assert cmData.len() == 256, "カラーマップの色数が255ではありません"

    var f = open(ofName, fmWrite)
    defer: f.close()

    f.writeLine("# Color map generated from: https://www.fabiocrameri.ch/colourmaps/ \n")
    f.writeLine("let " & cmName & ": seq[seq[float]] =")
    f.writeLine("  [")
    for i in 0..<cmData.len()-1:
        f.writeLine("    [" & $cmData[i][0] & ", " & $cmData[i][1] & ", " & $cmData[i][2] & "],")
    f.writeLine("    [" & $cmData[cmData.len()-1][0] & ", " & $cmData[cmData.len()-1][1] & ", " & $cmData[cmData.len()-1][2] & "]")
    f.writeLine("  ]")


