//
//  BaseGameObject.h
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 2/24/11.
//  Copyright 2011 Tap Me! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefines.h"



@interface BaseGameObject : CCNode 
{
	CCSprite * m_pSprite;
}

-(id)initWithSprite:(CCSprite*)_pSprite;
-(void)didCollideWithType:(GAME_OBJECT_ID)_ObjId;
-(GAME_OBJECT_ID)getObjId;
-(void)updateWithGameData:(ccTime)_fTime;
@end
