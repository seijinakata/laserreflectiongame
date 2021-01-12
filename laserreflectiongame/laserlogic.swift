//
//  laserlogic.swift
//  laserreflectiongame
//
//  Created by Owner on 12/27/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

func loopseek(blockpatternlevel:[[Int]],loopflag:inout Bool){
    
    loopflag = false
    var starty = 0
    var startx = 0
    var movey = 0
    var movex = 0
    var seekflag = true
    
    for i in 1..<fieldy-1{
        for j in 1..<fieldx-1{
            if blockpatternlevel[i][j] == 3{
                starty = i
                startx = j
                movey = i
                movex = j
                //右を調べる
                for x in movex+1..<fieldx{
                    if blockpatternlevel[movey][x] == 2{
                        movex = x
                        break
                    }
                    if blockpatternlevel[movey][x] == 3{
                        seekflag = false
                        break
                    }
                    if x >= fieldx-1{
                        seekflag = false
                    }
                }
                if seekflag == false{
                    seekflag = true
                   continue
                }
                //下を調べる
                for y in movey+1..<fieldy{
                    if blockpatternlevel[y][movex] == 2{
                        seekflag = false
                        break
                    }
                    if blockpatternlevel[y][movex] == 3{
                        movey = y
                        break
                    }
                    if y >= fieldy-1{
                        seekflag = false
                    }
                }
                   if seekflag == false{
                       seekflag = true
                      continue
                   }
                //左を調べる
                for x in (0..<movex).reversed(){
                    if blockpatternlevel[movey][x] == 2{
                        movex = x
                        break
                    }
                    if blockpatternlevel[movey][x] == 3{
                        seekflag = false
                        break
                    }
                    if x <= 0{
                        seekflag = false
                    }
                }
                if seekflag == false{
                    seekflag = true
                   continue
                }
                //上を調べる
                for y in (0..<movey).reversed(){
                    if blockpatternlevel[y][movex] == 2{
                        seekflag = false
                        break
                    }
                    if blockpatternlevel[y][movex] == 3{
                        movey = y
                        break
                    }
                    if y <= 0{
                        seekflag = false
                    }
                }
                   if seekflag == false{
                       seekflag = true
                      continue
                   }
                
                if starty == movey && startx == movex{
                    loopflag = true
                    break
                }
            }
        }
    }
}

func lasermirrordiscover(blockpatternlevel:[[Int]])->Bool{
    //自分の方からマスを数える
     if blocklaservactor == LaserVector.right{
         var xcounter = blockpatternx+1
        while true{
             if blockpatternlevel[blockpatterny][xcounter] == 2 || blockpatternlevel[blockpatterny][xcounter] == 3{
                 blockpatternx = xcounter
                    blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
                 return true
             }
             //print(xcounter)
             if xcounter >= fieldx-1{
                return false
             }
             xcounter += 1
         }
     }else  if blocklaservactor == LaserVector.down{
         var ycounter = blockpatterny+1
         while true{
             if blockpatternlevel[ycounter][blockpatternx] == 2 || blockpatternlevel[ycounter][blockpatternx] == 3{
                 blockpatterny = ycounter
                    blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
                    return true
            }
             //print(ycounter)
             if ycounter >= fieldy-1{
                return false
             }
             ycounter += 1
         }
     }else if blocklaservactor == LaserVector.left{
         var xcounter = blockpatternx-1
         while true{
             if blockpatternlevel[blockpatterny][xcounter] == 2 || blockpatternlevel[blockpatterny][xcounter] == 3{
                 blockpatternx = xcounter
                    blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
                return true
             }
             //print(xcounter)
             if xcounter <= 0{
                return false
             }
             xcounter -= 1
         }
     }else  if blocklaservactor == LaserVector.up{
         var ycounter = blockpatterny-1
         while true{
             if blockpatternlevel[ycounter][blockpatternx] == 2 || blockpatternlevel[ycounter][blockpatternx] == 3{
                 blockpatterny = ycounter
                    blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
                return true
             }
             //print(ycounter)
             if ycounter <= 0{
                return false
             }
             ycounter -= 1
         }
     }
    return false
}

func mirrorset(blockpatternlevel:inout [[Int]])->BlockMake{
    if blocklaservactor == LaserVector.right{
        let temppatternx = (fieldx-2)-(blockpatternx+1)+1
        if temppatternx == 0{
            return BlockMake.goal
        }
        blockpatternx = Int(arc4random()%UInt32(temppatternx) + UInt32(blockpatternx+1))
        if blockpatterny == 1 && blockpatternx == 1 {
            return BlockMake.miss
        }
        blockpatternlevel[blockpatterny][blockpatternx] = Int(arc4random()%UInt32(3-2+1)+UInt32(2))
        blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
            return BlockMake.success
    }else  if blocklaservactor == LaserVector.down{
        let temppatterny = (fieldy-2)-(blockpatterny+1)+1
        if temppatterny == 0{
            return BlockMake.goal
        }
        blockpatterny = Int(arc4random()%UInt32(temppatterny) + UInt32(blockpatterny+1))
        if blockpatterny == 1 && blockpatternx == 1 {
            return BlockMake.miss
        }
        blockpatternlevel[blockpatterny][blockpatternx] = Int(arc4random()%UInt32(3-2+1)+UInt32(2))
         blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
            return BlockMake.success
    }else if blocklaservactor == LaserVector.left{
        let temppatternx = (blockpatternx-1)-1+1
        if temppatternx == 0{
            return BlockMake.goal
        }
        blockpatternx = Int(arc4random()%UInt32(temppatternx) + UInt32(1))
        if blockpatterny == 1 && blockpatternx == 1 {
            return BlockMake.miss
        }
        blockpatternlevel[blockpatterny][blockpatternx] = Int(arc4random()%UInt32(3-2+1)+UInt32(2))
        blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
            return BlockMake.success
    }else  if blocklaservactor == LaserVector.up{
        let temppatterny = (blockpatterny-1)-1+1
        if temppatterny == 0{
            return BlockMake.goal
        }
        blockpatterny = Int(arc4random()%UInt32(temppatterny) + UInt32(1))
        if blockpatterny == 1 && blockpatternx == 1 {
            return BlockMake.miss
        }
        blockpatternlevel[blockpatterny][blockpatternx] = Int(arc4random()%UInt32(3-2+1)+UInt32(2))
        blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
        return BlockMake.success
    }
    return BlockMake.onemore
}
