//
//  GameViewController.swift
//  laserreflectiongame
//
//  Created by Owner on 9/5/1398 AP.
//  Copyright © 1398 AP Owner. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

var scene1 = GameScene()

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            if let gametitle = GameTitle(fileNamed: "GameTitle") {
                // Set the scale mode to scale to fit the window
                gametitle.scaleMode = .fill
                
                // Present the scene
                view.presentScene(gametitle)
            }
            
            //view.ignoresSiblingOrder = true
            
            //view.showsFPS = true
            //view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
