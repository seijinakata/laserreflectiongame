//
//  gamemain.swift
//  laserreflectiongame
//
//  Created by Owner on 12/10/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

func wheretouch(blocklevel:[[Block]],touchposition:inout Block,pos:CGPoint){
    for i in 0..<fieldy{
        for j in 0..<fieldx{
            let touchin =  laserposition(y: i, x: j, Blocklevel: blocklevel, blockpositionout: &touchposition,laserpositiony:pos.y,laserpositionx:pos.x)
            if touchin == true && touchposition.numbery == 1 && j != 0 &&
                j != (fieldx - 1){
                touchy = 1
                touchx = j
                gamestate = GameState.gameinit
                //print(touchy,touchx)
                break
            }else if touchin == true && touchposition.numbery == (fieldy - 2) && j != 0 &&
                j != (fieldx - 1){
                touchy = (fieldy - 2)
                touchx = j
                gamestate = GameState.gameinit
                //print(touchy,touchx)
                break;
            }else if touchin == true && touchposition.numberx == 1 && i != 0 &&
                i != (fieldy - 1){
                touchy = i
                touchx = 1
                gamestate = GameState.gameinit
                //print(touchy,touchx)
                break;
            }else if touchin == true && touchposition.numberx == (fieldx - 2) && i != 0 &&
                i != (fieldy - 1){
                touchy = i
                touchx = (fieldx - 2)
                gamestate = GameState.gameinit
                //print(touchy,touchx)
                break;
            }
        }
    }
}

