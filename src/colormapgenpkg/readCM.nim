# Seiichi Ariga <seiichi.ariga@gmail.com>

# ファイル読み込み
# color mapファイルは、以下の仕様
# 1. 1行にRGBが1つずつ0<=c<=1の小数点で表現
# 2. 上記の行が255行で255色、1つのカラーマップを表現

import os
import strutils

proc getWelcomeMessage*(): string = "Hello, World!"

# 指定されたファイルを読み込んで、Colorマップの2次元配列として返す
proc readColorMapFile*(rfName: string): seq[seq[float]] =
    assert fileExists(rfName) , "File: " & rfName & " does not exist."

    let f = open(rfName)
    defer: f.close()

    var row: seq[seq[float]] = @[]
    while not f.endOfFile:
        let line = f.readLine()
        let rgb = line.split(' ')

        var col: seq[float]
        for c in rgb:
            col.add(c.parseFloat())
        row.add(col)
    
    assert row.len() == 256, "カラーマップの色数が255ではありません"
    echo row
    return row
