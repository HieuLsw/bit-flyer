//
//  ControlEvent.m
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 2/25/11.
//  Copyright 2011 Tap Me! Inc. All rights reserved.
//

#import "ControlEvent.h"


@implementation ControlEvent
@synthesize EventId = m_uEventId;

-(id)initWithEventId:(CONTROL_EVENT)_uTouchId
{
	if(self = [super init])
	{
		m_uEventId = _uTouchId;
	}
	
	return self;
}

+(id)ControlEventWithId:(CONTROL_EVENT)_uTouchId
{
	ControlEvent * _pEvent = [[ControlEvent alloc]initWithEventId:_uTouchId];
	[_pEvent autorelease];
	return _pEvent;
}
@end
