//
//  Howto.swift
//  laserreflectiongame
//
//  Created by Owner on 1/22/1399 AP.
//  Copyright © 1399 AP Owner. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import AVFoundation

let howto = SKSpriteNode(imageNamed: "howto")

class Howto: SKScene {
    
    override func didMove(to view: SKView) {

        self.addChild(howto)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if let gametitle = GameTitle(fileNamed: "GameTitle") {
            // Set the scale mode to scale to fit the window
            gametitle.scaleMode = .fill
            // Present the scene
            self.view?.presentScene(gametitle)
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
        // Called before each frame is rendered
    }
}

