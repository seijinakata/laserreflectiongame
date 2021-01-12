//
//  GameTitle.swift
//  laserreflectiongame
//
//  Created by Owner on 1/11/1399 AP.
//  Copyright © 1399 AP Owner. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import AVFoundation
import GameKit

let leaderboardId = "laserreflectiongameleaderboard1.1.x"
let maintitle = SKSpriteNode(imageNamed: "title")

class GameTitle: SKScene,GKGameCenterControllerDelegate  {

    override func didMove(to view: SKView) {
        
            let startlabel = SKLabelNode(fontNamed: "verdana-bold")
            startlabel.fontSize = 35
            startlabel.zPosition = 3
            startlabel.fontColor = SKColor.black
            let rankinglabel = startlabel.copy() as! SKLabelNode
            let howtolabel = startlabel.copy() as! SKLabelNode
            startlabel.text = "スタート"
            startlabel.name = "start"
            rankinglabel.text = "gamecenter"
            rankinglabel.name = "gamecenter"
            howtolabel.text = "遊び方"
            howtolabel.name = "howto"
            
            startlabel.position = CGPoint(x: -100,y: -45)
            rankinglabel.position = CGPoint(x: 0,y: -150)
            howtolabel.position = CGPoint(x: 100,y: -45)

            maintitle.zPosition = 1
            self.addChild(maintitle)
            self.addChild(startlabel)
            self.addChild(rankinglabel)
            self.addChild(howtolabel)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        let touchnodes = self.nodes(at: pos)
        for tnode in touchnodes{
            if tnode.name == "start"{
            // Load the SKScene from 'GameScene.sks'
                scene1 = GameScene(fileNamed: "GameScene")!
               // Set the scale mode to scale to fit the window
                scene1.scaleMode = .fill
                self.view?.presentScene(scene1)
                
            }
            if tnode.name == "gamecenter"{
                let vc = GKGameCenterViewController()
                   vc.gameCenterDelegate = self
                   vc.viewState = .leaderboards
                   vc.leaderboardIdentifier = leaderboardId
                   self.view?.window?.rootViewController?.present(vc, animated: true, completion: nil)
            }
            if tnode.name == "howto"{
                if let howto = Howto(fileNamed: "Howto") {
                    // Set the scale mode to scale to fit the window
                    howto.scaleMode = .fill
                    // Present the scene
                    self.view?.presentScene(howto)
                }
            }
        }
    }
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
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
        // Called before each frame is rendered
    }
}

