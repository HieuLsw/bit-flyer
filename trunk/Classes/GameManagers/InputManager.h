//
//  InputManager.h
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 2/25/11.
//  Copyright 2011 Tap Me! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface InputManager : NSObject {
	NSMutableArray * m_prgInputs;
}
-(void)handleTouchLeft;
-(void)handleTouchRight;
-(NSArray*)getLastFrameTouches;
@end
