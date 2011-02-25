//
//  InputManager.m
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 2/25/11.
//  Copyright 2011 Tap Me! Inc. All rights reserved.
//

#import "InputManager.h"


@implementation InputManager


-(void)handleTouchLeft
{
	
}

-(void)handleTouchRight
{
	
}


-(NSArray*)getLastFrameTouches
{
	NSArray * _prgTouches = [m_prgInputs autorelease];
	
	[m_prgInputs release];
	m_prgInputs = [[NSMutableArray alloc]init];
	
	return _prgTouches;
}

-(void)dealloc
{
	[m_prgInputs release];
	
	[super dealloc];
}
@end
