//
//  GameScene+Extension.swift
//  FlappyBird Watch App
//
//  Created by Moon Jongseek on 3/18/24.
//

import SpriteKit
import WatchKit

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        if moving.speed > 0 {
            if ( contact.bodyA.categoryBitMask & scoreCategory ) == scoreCategory || 
                ( contact.bodyB.categoryBitMask & scoreCategory ) == scoreCategory {
                // Bird has contact with score entity
                score += 1
                scoreLabelNode.text = String(score)
                
                // Add a little visual feedback for the score increment
                scoreLabelNode.run(
                    SKAction.sequence([
                        SKAction.scale(to: 1.5, duration:TimeInterval(0.1)),
                        SKAction.scale(to: 1.0, duration:TimeInterval(0.1))
                    ])
                )
            } else {
                moving.speed = 0
                WKInterfaceDevice.current().play(.failure)
                bird.physicsBody?.collisionBitMask = worldCategory
                bird.run(
                    SKAction.rotate(byAngle: CGFloat(Double.pi) * CGFloat(bird.position.y) * 0.01, duration:1),
                    completion: { [weak self] in
                        self?.bird.speed = 0
                    }
                )
                
                // Flash background if contact is detected
                self.removeAction(forKey: "flash")
                self.run(
                    SKAction.sequence([
                        SKAction.repeat(
                            SKAction.sequence([
                                SKAction.run { [weak self] in
                                    self?.backgroundColor = SKColor(red: 1, green: 0, blue: 0, alpha: 1.0)
                                },
                                SKAction.wait(forDuration: TimeInterval(0.05)),
                                SKAction.run { [weak self] in
                                    self?.backgroundColor = self?.skyColor ?? .init()
                                },
                                SKAction.wait(forDuration: TimeInterval(0.05))
                            ]),
                            count: 4
                        ),
                        SKAction.run { [weak self] in
                            self?.canRestart = true
                        }
                    ]),
                    withKey: "flash"
                )
            }
        }
    }
}
