//
//  SoundManager.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenAL/al.h>
#import <OpenAL/alc.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVAudioPlayer.h>
#import "Common.h"

#define kMaxSources 32

@interface SoundManager : NSObject {
	ALCcontext* context;
	ALCdevice*  device;
	
	NSMutableArray*      soundSources;
	NSMutableDictionary* soundLibrary;
	AVAudioPlayer*       backMusic;
}

+ (SoundManager*)sharedSoundManager;
- (id)init;

- (void)addWithLoad:(NSString*)SEKey 
			 FileName:(NSString*)fileName 
			 FileType:(NSString*)fileType 
			Frequency:(NSUInteger)frequency;

- (NSUInteger) playSoundWithKey:(NSString*)SEKey 
						   gain:(ALfloat)theGain 
						  pitch:(ALfloat)thePitch 
					   location:(Vector2f)theLocation 
					 shouldLoop:(BOOL)theShouldLoop;

- (void)loadBackMusic:(NSString*)fileName FileType:(NSString*)fileType;
- (void)playBackMusic;
- (void)dealloc;

@end
