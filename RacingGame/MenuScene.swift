//
//  MenuScene.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 2/27/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    //MARK: Private Instance Variables
    private var sceneLabel: SKLabelNode?
    
    //MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMove(to view: SKView) {
        self.setup()
    }
    
    //MARK: Setup
    private func setup(){
        sceneLabel = SKLabelNode(fontNamed: kFontKenPixelHigh)
        sceneLabel?.text = "MenuScene"
        sceneLabel?.fontSize = 32.0
        sceneLabel?.fontColor = UIColor.green
        sceneLabel?.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height/2)
        self.addChild(sceneLabel!)
        
        self.backgroundColor = UIColor.orange

    }
    
    //MARK: - Update
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    //MARK: - Touch Handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        if sceneLabel!.contains(touchLocation){
            loadScene()
        }
    }
    
    //MARK: - LoadScene
    private func loadScene(){
        let scene = GameScene(size: kViewSize)
        let transition = SKTransition.fade(with: UIColor.blue, duration: 2.0)
        self.view?.presentScene(scene, transition: transition)
    }
}
