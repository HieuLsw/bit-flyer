//
//  BaseShip.m
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 2/24/11.
//  Copyright 2011 Tap Me! Inc. All rights reserved.
//

#import "BaseShip.h"


@implementation BaseShip
@synthesize Destination = m_Destination;

const float SHIP_SPEED = 225;

-(void)updateWithGameData:(ccTime)_fTime
{

	float _fStep = 0;
	CGPoint _NewLoc;
	//if (self.position.x != m_Destination.x) 
	{
		_fStep =  ((self.position.x < m_Destination.x) ?  SHIP_SPEED * _fTime : -SHIP_SPEED * _fTime);
	}
	
	_NewLoc.x = _fStep + self.position.x;
	
	//if (self.position.y != m_Destination.y) 
	{
		_fStep = ((self.position.y < m_Destination.y) ?  SHIP_SPEED * _fTime : -SHIP_SPEED * _fTime);
		
	}
	
	_NewLoc.y = _fStep + self.position.y;
	
	[self setPosition:_NewLoc];
}


@end