func gamemain(BlockLevel: inout [[Block]],blockpatternlevel:[[Int]],gamemode:GameMode){
    //laserpositoninit
     var blocklaserposition1 = Block(pattern: BlockType.none,piecenode:floorclear95.copy() as! SKSpriteNode,numbery:0,numberx:0,covernode:floorclear95.copy() as! SKSpriteNode)
   //firstcollision
    if laserreflectmirrorcollision == 0{
           if laservactor == LaserVector.right || laservactor == LaserVector.left{
               for i in 0..<fieldy{
                   for j in 0..<fieldx{
                       lasersideupin =  laserposition(y: i, x: j, Blocklevel: BlockLevel, blockpositionout: &blocklaserposition1,laserpositiony:currentlaserside.position.y,laserpositionx:currentlaserside.position.x)
                       if lasersideupin == true && (blocklaserposition1.pattern == BlockType.mirrordown || blocklaserposition1.pattern == BlockType.mirrorup){
                           currentmirrorpositiony = i
                           currentmirrorpositionx = j
                           reflectflag = 1
                           laserreflectmirrorcollision = 1
                           break
                       }
                   }
               }
           }else if laservactor == LaserVector.down || laservactor == LaserVector.up{
               for i in 0..<fieldy{
                   for j in 0..<fieldx{
                       lasersideupin =  laserposition(y: i, x: j, Blocklevel: BlockLevel, blockpositionout: &blocklaserposition1,laserpositiony:currentlaserup.position.y,laserpositionx:currentlaserup.position.x)
                       if lasersideupin == true && (blocklaserposition1.pattern == BlockType.mirrordown || blocklaserposition1.pattern == BlockType.mirrorup){
                           currentmirrorpositiony = i
                           currentmirrorpositionx = j
    
                           reflectflag = 1
                           laserreflectmirrorcollision = 1
                           break
                       }
                   }
               }        }
       //secondmirrorinfirst
       }
       if laserreflectmirrorcollision == 1 {
           if reflectflag == 1 {
               if BlockLevel[currentmirrorpositiony][currentmirrorpositionx].pattern == BlockType.mirrordown{
                   if laservactor == LaserVector.right || laservactor == LaserVector.left{
                       currentlaserside.position.y = 500
                       currentlaserside.position.x = 0
                       currentlaserup.position.y = BlockLevel[currentmirrorpositiony][currentmirrorpositionx].piecenode.position.y
                       currentlaserup.position.x =
                           BlockLevel[currentmirrorpositiony][currentmirrorpositionx].piecenode.position.x
                       lasermirrordownchange(laserchangevactor: &laservactor, laserxplus: &laserupxplus, laseryplus: &laserupyplus, laservactor: laservactor)
                        lasersideyplus = 0
                        lasersidexplus = 0
                       
                   }else  if laservactor == LaserVector.down || laservactor == LaserVector.up{
                       currentlaserup.position.y = 500
                       currentlaserup.position.x = 0
                       currentlaserside.position.y = BlockLevel[currentmirrorpositiony][currentmirrorpositionx].piecenode.position.y
                       currentlaserside.position.x =
                           BlockLevel[currentmirrorpositiony][currentmirrorpositionx].piecenode.position.x
                       lasermirrordownchange(laserchangevactor: &laservactor, laserxplus: &lasersidexplus, laseryplus: &lasersideyplus, laservactor: laservactor)
                        laserupyplus = 0
                        laserupxplus = 0
                   }
               }else if BlockLevel[currentmirrorpositiony][currentmirrorpositionx].pattern == BlockType.mirrorup{
                        if laservactor == LaserVector.right || laservactor == LaserVector.left{
                            currentlaserside.position.y = 500
                            currentlaserside.position.x = 0
                            currentlaserup.position.y = BlockLevel[currentmirrorpositiony][currentmirrorpositionx].piecenode.position.y
                            currentlaserup.position.x =
                                BlockLevel[currentmirrorpositiony][currentmirrorpositionx].piecenode.position.x
                            lasermirrorupchange(laserchangevactor: &laservactor, laserxplus: &laserupxplus, laseryplus: &laserupyplus, laservactor: laservactor)
                            lasersideyplus = 0
                            lasersidexplus = 0
                            
                        }else  if laservactor == LaserVector.down || laservactor == LaserVector.up{
                            currentlaserup.position.y = 500
                            currentlaserup.position.x = 0
                            currentlaserside.position.y = BlockLevel[currentmirrorpositiony][currentmirrorpositionx].piecenode.position.y
                            currentlaserside.position.x =
                                BlockLevel[currentmirrorpositiony][currentmirrorpositionx].piecenode.position.x
                            lasermirrorupchange(laserchangevactor: &laservactor, laserxplus: &lasersidexplus, laseryplus: &lasersideyplus, laservactor: laservactor)
                            laserupyplus = 0
                            laserupxplus = 0
                        }
               }
            
            for i in 0..<fieldy{
                for j in 0..<fieldx{
                BlockLevel[i][j].covernode.removeFromParent()
                }
            }
             for i in 0..<fieldy{
                for j in 0..<fieldx{
                    if !(i == currentmirrorpositiony && j == currentmirrorpositionx){
                        setcovermirror(blockpatternlevel: blockpatternlevel, blocklevel: &BlockLevel, y: i, x: j,laservactor: laservactor,gamemode: gamemode)
                    }
                }
            }
            for i in 0..<fieldy{
                for j in 0..<fieldx{
                    scene1.addChild(BlockLevel[i][j].covernode)
                }
            }
            reflectflag = 0
           }
           //mirrorcoverflag mineout
           var laserin = true
           if laservactor == LaserVector.right || laservactor == LaserVector.left{
               laserin =  laserposition(y: currentmirrorpositiony,x: currentmirrorpositionx, Blocklevel: BlockLevel, blockpositionout: &blocklaserposition1,laserpositiony:currentlaserside.position.y,laserpositionx:currentlaserside.position.x)
           }else if  laservactor == LaserVector.down || laservactor == LaserVector.up{
               laserin =  laserposition(y: currentmirrorpositiony,x: currentmirrorpositionx, Blocklevel: BlockLevel, blockpositionout: &blocklaserposition1,laserpositiony:currentlaserup.position.y,laserpositionx:currentlaserup.position.x)
           }
           if laserin == false{
               laserreflectmirrorcollision = 0
           }
       }
     
     currentlaserside.position.x += lasersidexplus
     currentlaserside.position.y += lasersideyplus
     
     currentlaserup.position.x += laserupxplus
     currentlaserup.position.y += laserupyplus
     
     //goal
     for i in 0..<fieldy{
         for j in 0..<fieldx{
             lasersideupin =  laserposition(y: i, x: j, Blocklevel: BlockLevel, blockpositionout: &blocklaserposition1,laserpositiony:currentlaserside.position.y,laserpositionx:currentlaserside.position.x)
             //sidemirrorin
             if lasersideupin == true && (blocklaserposition1.pattern == BlockType.none){
                 //出るのは横しかあり得ないので横しか判定しない。
                 gamestate = GameState.answer
                 if j >= fieldx - 1 {
                     goaly = i
                     goalx = fieldx - 2
                 }else if j <= 0 {
                     goaly = i
                     goalx = 1
                 }
                 lasersidexplus = 0
                 lasersideyplus = 0
                 break
             }
            lasersideupin =  laserposition(y: i, x: j, Blocklevel: BlockLevel, blockpositionout: &blocklaserposition1,laserpositiony:currentlaserup.position.y,laserpositionx:currentlaserup.position.x)
            //sidemirrorin
             if lasersideupin == true && (blocklaserposition1.pattern == BlockType.none){
                 //出るのは縦しかあり得ないので縦しか判定しない。
                 gamestate = GameState.answer
                 if i >= fieldy - 1{
                     goaly = fieldy - 2
                     goalx = j
                 }else if i <= 0{
                     goaly = 1
                     goalx = j
                 }
                 laserupxplus = 0
                 laserupyplus = 0
                 break
             }
         }
     }
}
