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
#import "CCTouchDispatcher.h"
#import "ControlOverlay.h"
@implementation GamePlayManager
@synthesize CurrentScene = m_pCurrentScene;

-(id)init
{
	if(self = [super init])
	{
		m_prgUpdates = [[NSMutableArray alloc]init];
		m_pInputManager = [[InputManager alloc]init];
		m_pControl = [[ControlOverlay alloc]initWithTouch:[CCSprite spriteWithFile:@"touch.png"] andMiddle:[CCSprite spriteWithFile:@"middle.png"]];
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	
		[self startGame];
	}
	
	return self;
}

-(void)updateGame:(ccTime)_fDelta
{
	[m_pControl handleTouch:[[CCDirector sharedDirector] convertToGL:m_LastTouch] withOtherLoc:[[CCDirector sharedDirector] convertToGL:CGPointMake(160,150)]];
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
	_pShip.position = [[CCDirector sharedDirector] convertToGL:CGPointMake(160,150)];
	[m_pCurrentScene addChild:_pShip];
	[m_prgUpdates addObject:_pShip];
	[_pShip release];
	[m_pCurrentScene addChild:m_pControl];
}

-(void)dealloc
{
	[m_pControl release];
	[m_pInputManager release];
	[m_prgUpdates release];
	[super dealloc];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	m_LastTouch = [touch locationInView:nil];
	return YES;
}
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	m_LastTouch = [touch locationInView:nil];
}
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	//m_LastTouch = CGPointMake(-1, -1);
}
- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
	m_LastTouch = CGPointMake(-1, -1);
}

@end
