//
//  field.swift
//  laserreflectiongame
//
//  Created by Owner on 9/15/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

import SpriteKit
import GameplayKit

func generetefieldblock(blockpatternlevel:[[Int]],block:
    inout Block,numbery:Int,numberx:Int,gamemode:GameMode){
    if gamemode == GameMode.easy{
        if blockpatternlevel[numbery][numberx] == 0{
            block = Block(pattern: BlockType.none,piecenode:floorclear95.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear95.copy() as! SKSpriteNode)
            
        }
        if blockpatternlevel[numbery][numberx] == 1{
            block = Block(pattern: BlockType.space,piecenode:floor95.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear95.copy() as! SKSpriteNode)
        }
        if blockpatternlevel[numbery][numberx] == 2{
            block = Block(pattern: BlockType.mirrordown,piecenode:mirrordown95.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear95.copy() as! SKSpriteNode)
        }
        if blockpatternlevel[numbery][numberx] == 3{
            block = Block(pattern: BlockType.mirrorup,piecenode:mirrorup95.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear95.copy() as! SKSpriteNode)
        }
    }else if gamemode == GameMode.normal{
        if blockpatternlevel[numbery][numberx] == 0{
            block = Block(pattern: BlockType.none,piecenode:floorclear54.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear54.copy() as! SKSpriteNode)
            
        }
        if blockpatternlevel[numbery][numberx] == 1{
            block = Block(pattern: BlockType.space,piecenode:floor54.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear54.copy() as! SKSpriteNode)
        }
        if blockpatternlevel[numbery][numberx] == 2{
            block = Block(pattern: BlockType.mirrordown,piecenode:mirrordown54.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear54.copy() as! SKSpriteNode)
        }
        if blockpatternlevel[numbery][numberx] == 3{
            block = Block(pattern: BlockType.mirrorup,piecenode:mirrorup54.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear54.copy() as! SKSpriteNode)
        }
    }else if gamemode == GameMode.hard{
        if blockpatternlevel[numbery][numberx] == 0{
            block = Block(pattern: BlockType.none,piecenode:floorclear38.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear38.copy() as! SKSpriteNode)
            
        }
        if blockpatternlevel[numbery][numberx] == 1{
            block = Block(pattern: BlockType.space,piecenode:floor38.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear38.copy() as! SKSpriteNode)
        }
        if blockpatternlevel[numbery][numberx] == 2{
            block = Block(pattern: BlockType.mirrordown,piecenode:mirrordown38.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear38.copy() as! SKSpriteNode)
        }
        if blockpatternlevel[numbery][numberx] == 3{
            block = Block(pattern: BlockType.mirrorup,piecenode:mirrorup38.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear38.copy() as! SKSpriteNode)
        }
    }
}
func blockappend(blocklevel:inout [[Block]],numbery:Int,numberx:Int,gamemode:GameMode){
    var block = Block(pattern: BlockType.none,piecenode:floorclear95.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear95.copy() as! SKSpriteNode)
    if gamemode == GameMode.easy{
    block = Block(pattern: BlockType.none,piecenode:floorclear95.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear95.copy() as! SKSpriteNode)
    }else if gamemode == GameMode.normal{
    block = Block(pattern: BlockType.none,piecenode:floorclear54.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear54.copy() as! SKSpriteNode)
    }else if gamemode == GameMode.hard{
    block = Block(pattern: BlockType.none,piecenode:floorclear38.copy() as! SKSpriteNode,numbery:numbery,numberx:numberx,covernode:floorclear54.copy() as! SKSpriteNode)
    }
    blocklevel[numbery].append(block)
}
func setfieldblock(block:Block,blocklevel:inout [[Block]] ,numbery:Int,numberx:Int){
       block.piecenode.zPosition = 2
        block.piecenode.position.y =
        (ystartpiece + block.piecenode.size.height) -
            block.piecenode.size.height * (CGFloat)(numbery)
        block.piecenode.position.x =
            (xstartpiece - block.piecenode.size.width) + block.piecenode.size.width*(CGFloat)(numberx)
        blocklevel[numbery][numberx] = block
}

