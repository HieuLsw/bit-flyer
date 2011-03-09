//
//  ControlOverlay.m
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 3/8/11.
//  Copyright 2011 Tap Me! Inc. All rights reserved.
//

#import "ControlOverlay.h"


@implementation ControlOverlay


-(id)initWithTouch:(CCSprite*)_pTouch andMiddle:(CCSprite*)_pMiddle
{
	if(self = [super init])
	{
		m_pTouch = [_pTouch retain];
		[self addChild:m_pTouch];
		m_pMiddle = [_pMiddle retain];
		[self addChild:m_pMiddle];
	}
	
	return self;
	
}

-(void)handleTouch:(CGPoint)_Touch withOtherLoc:(CGPoint)_OtherRect
{
	m_pTouch.position = _Touch;
	
	CGPoint _Middle;
	float _fNewY = 0;
	
	_Middle.x = _OtherRect.x + (_Touch.x - _OtherRect.x)*.5;
	_Middle.y = _OtherRect.y + (_Touch.y - _OtherRect.y)*.5;
	
	m_pMiddle.position = _Middle;

	_fNewY = sqrt(pow(_OtherRect.x-_Touch.x,2) +pow(_OtherRect.y-_Touch.y,2));
	
	m_pMiddle.scaleY = _fNewY/m_pMiddle.contentSize.height;
	[m_pMiddle setRotation:CC_RADIANS_TO_DEGREES(atan2( _Touch.x - _OtherRect.x,_Touch.y - _OtherRect.y))];
	
}

-(void)dealloc
{
	[m_pTouch release];
	[m_pMiddle release];
	
	[super dealloc];
}
@end
