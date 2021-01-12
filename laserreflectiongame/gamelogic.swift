//
//  gamelogic.swift
//  laserreflectiongame
//
//  Created by Owner on 11/29/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

var gamestate:GameState = GameState.gameinit

func gamestartinit(){
    //fieldは外で行う。
    
    touchy = -1
    touchx = -1

    goaly = 0
    goalx = 0
    lasersideupin = false

    //lasersideinit
    laservactor = LaserVector.right
    lasersidexplus = 0
    lasersideyplus = 0
    lasersideactive = true
    
    //laserupinit
    laserupxplus = 0
    laserupyplus = 0
    laserupactive = false
    
    laserreflectmirrorcollision = 0
    reflectflag = 1
}
func gamestartlaser(gamemode:GameMode){
        currentlaserside.zPosition = 3
    if gamemode == GameMode.easy{
        currentlaserside.position.y = 70
        currentlaserside.position.x = -180
    }
    if gamemode == GameMode.normal{
        currentlaserside.position.y = 93
        currentlaserside.position.x = -180
    }
    if gamemode == GameMode.hard{
        currentlaserside.position.y = 101
        currentlaserside.position.x = -187
    }
    currentlaserup.zPosition = 3
        currentlaserup.position.y = 500
        currentlaserup.position.x = 0
}
func gamestartinit(BlockPatternLevel:[[Int]],blocklevel:inout [[Block]],gamemode:GameMode){
    for i in 0..<fieldy{
        for j in 0..<fieldx{
            //blocklevelinit
            var block = Block(pattern: BlockType.none,piecenode:floorclear95.copy() as! SKSpriteNode,numbery:i,numberx:j,covernode:floorclear95.copy() as! SKSpriteNode)
            
            generetefieldblock(blockpatternlevel: BlockPatternLevel, block: &block,
                               numbery:i, numberx:j,gamemode: gamemode)
            setfieldblock(block:block,blocklevel: &blocklevel, numbery: i, numberx: j)
            scene1.addChild(blocklevel[i][j].piecenode)

        }
    }
}
func coversetanddraw(BlockPatternLevel:[[Int]],blocklevel:inout [[Block]],laservector:LaserVector){
    for i in 0..<fieldy{
        for j in 0..<fieldx{
            setcovermirror(blockpatternlevel: BlockPatternLevel, blocklevel: &blocklevel, y: i, x: j,laservactor: laservactor,gamemode: gamemode)
            scene1.addChild(blocklevel[i][j].covernode)
        }
    }
}
func firstcoverset(blockpatternlevel:inout [[Int]],blocklevelcounter:inout Int,Blocklevelcounter:Int,mirrormakesuccess:inout BlockMake,mirrorisdiscover:inout Bool,number1Xmaxset:Int,number1Xminset:Int,number2Ymaxset:Int,number2Yminset:Int,firstx:inout Int,secondy:inout Int){
        
    blocklevelcounter = Blocklevelcounter
    mirrormakesuccess = BlockMake.success
    mirrorisdiscover = true

    blocklaservactor = LaserVector.right
    blockpatterny = 1
    blockpatternx = Int(arc4random()%UInt32(number1Xmaxset-number1Xminset+1) + UInt32(number1Xminset))
    blockpatternlevel[blockpatterny][blockpatternx] = 2
    firstx = blockpatternx
    blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
    //print(blockpatterny)
    //print(blockpatternx)
    //print(blocklaservactor)
    
    blockpatterny = Int(arc4random()%UInt32((fieldy-number2Ymaxset)-number2Yminset+1) + UInt32(number2Yminset))
    blockpatternlevel[blockpatterny][blockpatternx] = Int(arc4random()%UInt32(3-2+1)+UInt32(2))
    secondy = blockpatterny
    blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
    //print(blockpatterny)
    //print(blockpatternx)
    //print(blocklaservactor)
}
func touchinit(blockpatternlevel:inout [[Int]],Blocklevelcounter:Int,number1Xmaxset:Int,number1Xminset:Int,number2Ymaxset:Int,number2Yminset:Int){

    var blocklevelcounter = Blocklevelcounter
    var mirrormakesuccess = BlockMake.success
    var mirrorisdiscover = true
    var firstx = 0
    var secondy = 0
    
    firstcoverset(blockpatternlevel: &blockpatternlevel, blocklevelcounter: &blocklevelcounter, Blocklevelcounter: Blocklevelcounter, mirrormakesuccess: &mirrormakesuccess, mirrorisdiscover: &mirrorisdiscover,number1Xmaxset: number1Xmaxset,number1Xminset: number1Xminset, number2Ymaxset: number2Ymaxset, number2Yminset: number2Yminset,firstx: &firstx,secondy: &secondy)
    
    while true{
        mirrorisdiscover =  lasermirrordiscover(blockpatternlevel: blockpatternlevel)
        if mirrorisdiscover == true{
            blocklevelcounter -= 1
            //print(blockpatterny)
            //print(blockpatternx)
            //print(blocklaservactor)
            //print("mirrodiscoverskip")
        }else if mirrorisdiscover == false{
            mirrormakesuccess =  mirrorset(blockpatternlevel: &blockpatternlevel)
            if mirrormakesuccess == BlockMake.success{
                blocklevelcounter -= 1
            }else if mirrormakesuccess == BlockMake.miss{
                //print("miss")
                for i in 1..<fieldy-1{
                    for j in 1..<fieldx-1{
                        blockpatternlevel[i][j] = 1
                    }
                }
                firstcoverset(blockpatternlevel: &blockpatternlevel, blocklevelcounter: &blocklevelcounter, Blocklevelcounter: Blocklevelcounter, mirrormakesuccess: &mirrormakesuccess, mirrorisdiscover: &mirrorisdiscover,number1Xmaxset: number1Xmaxset,number1Xminset: number1Xminset, number2Ymaxset: number2Ymaxset, number2Yminset: number2Yminset,firstx: &firstx,secondy: &secondy)
                continue
            }
            //print(blockpatterny)
            //print(blockpatternx)
            //print(blocklaservactor)
            //print(mirrormakesuccess)
            //goalを外すことでミラーの枚数を増やす
            if mirrormakesuccess == BlockMake.goal{
                for i in 1..<fieldy-1{
                    for j in 1..<fieldx-1{
                        blockpatternlevel[i][j] = 1
                    }
                }
                firstcoverset(blockpatternlevel: &blockpatternlevel, blocklevelcounter: &blocklevelcounter, Blocklevelcounter: Blocklevelcounter, mirrormakesuccess: &mirrormakesuccess, mirrorisdiscover: &mirrorisdiscover,number1Xmaxset: number1Xmaxset,number1Xminset: number1Xminset, number2Ymaxset: number2Ymaxset, number2Yminset: number2Yminset,firstx: &firstx,secondy: &secondy)
                continue
            }
        }
        if blocklevelcounter <= 0{
            //ミラーが４枚重なるとクソゲーになるので外す
            var loopflag = false
            loopseek(blockpatternlevel: blockpatternlevel, loopflag: &loopflag)
            //ループ防止
            for j in 1..<firstx{
                if blockpatternlevel[1][j] == 2 || blockpatternlevel[1][j] == 3{
                    //print("patternx")
                    loopflag = true
                    break
                }
            }
            for i in 2..<secondy{
                if blockpatternlevel[i][firstx] == 2 || blockpatternlevel[i][firstx] == 3{
                    //print("patterny")
                    loopflag = true
                    break
                }
            }
            if loopflag == true{
                for i in 1..<fieldy-1{
                    for j in 1..<fieldx-1{
                        blockpatternlevel[i][j] = 1
                    }
                }
                firstcoverset(blockpatternlevel: &blockpatternlevel, blocklevelcounter: &blocklevelcounter, Blocklevelcounter: Blocklevelcounter, mirrormakesuccess: &mirrormakesuccess, mirrorisdiscover: &mirrorisdiscover,number1Xmaxset: number1Xmaxset,number1Xminset: number1Xminset, number2Ymaxset: number2Ymaxset, number2Yminset: number2Yminset,firstx: &firstx,secondy: &secondy)
            }else{
            //print(blocklevelcounter)
            //print("blockmakeend")
            break
            }

        }
    }
}

func numberinit(){
        for i in 1..<11{
        let numberdemo:SKSpriteNode
        let numberrect = CGRect(x: 40*(i-1), y: 0, width: 40, height: 85)
        numberdemo = imagetonode(imagename: "number.png", triming: numberrect)
        //point
        numberdemo.zPosition = 5
        numberdemo.position.x = 0
        numberdemo.position.y = 0
        numbernode.append(numberdemo)
    }
}
func numbersdisplay(numbers:Int,digits:inout Int,outnumbers:inout [SKSpriteNode],positionx:Int,positiony:Int,positionz:Int){
    digits = 1
    var tempnumbers = 0
    tempnumbers = numbers
    while true {
        tempnumbers = tempnumbers / 10
        if tempnumbers <= 0 {
            break
        }
        digits += 1
    }
    numberstore(numbers: numbers, digits: digits)
    outnumbers = []
    for c in 0..<digits{
        drawnumbers(numbers:&outnumbers,i:c,number:numbersstore[c], positionX:(CGFloat)(positionx-40*c), positionY:(CGFloat)(positiony), Zposition:(CGFloat(positionz)))
    }
    for c in 0..<digits{
        scene1.addChild(outnumbers[c])
    }
}
