//
//  define.swift
//  laserreflectiongame
//
//  Created by Owner on 9/6/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

import SpriteKit
import GameplayKit

let userdefaults = UserDefaults.standard

var background = SKSpriteNode(imageNamed: "background")
var gameover = SKSpriteNode(imageNamed: "gameover")
var correct = SKSpriteNode(imageNamed: "correct")
var end = SKSpriteNode(imageNamed: "end")

let gameoverlabel = SKLabelNode()
let correctlabel = SKLabelNode()

var xstartpiece = CGFloat(-142.5)
var ystartpiece = CGFloat(72)

var fieldx = 0
var fieldy = 0

var touchy = -1
var touchx = -1

var goaly = 0
var goalx = 0

var easycounter = 0
var normalcounter = 0
var hardcounter = 0

var laserreflectmirrorcollision = 0
var reflectflag = 0

var currentmirrorpositiony = 0
var currentmirrorpositionx = 0
//easy leftrightはカーバーの部分、レーザーrightの時の時up上に行くかdown下に行くか
var floor95 = SKSpriteNode(imageNamed: "floor95")
var floorclear95 = SKSpriteNode(imageNamed: "floorclear95")
var mirrordown95 = SKSpriteNode(imageNamed: "mirrordown95")
var mirrorleftdown95 = SKSpriteNode(imageNamed: "mirrorleftdown95")
var mirrorrightdown95 = SKSpriteNode(imageNamed: "mirrorrightdown95")
var mirrorup95 = SKSpriteNode(imageNamed: "mirrorup95")
var mirrorleftup95 = SKSpriteNode(imageNamed: "mirrorleftup95")
var mirrorrightup95 = SKSpriteNode(imageNamed: "mirrorrightup95")
let easyfieldy = 6
let easyfieldx = 6
let easytime = 10

var floor54 = SKSpriteNode(imageNamed: "floor54")
var floorclear54 = SKSpriteNode(imageNamed: "floorclear54")
var mirrordown54 = SKSpriteNode(imageNamed: "mirrordown54")
var mirrorleftdown54 = SKSpriteNode(imageNamed: "mirrorleftdown54")
var mirrorrightdown54 = SKSpriteNode(imageNamed: "mirrorrightdown54")
var mirrorup54 = SKSpriteNode(imageNamed: "mirrorup54")
var mirrorleftup54 = SKSpriteNode(imageNamed: "mirrorleftup54")
var mirrorrightup54 = SKSpriteNode(imageNamed: "mirrorrightup54")
let normalfieldy = 9
let normalfieldx = 9
let normaltime = 15

var floor38 = SKSpriteNode(imageNamed: "floor38")
var floorclear38 = SKSpriteNode(imageNamed: "floorclear38")
var mirrordown38 = SKSpriteNode(imageNamed: "mirrordown38")
var mirrorleftdown38 = SKSpriteNode(imageNamed: "mirrorleftdown38")
var mirrorrightdown38 = SKSpriteNode(imageNamed: "mirrorrightdown38")
var mirrorup38 = SKSpriteNode(imageNamed: "mirrorup38")
var mirrorleftup38 = SKSpriteNode(imageNamed: "mirrorleftup38")
var mirrorrightup38 = SKSpriteNode(imageNamed: "mirrorrightup38")
let hardfieldy = 12
let hardfieldx = 12
let hardtime = 20
//1.1で固定
var blockpatterny = 1
var blockpatternx = 1

var blocklevelcounter = 6
var gamemode = GameMode.easy

var numbernode:[SKSpriteNode] = []

var score = 0
var scorenumbers:[SKSpriteNode] = []
var scoredigits = 0

var time = 0
var timenumbers:[SKSpriteNode] = []
var timedigits = 0
var passedtime = 0
var passedtimecounter = 0

var numbersstore:[Int] = []

enum BlockType:Int{
    case none
    case space
    case mirrordown
    case mirrorup
    //もしかしたらいらない
    case mirrorleftup
    case mirrorleftdown
}
enum LaserVector:Int{
    case right
    case down
    case left
    case up
    case stop
}
enum GameState:Int{
    case nodeinit
    case touchinit
    case playertouch
    case gameinit
    case gamemain
    case answer
    case clear
    case gameover
    case clearselect
    case gameoverselect
    case allclear
}
enum GameMode:Int{
    case easy
    case normal
    case hard
}
enum BlockMake:Int{
    case success
    case miss
    case goal
    case onemore
}
