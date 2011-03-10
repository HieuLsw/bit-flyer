//
//  GamePlayManager.h
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 2/25/11.
//  Copyright 2011 Tap Me! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefines.h"
#import "CCTouchDelegateProtocol.h"

@class InputManager;
@class ControlOverlay;
@class BaseShip;

@interface GamePlayManager : CCNode<CCTargetedTouchDelegate>{
	NSMutableArray * m_prgUpdates;
	CCScene * m_pCurrentScene;
	InputManager * m_pInputManager;
	ControlOverlay * m_pControl;
	CGPoint m_LastTouch;
	BaseShip * m_pShip;
	BOOL m_bPlayerTouching;
}
@property(nonatomic,assign)CCScene * CurrentScene;
-(id)init;
-(void)updateGame:(ccTime)_fDelta;
-(void)resetGame;
-(void)startGame;
-(void)setUpInterface;
@end
