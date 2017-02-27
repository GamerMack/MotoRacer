//
//  GameOverScene.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 2/27/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    
    //MARK: Private instance variables
    
    private var gameOverLabel: SKLabelNode?
    
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
    
   
    
    //MARK: - Update
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    //MARK: - Touch Handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        if(gameOverLabel!.contains(touchLocation)){
            loadScene()
        }
    }
    
    //MARK: - Setup
    private func setup(){
        self.backgroundColor = UIColor.blue
        
        gameOverLabel = SKLabelNode(text: "Game Over")
        gameOverLabel?.fontSize = 36.0
        gameOverLabel?.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height/2)
        gameOverLabel?.fontColor = UIColor.cyan
        self.addChild(gameOverLabel!)
    }
    
    //MARK: - LoadScene
    private func loadScene(){
        let scene = MenuScene(size: kViewSize)
        let transition = SKTransition.fade(with: UIColor.brown, duration: 2.0)
        self.view?.presentScene(scene, transition: transition)
    }
}
