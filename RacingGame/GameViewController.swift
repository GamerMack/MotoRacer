//
//  GameViewController.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 2/26/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let view = self.view as! SKView? {
            
            view.ignoresSiblingOrder = true

            if(kDebug){
                view.showsFPS = true
                view.showsNodeCount = true
                
            }
            
            let scene = MenuScene(size: kViewSize)
            scene.scaleMode = .aspectFill

            let transition = SKTransition.fade(with: ColorThemes.DeepTheme.lightbrown.skColor , duration: 2.0)
            view.presentScene(scene, transition: transition)
            
            
          
        }
    }
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       return .portrait
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