func setcovermirror(blockpatternlevel:[[Int]],blocklevel:inout [[Block]],y:Int,x:Int,laservactor:LaserVector,gamemode:GameMode){
    if !(y == currentmirrorpositiony && x == currentmirrorpositionx){
        if blockpatternlevel[y][x] == 2{
            if gamemode == GameMode.easy{
                if laservactor == LaserVector.right {
                    blocklevel[y][x].covernode = mirrorrightdown95.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.down{
                    blocklevel[y][x].covernode = mirrorleftdown95.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.left{
                    blocklevel[y][x].covernode = mirrorleftdown95.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.up{
                    blocklevel[y][x].covernode = mirrorrightdown95.copy() as! SKSpriteNode
                }
            }else if gamemode == GameMode.normal{
                if laservactor == LaserVector.right {
                    blocklevel[y][x].covernode = mirrorrightdown54.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.down{
                    blocklevel[y][x].covernode = mirrorleftdown54.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.left{
                    blocklevel[y][x].covernode = mirrorleftdown54.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.up{
                    blocklevel[y][x].covernode = mirrorrightdown54.copy() as! SKSpriteNode
                }
            }else if gamemode == GameMode.hard{
                if laservactor == LaserVector.right {
                    blocklevel[y][x].covernode = mirrorrightdown38.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.down{
                    blocklevel[y][x].covernode = mirrorleftdown38.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.left{
                    blocklevel[y][x].covernode = mirrorleftdown38.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.up{
                    blocklevel[y][x].covernode = mirrorrightdown38.copy() as! SKSpriteNode
                }
            }
            blocklevel[y][x].covernode.zPosition = 4
            blocklevel[y][x].covernode.position.y = blocklevel[y][x].piecenode.position.y
            blocklevel[y][x].covernode.position.x = blocklevel[y][x].piecenode.position.x
    }else if blockpatternlevel[y][x] == 3{
            if gamemode == GameMode.easy{
                if laservactor == LaserVector.right {
                    blocklevel[y][x].covernode = mirrorrightup95.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.down{
                    blocklevel[y][x].covernode = mirrorrightup95.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.left{
                    blocklevel[y][x].covernode = mirrorleftup95.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.up{
                    blocklevel[y][x].covernode = mirrorleftup95.copy() as! SKSpriteNode
                }
            }else if gamemode == GameMode.normal{
                if laservactor == LaserVector.right {
                    blocklevel[y][x].covernode = mirrorrightup54.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.down{
                    blocklevel[y][x].covernode = mirrorrightup54.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.left{
                    blocklevel[y][x].covernode = mirrorleftup54.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.up{
                    blocklevel[y][x].covernode = mirrorleftup54.copy() as! SKSpriteNode
                }
            }else if gamemode == GameMode.hard{
                if laservactor == LaserVector.right {
                    blocklevel[y][x].covernode = mirrorrightup38.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.down{
                    blocklevel[y][x].covernode = mirrorrightup38.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.left{
                    blocklevel[y][x].covernode = mirrorleftup38.copy() as! SKSpriteNode
                }else if laservactor == LaserVector.up{
                    blocklevel[y][x].covernode = mirrorleftup38.copy() as! SKSpriteNode
                }
            }
            blocklevel[y][x].covernode.zPosition = 4
            blocklevel[y][x].covernode.position.y = blocklevel[y][x].piecenode.position.y
            blocklevel[y][x].covernode.position.x = blocklevel[y][x].piecenode.position.x
        }
    }
}

func blockpatternlaserchange(laserchangevactor:inout LaserVector,blockpattern:Int,laservactor:LaserVector){
    if blockpattern == 2 {
        if laservactor == LaserVector.right{
            laserchangevactor = LaserVector.down
        }else if laservactor == LaserVector.down{
            laserchangevactor = LaserVector.right
        }else if laservactor == LaserVector.left{
            laserchangevactor = LaserVector.up
        }else if laservactor == LaserVector.up{
            laserchangevactor = LaserVector.left
        }
    }
    if blockpattern == 3{
        if laservactor == LaserVector.right{
            laserchangevactor = LaserVector.up
        }else if laservactor == LaserVector.down{
            laserchangevactor = LaserVector.left
        }else if laservactor == LaserVector.left{
            laserchangevactor = LaserVector.down
        }else if laservactor == LaserVector.up{
            laserchangevactor = LaserVector.right
        }
    }
}

func setmirror(blockpatternlevel:inout [[Int]],blocklaservactor:inout LaserVector,blockpatterny:inout Int,blockpatternx:inout Int)->BlockMake{
    //Int(arc4random()%UInt32(max-min+1)+UInt32(min))
    if blockpatternlevel[blockpatterny][blockpatternx] == 2 || blockpatternlevel[blockpatterny][blockpatternx] == 3{
        if blocklaservactor == LaserVector.right{
            //自分のところも調べるコード注意
            for i in blockpatternx+1...fieldx-1{
                if blockpatternlevel[blockpatterny][i] == 2 ||
                    blockpatternlevel[blockpatterny][i] == 3{
                    blockpatternx = i
                    //print(blockpatterny)
                    //print(blockpatterny)
                    blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
                    return BlockMake.success
                }
            }
            let temppatternx = UInt32((fieldx-2)-(blockpatternx+1)+1)
            if temppatternx <= 0 {
                return BlockMake.miss
            }else{
                blockpatternx = Int(arc4random()%temppatternx + UInt32(blockpatternx+1))
                //x=firstblockまで,y=1は終了
                for x in 1...3{
                    if blockpatternx == x && blockpatterny == 1{
                        return BlockMake.miss
                    }
                }
                //ないところだけ
                if blockpatternlevel[blockpatterny][blockpatternx] != 1{
                    return BlockMake.onemore
                }

                blockpatternlevel[blockpatterny][blockpatternx] = Int(arc4random()%UInt32(3-2+1)+UInt32(2))

                blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
            }
        }else if blocklaservactor == LaserVector.down{
            //自分のところも調べるコード注意
             for i in blockpatterny+1...fieldy-1{
                 if blockpatternlevel[i][blockpatternx] == 2 ||
                     blockpatternlevel[i][blockpatternx] == 3{
                     blockpatterny = i
                     //print(blockpatterny)
                     //print(blockpatterny)
                     blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
                    return BlockMake.success
                 }
             }
            let temppatterny = UInt32((fieldy-2)-(blockpatterny+1)+1)
            if temppatterny <= 0 {
                return BlockMake.miss
            }else {
                blockpatterny = Int(arc4random()%temppatterny + UInt32(blockpatterny+1))
                //x=firstblockまで,y=1は終了
                for x in 1...3{
                    if blockpatternx == x && blockpatterny == 1{
                        return BlockMake.miss
                    }
                }
                //ないところだけ
                if blockpatternlevel[blockpatterny][blockpatternx] != 1{
                    return BlockMake.onemore
                }
 
                blockpatternlevel[blockpatterny][blockpatternx] = Int(arc4random()%UInt32(3-2+1)+UInt32(2))

                blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
                }
        }else if blocklaservactor == LaserVector.left{
            //自分のところも調べるコード注意
            for i in (0...blockpatternx-1).reversed(){
                if blockpatternlevel[blockpatterny][i] == 2 ||
                    blockpatternlevel[blockpatterny][i] == 3{
                    blockpatternx = i
                    //print(blockpatterny)
                    //print(blockpatterny)
                    blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
                    return BlockMake.success
                }
            }
            let temppatternx = UInt32((blockpatternx-1)-1+1)
            if temppatternx <= 0{
                return BlockMake.miss
            }else{
                blockpatternx = Int(arc4random()%temppatternx + UInt32(1))
                //x=firstblockまで,y=1は終了
                for x in 1...3{
                    if blockpatternx == x && blockpatterny == 1{
                        return BlockMake.miss
                    }
                }
                //ないところだけ
                if blockpatternlevel[blockpatterny][blockpatternx] != 1{
                    return BlockMake.onemore
                }

                blockpatternlevel[blockpatterny][blockpatternx] = Int(arc4random()%UInt32(3-2+1)+UInt32(2))
                blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
                
            }
        }else if blocklaservactor == LaserVector.up{
            //自分のところも調べるコード注意
            for i in (0...blockpatterny-1).reversed(){
                if blockpatternlevel[i][blockpatternx] == 2 ||
                    blockpatternlevel[i][blockpatternx] == 3{
                    blockpatterny = i
                    //print(blockpatterny)
                    //print(blockpatterny)
                    blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
                    return BlockMake.success
                }
            }
            let temppatterny = UInt32((blockpatterny-1)-1+1)
            if temppatterny <= 0{
                return BlockMake.miss
            }else{
                blockpatterny = Int(arc4random()%temppatterny + UInt32(1))
                //x=firstblockまで,y=1は終了
                for x in 1...3{
                    if blockpatternx == x && blockpatterny == 1{
                        return BlockMake.miss
                    }
                }
                //ないところだけ
                if blockpatternlevel[blockpatterny][blockpatternx] != 1{
                    return BlockMake.onemore
                }
                blockpatternlevel[blockpatterny][blockpatternx] = Int(arc4random()%UInt32(3-2+1)+UInt32(2))
                blockpatternlaserchange(laserchangevactor: &blocklaservactor, blockpattern:blockpatternlevel[blockpatterny][blockpatternx], laservactor: blocklaservactor)
                
            }
        }
    }
    return BlockMake.success
}
