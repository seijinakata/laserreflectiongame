//
//  GameScene.swift
//  laserreflectiongame
//
//  Created by Owner on 9/5/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

import SpriteKit
import GameplayKit
import GameKit

class GameScene: SKScene{
    override func didMove(to view: SKView) {
        
        score = 0
        scoredigits = 1
        time = easytime
        //answerの後
        fieldy = easyfieldy
        fieldx = easyfieldx
        //easy
        xstartpiece = CGFloat(-142.5)
        ystartpiece = CGFloat(72)

        timedigits = 1
        passedtime = 1
        passedtimecounter = 0
        
        easycounter = 2
        normalcounter = 3
        hardcounter = 5
        //easy
        blocklevelcounter = 4
        
        //numberinit
        //numberpicture 0から9の10個
        numberinit()
        //totalinit
        for _ in 0..<scoredigits{
            let numbernodecopy = numbernode[0].copy() as! SKSpriteNode
            scorenumbers.append(numbernodecopy)
        }
        //timeinit
        for _ in 0..<timedigits{
            let numbernodecopy = numbernode[0].copy() as! SKSpriteNode
            timenumbers.append(numbernodecopy)
        }
        numbersdisplay(numbers: score,digits:&scoredigits,outnumbers: &scorenumbers, positionx: 160, positiony: 250,positionz: 3)
        

        background.zPosition = 1
        addChild(background)
        
        //lasercover=4
        gameover.zPosition = 5
        
        gameoverlabel.fontSize = 60
        gameoverlabel.zPosition = 6
        gameoverlabel.fontColor = SKColor.black
        gameoverlabel.text = "TITLE"
        gameoverlabel.name = "gameover"
        gameoverlabel.position =  CGPoint(x: 0,y: -45)
        
        correct.zPosition = 5
        correctlabel.fontSize = 60
        correctlabel.zPosition = 6
        correctlabel.fontColor = SKColor.black
        correctlabel.text = "next"
        correctlabel.name = "correct"
        correctlabel.position =  CGPoint(x: 0,y: -45)

        end.zPosition = 5
        
        let timelabel = SKLabelNode(fontNamed: "verdana-bold")
        timelabel.fontSize = 40
        timelabel.zPosition = 3
        timelabel.fontColor = SKColor.black
        let scorelabel = timelabel.copy() as! SKLabelNode
        timelabel.text = "TIME"
        scorelabel.text = "TOTAL"
        timelabel.position =  CGPoint(x: -115,y: 315)
        scorelabel.position = CGPoint(x: 77,y: 315)
        addChild(timelabel)
        addChild(scorelabel)

        gamestate = GameState.nodeinit
        gamemode = GameMode.easy
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if gamestate == GameState.playertouch{
            //番号が欲しいだけだから９５で問題ない。
            var touchposition = Block(pattern: BlockType.none,piecenode:floorclear95.copy() as! SKSpriteNode,numbery:0,numberx:0,covernode:floorclear95.copy() as! SKSpriteNode)
            if gamemode == GameMode.easy{
                wheretouch(blocklevel: Blocklevel1, touchposition: &touchposition, pos: pos)
            }
            if gamemode == GameMode.normal{
                wheretouch(blocklevel: Blocklevel2, touchposition: &touchposition, pos: pos)
            }
            if gamemode == GameMode.hard{
                wheretouch(blocklevel: Blocklevel3, touchposition: &touchposition, pos: pos)
            }
        }
        if gamestate == GameState.gameoverselect{
            let touchnodes = self.nodes(at: pos)
                for tnode in touchnodes{
                    if tnode.name == "gameover"{
                        gameover.removeFromParent()
                        gameoverlabel.removeFromParent()
                        if let gametitle = GameTitle(fileNamed: "GameTitle") {
                            // Set the scale mode to scale to fit the window
                            gametitle.scaleMode = .fill
                            // Present the scene
                            self.view?.presentScene(gametitle)
                        }
                    }
                }
        }
        if gamestate == GameState.allclear{
            let touchnodes = self.nodes(at: pos)
                for tnode in touchnodes{
                    if tnode.name == "gameover"{
                        gameover.removeFromParent()
                        gameoverlabel.removeFromParent()
                        let leaderboardScore = GKScore(leaderboardIdentifier: leaderboardId)
                        leaderboardScore.value = Int64(score)
                        GKScore.report([leaderboardScore]){ error in
                            guard error == nil else{
                                print("error")
                                return
                            }
                            print("done")
                        }
                        if let gametitle = GameTitle(fileNamed: "GameTitle") {
                            // Set the scale mode to scale to fit the window
                            gametitle.scaleMode = .fill
                            // Present the scene
                            self.view?.presentScene(gametitle)
                        }
                    }
                }
        }
        if gamestate == GameState.clearselect{
            let touchnodes = self.nodes(at: pos)
                for tnode in touchnodes{
                    if tnode.name == "correct"{
                        if gamemode == GameMode.easy{
                            for i in 0..<fieldy{
                                for j in 0..<fieldx{
                                    Blocklevel1[i][j].piecenode.removeFromParent()
                                    Blocklevel1[i][j].covernode.removeFromParent()
                                }
                            }
                            for i in 1..<fieldy-1{
                                for j in 1..<fieldx-1{
                                    Blockpatternlevel1[i][j] = 1
                                }
                            }
                            time = easytime
                        }
                        if gamemode == GameMode.normal{
                                for i in 0..<fieldy{
                                    for j in 0..<fieldx{
                                        Blocklevel2[i][j].piecenode.removeFromParent()
                                        Blocklevel2[i][j].covernode.removeFromParent()
                                    }
                                }
                                for i in 1..<fieldy-1{
                                    for j in 1..<fieldx-1{
                                        Blockpatternlevel2[i][j] = 1
                                    }
                                }
                                time = normaltime
                        }
                        if gamemode == GameMode.hard{
                            if hardcounter > 0{
                                for i in 0..<fieldy{
                                    for j in 0..<fieldx{
                                        Blocklevel3[i][j].piecenode.removeFromParent()
                                        Blocklevel3[i][j].covernode.removeFromParent()
                                    }
                                }
                                for i in 1..<fieldy-1{
                                    for j in 1..<fieldx-1{
                                        Blockpatternlevel3[i][j] = 1
                                    }
                                }
                                time = hardtime
                            }
                        }
                        correct.removeFromParent()
                        correctlabel.removeFromParent()
                        gamestate = GameState.touchinit
                        //counteroverは塗り替えnormal
                        if gamemode == GameMode.easy && easycounter <= 0{
                            gamemode = GameMode.normal
                            gamestate = GameState.nodeinit
                            time = normaltime
                            //answerの後
                            fieldy = normalfieldy
                            fieldx = normalfieldx
                            xstartpiece = CGFloat(-165)
                            ystartpiece = CGFloat(93)
                            blocklevelcounter = 8
                        }else if gamemode == GameMode.normal && normalcounter <= 0{
                            gamemode = GameMode.hard
                            gamestate = GameState.nodeinit
                            time = hardtime
                            //answerの後
                            fieldy = hardfieldy
                            fieldx = hardfieldx
                            xstartpiece = CGFloat(-171)
                            ystartpiece = CGFloat(101)
                            blocklevelcounter = 11
                        }else if gamemode == GameMode.hard && hardcounter <= 0{
                            addChild(end)
                            addChild(gameoverlabel)
                            gamestate = GameState.allclear
                        }
                    }
            }
        }

    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
        
    func touchUp(atPoint pos : CGPoint) {
     
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }

    override func update(_ currentTime: TimeInterval) {
        //2回やられたら困る処理
        if gamestate == GameState.nodeinit{
            if gamemode == GameMode.easy{
                currentlaserside = laserside95.copy() as! SKSpriteNode
                currentlaserup = laserup95.copy() as! SKSpriteNode
                addChild(currentlaserside)
                addChild(currentlaserup)
                for i in 0..<easyfieldy{
                    for j in 0..<easyfieldx{
                        blockappend(blocklevel: &Blocklevel1, numbery: i,numberx: j,gamemode: gamemode)
                    }
                }
            }
            if gamemode == GameMode.normal{
                currentlaserside.removeFromParent()
                currentlaserup.removeFromParent()
                currentlaserside = laserside54.copy() as! SKSpriteNode
                currentlaserup = laserup54.copy() as! SKSpriteNode
                addChild(currentlaserside)
                addChild(currentlaserup)
                for i in 0..<normalfieldy{
                    for j in 0..<normalfieldx{
                        blockappend(blocklevel: &Blocklevel2, numbery: i,numberx: j,gamemode: gamemode)
                    }
                }
            }
            if gamemode == GameMode.hard{
                currentlaserside.removeFromParent()
                currentlaserup.removeFromParent()
                currentlaserside = laserside38.copy() as! SKSpriteNode
                currentlaserup = laserup38.copy() as! SKSpriteNode
                addChild(currentlaserside)
                addChild(currentlaserup)
                for i in 0..<hardfieldy{
                    for j in 0..<hardfieldx{
                        blockappend(blocklevel: &Blocklevel3, numbery: i,numberx: j,gamemode: gamemode)
                    }
                }
            }
            gamestate = GameState.touchinit
        }
        if gamestate == GameState.touchinit{
                gamestartinit()
            if gamemode == GameMode.easy{
                touchinit(blockpatternlevel: &Blockpatternlevel1, Blocklevelcounter: blocklevelcounter,number1Xmaxset: 3,number1Xminset: 2 ,number2Ymaxset: 3 ,number2Yminset: 3)
                gamestartlaser(gamemode: gamemode)
                gamestartinit(BlockPatternLevel: Blockpatternlevel1, blocklevel: &Blocklevel1,gamemode: gamemode)
                for j in 0..<fieldy{
                    if Blockpatternlevel1[1][j] == 2{
                        Blocklevel1[1][j].covernode = mirrorrightdown95.copy() as! SKSpriteNode
                            Blocklevel1[1][j].covernode.zPosition = 4
                        Blocklevel1[1][j].covernode.position.y = Blocklevel1[1][j].piecenode.position.y
                        Blocklevel1[1][j].covernode.position.x = Blocklevel1[1][j].piecenode.position.x
                    }
                }
            }
            if gamemode == GameMode.normal{
                touchinit(blockpatternlevel: &Blockpatternlevel2, Blocklevelcounter: blocklevelcounter,number1Xmaxset: 3,number1Xminset: 2 ,number2Ymaxset: 4 ,number2Yminset: 4)
                gamestartlaser(gamemode: gamemode)
                gamestartinit(BlockPatternLevel: Blockpatternlevel2, blocklevel: &Blocklevel2,gamemode: gamemode)
                for j in 0..<fieldy{
                    if Blockpatternlevel2[1][j] == 2{
                        Blocklevel2[1][j].covernode = mirrorrightdown54.copy() as! SKSpriteNode
                            Blocklevel2[1][j].covernode.zPosition = 4
                        Blocklevel2[1][j].covernode.position.y = Blocklevel2[1][j].piecenode.position.y
                        Blocklevel2[1][j].covernode.position.x = Blocklevel2[1][j].piecenode.position.x
                    }
                }
            }
            if gamemode == GameMode.hard{
                touchinit(blockpatternlevel: &Blockpatternlevel3, Blocklevelcounter: blocklevelcounter,number1Xmaxset: 7,number1Xminset: 4 ,number2Ymaxset: 7 ,number2Yminset: 4)
                gamestartlaser(gamemode: gamemode)
                gamestartinit(BlockPatternLevel: Blockpatternlevel3, blocklevel: &Blocklevel3,gamemode: gamemode)
                for j in 0..<fieldy{
                    if Blockpatternlevel3[1][j] == 2{
                        Blocklevel3[1][j].covernode = mirrorrightdown38.copy() as! SKSpriteNode
                            Blocklevel3[1][j].covernode.zPosition = 4
                        Blocklevel3[1][j].covernode.position.y = Blocklevel3[1][j].piecenode.position.y
                        Blocklevel3[1][j].covernode.position.x = Blocklevel3[1][j].piecenode.position.x
                    }
                }
            }
            gamestate = GameState.playertouch
        }
        if gamestate == GameState.playertouch{
            for c in 0..<timedigits{
                removeChildren(in: [timenumbers[c]])
            }
            passedtimecounter += 1
            if passedtimecounter >= 40 {
                time = time - passedtime
                if time <= 0{
                    time = 0
                    gamestate = GameState.gameover
                }
                passedtimecounter = 0
            }
            numbersdisplay(numbers: time,digits: &timedigits, outnumbers: &timenumbers, positionx: -65, positiony: 250, positionz: 3)

        }
        if gamestate == GameState.gameinit{
            laserstartset(laservactor: laservactor, laserxplus: &lasersidexplus, laseryplus: &lasersideyplus)
            gamestate = GameState.gamemain
        }
        if gamestate == GameState.gamemain{
            if gamemode == GameMode.easy{
                gamemain(BlockLevel: &Blocklevel1,blockpatternlevel: Blockpatternlevel1,gamemode: gamemode)
            }
            if gamemode == GameMode.normal{
                gamemain(BlockLevel: &Blocklevel2,blockpatternlevel: Blockpatternlevel2,gamemode: gamemode)
            }
            if gamemode == GameMode.hard{
                gamemain(BlockLevel: &Blocklevel3,blockpatternlevel: Blockpatternlevel3,gamemode: gamemode)
            }
        }
        if gamestate == GameState.answer{
            if goaly == touchy && goalx == touchx{
                gamestate = GameState.clear
            }else {
                gamestate = GameState.gameover
            }
        }
        if gamestate == GameState.clear{
            if gamemode == GameMode.easy{
                score =  score + (easytime - time)
                easycounter -= 1
            }else if gamemode == GameMode.normal{
                score =  score + (normaltime - time)
                normalcounter -= 1
            }else if gamemode == GameMode.hard{
                score =  score + (hardtime - time)
                hardcounter -= 1
            }
            for c in 0..<scoredigits{
                removeChildren(in: [scorenumbers[c]])
            }
            numbersdisplay(numbers: score,digits: &scoredigits, outnumbers: &scorenumbers, positionx: 160, positiony: 250,positionz: 3)
            addChild(correct)
            addChild(correctlabel)
            gamestate = GameState.clearselect
        }
        if gamestate == GameState.gameover{
                addChild(gameover)
                addChild(gameoverlabel)
            gamestate = GameState.gameoverselect
        }
        if gamestate == GameState.clearselect{

        }
        if gamestate == GameState.gameoverselect{
        }
        if gamestate == GameState.allclear{
        }
    }
}
