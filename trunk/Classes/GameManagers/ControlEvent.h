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
}TOUCH_EVENT;

@interface ControlEvent : NSObject {
	TOUCH_EVENT m_uEventId;
	
}
@property(nonatomic,readonly)TOUCH_EVENT EventId;

@end
