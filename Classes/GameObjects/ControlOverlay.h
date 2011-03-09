//
//  ControlOverlay.h
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 3/8/11.
//  Copyright 2011 Tap Me! Inc. All rights reserved.
//

#import "BaseShip.h"

@interface ControlOverlay : CCNode {
	CCNode * m_pTouch;
	CCNode * m_pMiddle;
}


-(id)initWithTouch:(CCSprite*)_pTouch andMiddle:(CCSprite*)_pMiddle;
-(void)handleTouch:(CGPoint)_Touch withOtherLoc:(CGPoint)_OtherRect;
@end
