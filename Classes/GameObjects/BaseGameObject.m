//
//  BaseGameObject.m
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 2/24/11.
//  Copyright 2011 Tap Me! Inc. All rights reserved.
//

#import "BaseGameObject.h"


@implementation BaseGameObject

-(id)initWithSprite:(CCSprite*)_pSprite
{
	if(self = [super init])
	{
		m_pSprite = [_pSprite retain];
		[self addChild:_pSprite];
		[self schedule:@selector(updateWithGameData:)];
	}
	
	return self;
}

-(void)didCollideWithType:(GAME_OBJECT_ID)_ObjId
{
	return;
}

-(GAME_OBJECT_ID)getObjId
{
	return BASE_GAME_OBJ;
}

-(void)updateWithGameData:(ccTime)_fTime
{
	
}

-(void)dealloc
{
	[m_pSprite release];
	[super dealloc];
}

@end
