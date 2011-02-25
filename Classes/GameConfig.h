//
//  GameConfig.h
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 2/24/11.
//  Copyright Tap Me! Inc 2011. All rights reserved.
//

#ifndef __GAME_CONFIG_H
#define __GAME_CONFIG_H

//
// Supported Autorotations:
//		None,
//		UIViewController,
//		CCDirector
//
#define kGameAutorotationNone 0
#define kGameAutorotationCCDirector 1
#define kGameAutorotationUIViewController 2

//
// Define here the type of autorotation that you want for your game
//
#define GAME_AUTOROTATION kGameAutorotationNone

typedef enum
{
	BASE_GAME_OBJ
}GAME_OBJECT_ID;

#endif // __GAME_CONFIG_H