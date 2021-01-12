//
//  Block.swift
//  laserreflectiongame
//
//  Created by Owner on 9/6/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

import SpriteKit
import GameplayKit

struct Block{
    var pattern:BlockType
    var piecenode:SKSpriteNode
    var numbery:Int
    var numberx:Int
    var covernode:SKSpriteNode
}
var BlockPatternLevel:[[Int]] = [[]]
var Blockpatternlevel1:[[Int]]
    =  [[0,0,0,0,0,0],
        [0,1,1,1,1,0],
        [0,1,1,1,1,0],
        [0,1,1,1,1,0],
        [0,1,1,1,1,0],
        [0,0,0,0,0,0]]

var Blockpatternlevel2:[[Int]]
=  [[0,0,0,0,0,0,0,0,0],
    [0,1,1,1,1,1,1,1,0],
    [0,1,1,1,1,1,1,1,0],
    [0,1,1,1,1,1,1,1,0],
    [0,1,1,1,1,1,1,1,0],
    [0,1,1,1,1,1,1,1,0],
    [0,1,1,1,1,1,1,1,0],
    [0,1,1,1,1,1,1,1,0],
    [0,0,0,0,0,0,0,0,0]]

var Blockpatternlevel3:[[Int]]
=  [[0,0,0,0,0,0,0,0,0,0,0,0],
    [0,1,1,1,1,1,1,1,1,1,1,0],
    [0,1,1,1,1,1,1,1,1,1,1,0],
    [0,1,1,1,1,1,1,1,1,1,1,0],
    [0,1,1,1,1,1,1,1,1,1,1,0],
    [0,1,1,1,1,1,1,1,1,1,1,0],
    [0,1,1,1,1,1,1,1,1,1,1,0],
    [0,1,1,1,1,1,1,1,1,1,1,0],
    [0,1,1,1,1,1,1,1,1,1,1,0],
    [0,1,1,1,1,1,1,1,1,1,1,0],
    [0,1,1,1,1,1,1,1,1,1,1,0],
    [0,0,0,0,0,0,0,0,0,0,0,0]]
//二次元配列定義
//max12
//var BlockLevel:[[Block]] = [[]]
var Blocklevel1:[[Block]] = [[],[],[],[],[],[]]
var Blocklevel2:[[Block]] = [[],[],[],[],[],[],[],[],[]]
var Blocklevel3:[[Block]] = [[],[],[],[],[],[],[],[],[],[],[],[]]
//.append([])３次元追加
