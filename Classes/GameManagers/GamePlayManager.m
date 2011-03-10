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
	
	if(m_bPlayerTouching)
	{
		CGPoint _GLTouch = [[CCDirector sharedDirector] convertToGL:m_LastTouch];
		
		[m_pControl handleTouch:_GLTouch withOtherLoc:m_pShip.position];
	
		
		m_pShip.Destination = _GLTouch;
		
		m_pControl.visible = YES;
	}
	else {
		m_pControl.visible = NO;
	}

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
	[m_pShip release];
	m_pShip = [[BaseShip alloc]initWithSprite:[CCSprite spriteWithFile:@"shipBlue.png"]];
	m_pShip.position = [[CCDirector sharedDirector] convertToGL:CGPointMake(160,150)];
	[m_pCurrentScene addChild:m_pShip];
	[m_prgUpdates addObject:m_pShip];
	[m_pCurrentScene addChild:m_pControl];
}

-(void)dealloc
{
	[m_pShip release];
	[m_pControl release];
	[m_pInputManager release];
	[m_prgUpdates release];
	[super dealloc];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	m_bPlayerTouching = YES;
	m_LastTouch = [touch locationInView:nil];
	return YES;
}
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	m_bPlayerTouching = YES;
	m_LastTouch = [touch locationInView:nil];
}
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	m_bPlayerTouching = NO;
}
- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
	m_bPlayerTouching = NO;
}

@end
