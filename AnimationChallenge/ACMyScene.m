//
//  ACMyScene.m
//  AnimationChallenge
//
//  Created by J Hastwell on 11/04/2014.
//  Copyright (c) 2014 J Hastwell. All rights reserved.
//

#import "ACMyScene.h"

@implementation ACMyScene
{
    SKSpriteNode *_character;
    SKAction *_walkAnimation;
    SKAction *_climbAnimation;
    BOOL _walking;
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"Alien"];
        
        _character = [SKSpriteNode spriteNodeWithTexture:[atlas textureNamed:@"alienGreen_walk1"]];
        _character.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5);
        [self addChild:_character];
        
        NSArray *walkFrames = @[[atlas textureNamed:@"alienGreen_walk1"],
                                [atlas textureNamed:@"alienGreen_walk2"]];
        
        _walkAnimation = [SKAction repeatActionForever:[SKAction animateWithTextures:walkFrames timePerFrame:0.15 resize:NO restore:NO]];
        
        NSArray *climbFrames = @[[atlas textureNamed:@"alienGreen_climb1"],
                                 [atlas textureNamed:@"alienGreen_climb2"]];
        
        _climbAnimation = [SKAction repeatActionForever:[SKAction animateWithTextures:climbFrames timePerFrame:0.15 resize:NO restore:NO]];
        
        [_character runAction:_walkAnimation];
        _walking = YES;
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    _walking = !_walking;
    if (_walking) {
        [_character runAction:_walkAnimation];
    } else {
        [_character runAction:_climbAnimation];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
