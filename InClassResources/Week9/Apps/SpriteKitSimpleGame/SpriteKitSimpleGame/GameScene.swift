//
//  GameScene.swift
//  SpriteKitSimpleGame
//
//  Created by Ben Gohlke on 4/20/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import SpriteKit

class GameScene: SKScene
{
    let player = SKSpriteNode(imageNamed: "player")
    
    override func didMoveToView(view: SKView)
    {
        backgroundColor = SKColor.whiteColor()
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        addChild(player)
    }
}