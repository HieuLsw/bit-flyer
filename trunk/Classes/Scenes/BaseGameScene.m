//
//  BaseGameScene.m
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 2/24/11.
//  Copyright 2011 Tap Me! Inc. All rights reserved.
//

#import "BaseGameScene.h"
#import "GamePlayManager.h"
@implementation BaseGameScene

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	BaseGameScene *layer = [BaseGameScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Base Game Scene" fontName:@"Marker Felt" fontSize:64];
		
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
		
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
		
	
		
		
		m_pGamePlayMgr = [[GamePlayManager alloc]init];
		m_pGamePlayMgr.CurrentScene = self;
		[m_pGamePlayMgr startGame];
		[m_pGamePlayMgr resetGame];
		
		[self addChild:m_pGamePlayMgr];
		
		
	//	[self setUpInterface];
	}
	return self;
}



// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	
	m_pGamePlayMgr.CurrentScene = nil;
	[m_pGamePlayMgr release];
	[super dealloc];
}

@end
