//
//  GamePlayManager.h
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 2/25/11.
//  Copyright 2011 Tap Me! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefines.h"

@class InputManager;

@interface GamePlayManager : CCNode{
	NSMutableArray * m_prgUpdates;
	CCScene * m_pCurrentScene;
	InputManager * m_pInputManager;
}
@property(nonatomic,assign)CCScene * CurrentScene;
-(id)init;
-(void)updateGame:(ccTime)_fDelta;
-(void)resetGame;
-(void)setUpInterface;
@end
