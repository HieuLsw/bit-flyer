//
//  BaseGameScene.h
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 2/24/11.
//  Copyright 2011 Tap Me! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@class GamePlayManager;

@interface BaseGameScene : CCLayer {
	GamePlayManager * m_pGamePlayMgr;
}

@end
