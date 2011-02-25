//
//  GamePlayManager.m
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 2/25/11.
//  Copyright 2011 Tap Me! Inc. All rights reserved.
//

#import "GamePlayManager.h"
#import "BaseGameObject.h"
#import "BaseShip.h"
#import "InputManager.h"

@implementation GamePlayManager
@synthesize CurrentScene = m_pCurrentScene;

-(id)init
{
	if(self = [super init])
	{
		m_prgUpdates = [[NSMutableArray alloc]init];
		m_pInputManager = [[InputManager alloc]init];
		[self setUpInterface];
	}
	
	return self;
}

-(void)updateGame:(ccTime)_fDelta
{
	BaseGameObject * _pObj = nil;
	for (NSUInteger i = 0; i < [m_prgUpdates count]; i++) 
	{
		_pObj = [m_prgUpdates objectAtIndex:i];
		assert([_pObj isKindOfClass:[BaseGameObject class]]);
		
		[_pObj updateWithGameData:_fDelta];
	}
}

-(void)startGame
{
	 [self schedule:@selector(updateGame:)];
}
-(void)stopGame
{
	[self unscheduleUpdate];
}

-(void)resetGame
{
	[m_prgUpdates removeAllObjects];
	BaseShip * _pShip = [[BaseShip alloc]initWithSprite:[CCSprite spriteWithFile:@"shipBlue.png"]];
	_pShip.position = CGPointMake(160,150);
	[m_pCurrentScene addChild:_pShip];
	[m_prgUpdates addObject:_pShip];
	[_pShip release];
}

-(void)dealloc
{
	[m_pInputManager release];
	[m_prgUpdates release];
	[super dealloc];
}

@end
