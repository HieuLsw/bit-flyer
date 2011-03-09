//
//  ControlEvent.h
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 2/25/11.
//  Copyright 2011 Tap Me! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	EVENT_PUSH_LEFT,
	EVENT_PUSH_RIGHT
}CONTROL_EVENT;

@interface ControlEvent : NSObject 
{
	CONTROL_EVENT m_uEventId;
	
}
-(id)initWithEventId:(CONTROL_EVENT)_uTouchId;
+(id)ControlEventWithId:(CONTROL_EVENT)_uTouchId;

@property(nonatomic,readonly)CONTROL_EVENT EventId;

@end
