//
//  GameScene.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 2/26/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import SpriteKit
import GameplayKit


func showZRotationInDegreesFor(spriteNode: SKSpriteNode){
    let valueInDegrees = convertToDegreesFrom(radiansOf: spriteNode.zRotation)
    print("The zRotation of \(spriteNode.name) in degrees is \(valueInDegrees) ")
}


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let smokeEmitterManager = SmokeEmitterManager.sharedInstance
    
    private var gameSceneLabel: SKLabelNode?
    
    let gameTextures = GameTextures.sharedInstance
    var player = Player()
    let mainCamera = SKCameraNode()
    var environment = SKSpriteNode()
    
    var backgrounds = [SKSpriteNode]()
    
    var wingman = SKSpriteNode()
    var wingmanContainer = SKSpriteNode()

    
    let initialPlayerPosition = CGPoint(x: 180, y: 20)
    var playerProgress = CGFloat()
    
    var jumpCount = CGFloat(1)
    var jumpHeight = CGFloat()
    
    
    var lastUpdateTime: TimeInterval = 0
    var timeElapsed: TimeInterval = 0
    
    override func didMove(to view: SKView) {
        self.setup()
       
        
    }

    private func setup(){
        gameSceneLabel = SKLabelNode(fontNamed: "Arial")
        gameSceneLabel?.text = "GameScene"
        gameSceneLabel?.fontSize = 36.0
        gameSceneLabel?.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height/2)
        self.addChild(gameSceneLabel!)
        
        
        self.physicsWorld.contactDelegate = self
        
        //Instantiate and configure camera
        self.camera = mainCamera
        self.addChild(mainCamera)

        
        
        let scene = SKScene(fileNamed: "DirtSand1")!
        environment = scene.childNode(withName: "Root") as! SKSpriteNode
        environment.scale(to: kViewSize)

        environment.move(toParent: self)
        environment.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height/2)
        environment.zPosition = 1
        jumpHeight = kViewSize.height
        
        
        //Player configuration code
        player.spawn(parentNode: self, position: initialPlayerPosition, motorcycleTexture: SKTexture(image: #imageLiteral(resourceName: "motorcycle_red")))
        player.zPosition = 2
        let smokeEmitterNode = smokeEmitterManager.createSmokeEmitterFor(engineState: .NormalRunning)
        smokeEmitterNode.zPosition = 2
        player.addChild(smokeEmitterNode)
        smokeEmitterNode.position = CGPoint(x: 0, y: -30)
        
      
        //Wingman configuration code
        wingmanContainer = SKSpriteNode()
        wingmanContainer.anchorPoint = CGPoint(x: 0.5,y: 0.5)
        wingmanContainer.size = CGSize(width: kViewSize.width, height: kViewSize.height/3)
        wingmanContainer.position = CGPoint(x: mainCamera.position.x, y: mainCamera.position.y+200)
        
        wingman.anchorPoint = CGPoint(x: 0.5,y: 0.5)
        wingmanContainer.addChild(wingman)
        
        wingman = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "wingMan1")))
        wingman.position = CGPoint.zero
        
        let wingmanAtlas = SKTextureAtlas(named: "WingMan.atlas")
       
        
        let flapDown = SKAction.animate(with: [
            wingmanAtlas.textureNamed("wingMan1"),
            wingmanAtlas.textureNamed("wingMan2"),
            wingmanAtlas.textureNamed("wingMan3"),
            wingmanAtlas.textureNamed("wingMan4"),
            wingmanAtlas.textureNamed("wingMan5")
            ], timePerFrame: 0.25)
        
        let flapDown2 = SKAction.animate(with: [
            SKTexture(image: #imageLiteral(resourceName: "wingMan1")),
            SKTexture(image: #imageLiteral(resourceName: "wingMan2")),
            SKTexture(image: #imageLiteral(resourceName: "wingMan3")),
            SKTexture(image: #imageLiteral(resourceName: "wingMan4")),
            SKTexture(image: #imageLiteral(resourceName: "wingMan5"))
            ], timePerFrame: 0.1)
    
        let flapUp = SKAction.reversed(flapDown)()
        let flapUp2 = SKAction.reversed(flapDown2)()
        
        let moveLeftAction = SKAction.move(by: CGVector(dx: -200, dy: 0), duration: 2)
        let moveRightAction = SKAction.move(by: CGVector(dx: 200, dy: 0), duration: 2)
        
        
        let flappingAnimation = SKAction.sequence([
                flapDown2,
                flapUp2
            ])
        
        let movingAnimation = SKAction.sequence([
                moveLeftAction,
                moveRightAction
            ])
        
        let flyingAnimation = SKAction.repeatForever(SKAction.group([
            flappingAnimation,
            movingAnimation
            ]))
        
        
        
        wingman.run(flyingAnimation)
        
        self.addChild(wingmanContainer)
        
        wingmanContainer.zPosition = 3
        wingman.zPosition = 3
        
        
        var bomb = SKSpriteNode(texture: nil, color: .clear, size: CGSize(width: 30, height: 30))
        let explosionAnimation = SKAction.animate(with: [
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion00")),
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion01")),
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion03")),
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion04")),
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion05")),
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion06")),
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion07")),
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion08"))

            ], timePerFrame: 0.25)
       
        self.addChild(bomb)
        bomb.zPosition = 3
        bomb.position = CGPoint(x: mainCamera.position.x, y: mainCamera.position.y+100)
        
        bomb.run(SKAction.sequence([SKAction.wait(forDuration: 5.0), explosionAnimation]))
    }
    
    func checkForReposition(playerProgress: CGFloat){
        let environmentJumpPosition = jumpHeight*jumpCount
        
        if playerProgress >= environmentJumpPosition{
            environment.position.y = jumpHeight*jumpCount
            jumpCount += 1
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //Implement collision/contact logic here
        let cA: UInt32 = contact.bodyA.categoryBitMask
        let cB: UInt32 = contact.bodyB.categoryBitMask
        
        if(cA == PhysicsCategory.player.rawValue || cB == PhysicsCategory.player.rawValue){
            let otherNode: SKNode = (cA == PhysicsCategory.player.rawValue) ? contact.bodyB.node! : contact.bodyA.node!
            
            switch(otherNode.physicsBody!.categoryBitMask){
            case PhysicsCategory.barrier.rawValue:
                player.takeDamage()
                break
            default:
                print("This collision logic has not yet been implemented")
                break
            }
        }
        
    }
    
    func playerDidCollide(with other: SKNode){
        let otherCategory = other.physicsBody?.categoryBitMask
        
        if otherCategory == oilCategory{
            print("You drove over the oil!")
            adjustPlayerHealthLevel(other: other)
            other.removeFromParent()
           
        } else if (otherCategory == naturalBarrierCategory){
            adjustPlayerHealthLevel(other: other)
            print("You hit a rock or tree! Ouch")
            other.removeFromParent()
        } else if (otherCategory == carCategory){
            print("You collided with a car!")
            adjustPlayerHealthLevel(other: other)
            other.removeFromParent()
        } else {
            print("You collided with something weird")
            adjustPlayerHealthLevel(other: other)
            other.removeFromParent()
        }
    }
    
    func adjustPlayerHealthLevel(other: SKNode){
        let damageAmount: Int = other.userData?.value(forKey: "damageAmount") as! Int
        let originalHealth: Int = player.userData?.value(forKey: "healthLevel") as! Int
        player.userData?.setValue(originalHealth - damageAmount, forKey: "healthLevel")
         print("THe player's current health level is \(player.userData?.value(forKey: "healthLevel"))")
    }
    
    func configureMotorcycleActions(){
        

            }
  
    
    func touchDown(atPoint pos : CGPoint) {
       

    }
    
    func touchMoved(toPoint pos : CGPoint) {
    
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func didSimulatePhysics() {
        playerProgress = player.position.x - initialPlayerPosition.x
        checkForReposition(playerProgress: playerProgress)
        mainCamera.position = CGPoint(x: player.position.x, y: player.position.y+200)
        wingmanContainer.position = CGPoint(x: mainCamera.position.x, y: mainCamera.position.y+200)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       let touch = touches.first! as UITouch
        
      let touchLocation = touch.location(in: self)
    
        let impulseX = touchLocation.x > player.position.x ? 20: -20
        let impulseY = touchLocation.y > player.position.y ? 10: -10
        
        let xDifference = Int(touchLocation.x - player.position.x)
        
        player.respondToTouchesBegan(deltaX: xDifference)
        player.physicsBody?.applyForce(CGVector(dx: impulseX, dy: impulseY))
        
        
    
    }
    

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //not implemented
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        player.update()
        
       
        
        timeElapsed += currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        
        
   

     
    }
    
    private func spawnRockObstacles(){
        //Test code
        
        
        let rock1 = Rock()
        let xPosOffset1 = CGFloat(arc4random_uniform(400))
        let yPosOffset1 = CGFloat(arc4random_uniform(400))
        rock1.spawn(onParent: self, atPosition: CGPoint(x: player.position.x-xPosOffset1,y: player.position.y + yPosOffset1), withSize: CGSize(width: 40, height: 40), ofType: .rock3)
        rock1.zPosition = player.zPosition
        
        let rock2 = Rock()
        let xPosOffset2 = CGFloat(arc4random_uniform(300))
        let yPosOffset2 = CGFloat(arc4random_uniform(300))
        rock2.spawn(onParent: self, atPosition: CGPoint(x: player.position.x+xPosOffset2,y: player.position.y + yPosOffset2), withSize: CGSize(width: 40, height: 40), ofType: .rock2)
        rock2.zPosition = player.zPosition
        
        
        
    }
    
    //MARK: - LoadScene
    private func loadScene(){
        let scene = GameOverScene(size: kViewSize)
        let transition = SKTransition.fade(with: UIColor.green, duration: 2.0)
        self.view?.presentScene(scene, transition: transition)
    }
}
