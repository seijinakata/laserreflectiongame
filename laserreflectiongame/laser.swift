//
//  laser.swift
//  laserreflectiongame
//
//  Created by Owner on 9/29/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

import SpriteKit
import GameplayKit

var laserside95 = SKSpriteNode(imageNamed: "laserside95")
var laserside54 = SKSpriteNode(imageNamed: "laserside54")
var laserside38 = SKSpriteNode(imageNamed: "laserside38")
var lasersidexplus:CGFloat = 0
var lasersideyplus:CGFloat = 0
var lasersideactive = true

var laserup95 = SKSpriteNode(imageNamed: "laserup95")
var laserup54 = SKSpriteNode(imageNamed: "laserup54")
var laserup38 = SKSpriteNode(imageNamed: "laserup38")
var laserupxplus:CGFloat = 0
var laserupyplus:CGFloat = 0
var laserupactive = false

var laservactor:LaserVector  = LaserVector.right
var currentlaserside = SKSpriteNode()
var currentlaserup = SKSpriteNode()
var lasersideupin = false

var blocklaservactor:LaserVector = LaserVector.right

func laserposition(y:Int,x:Int,Blocklevel:[[Block]],blockpositionout:inout Block,laserpositiony:CGFloat,laserpositionx:CGFloat)->Bool{
    let blocktop = Blocklevel[y][x].piecenode.position.y + Blocklevel[y][x].piecenode.size.height/2
    let blockbottom = Blocklevel[y][x].piecenode.position.y - Blocklevel[y][x].piecenode.size.height/2
    let blockright = Blocklevel[y][x].piecenode.position.x + Blocklevel[y][x].piecenode.size.width/2
    let blockleft = Blocklevel[y][x].piecenode.position.x - Blocklevel[y][x].piecenode.size.width/2
    if blockbottom <= laserpositiony && laserpositiony <= blocktop
        && blockleft <= laserpositionx && laserpositionx <= blockright{
        //only numbery,numberx,patetrn
        blockpositionout.numbery = Blocklevel[y][x].numbery
        blockpositionout.numberx = Blocklevel[y][x].numberx
        blockpositionout.pattern = Blocklevel[y][x].pattern
        return true
    }
        return false
}

func laserstartset(laservactor:LaserVector,laserxplus:inout CGFloat,laseryplus:inout CGFloat){
    if laservactor == LaserVector.right{
        laserxplus = 3
        laseryplus = 0
    }else if laservactor == LaserVector.down{
        laserxplus = 0
        laseryplus = -3
    }else if laservactor == LaserVector.left{
        laserxplus = -3
        laseryplus = 0
    }else if laservactor == LaserVector.up{
        laserxplus = 0
        laseryplus = 3
    }else if laservactor == LaserVector.stop{
        laserxplus = 0
        laseryplus = 0
    }
}
func lasermirrordownchange(laserchangevactor:inout LaserVector,laserxplus:inout CGFloat,laseryplus:inout CGFloat,laservactor:LaserVector){
    if laservactor == LaserVector.right{
        laserxplus = 0
        laseryplus = -3
        laserchangevactor = LaserVector.down
    }else if laservactor == LaserVector.down{
        laserxplus = 3
        laseryplus = 0
        laserchangevactor = LaserVector.right
    }else if laservactor == LaserVector.left{
        laserxplus = 0
        laseryplus = 3
        laserchangevactor = LaserVector.up
    }else if laservactor == LaserVector.up{
        laserxplus = -3
        laseryplus = 0
        laserchangevactor = LaserVector.left
    }
}
func lasermirrorupchange(laserchangevactor:inout LaserVector,laserxplus:inout CGFloat,laseryplus:inout CGFloat,laservactor:LaserVector){
    if laservactor == LaserVector.right{
        laserxplus = 0
        laseryplus = 3
        laserchangevactor = LaserVector.up
    }else if laservactor == LaserVector.down{
        laserxplus = -3
        laseryplus = 0
        laserchangevactor = LaserVector.left
    }else if laservactor == LaserVector.left{
        laserxplus = 0
        laseryplus = -3
        laserchangevactor = LaserVector.down
    }else if laservactor == LaserVector.up{
        laserxplus = 3
        laseryplus = 0
        laserchangevactor = LaserVector.right
    }
}

func mirrorinlaserstartset(lasernode:inout SKSpriteNode,blocklevel:[[Block]],laserybefore:Int,laserxbefore:Int){
    lasernode.position.y = blocklevel[laserybefore][laserxbefore].piecenode.position.y
    lasernode.position.x = blocklevel[laserybefore][laserxbefore].piecenode.position.x
}

