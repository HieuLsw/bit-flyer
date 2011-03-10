//
//  BaseShip.h
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 2/24/11.
//  Copyright 2011 Tap Me! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseGameObject.h"

@interface BaseShip : BaseGameObject {

	CGPoint m_Destination;
}

@property (nonatomic,assign) CGPoint Destination;
@end
