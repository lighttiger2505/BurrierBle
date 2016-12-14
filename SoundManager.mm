//
//  SoundManager.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SoundManager.h"

@implementation SoundManager

+ (SoundManager*)sharedSoundManager
{ 
	static SoundManager* sharedInstance = nil;
	if (!sharedInstance)
	{
		sharedInstance = [[self alloc] init];
	}
	return sharedInstance;
}

- (BOOL)initOpenAL
{
	device = alcOpenDevice(NULL);
	if(device){
		context = alcCreateContext(device, NULL);
		alcMakeContextCurrent(context);
		NSUInteger sourceID;
		for(int i = 0; i < kMaxSources; i++){
			alGenSources(1, &sourceID);
			[soundSources addObject:[NSNumber numberWithUnsignedInt:sourceID]];
		}
		return YES;
	}
	return NO;
}

- (id)init {
	[super init];
	soundSources = [[NSMutableArray alloc] init];
	soundLibrary = [[NSMutableDictionary alloc] init];
	[self addWithLoad:@"bom_001" FileName:@"bom02" FileType:@"caf" Frequency:22050];
	[self addWithLoad:@"bom_002" FileName:@"bom07" FileType:@"caf" Frequency:22050];
	[self addWithLoad:@"bom_003" FileName:@"bom08" FileType:@"caf" Frequency:22050];
	
	BOOL result = [self initOpenAL];
	if(!result) return nil;
	return self;
}

- (AudioFileID) openAudioFile:(NSString*)theFilePath {
	
	AudioFileID outAFID;
	// Create an NSURL which will be used to load the file.  This is slightly easier
	// than using a CFURLRef
	NSURL *afUrl = [NSURL fileURLWithPath:theFilePath];
	
	// Open the audio file provided
	OSStatus result = AudioFileOpenURL((CFURLRef)afUrl, kAudioFileReadPermission, 0, &outAFID);
	
	// If we get a result that is not 0 then something has gone wrong.  We report it and 
	// return the out audio file id
	if(result != 0)	{
		NSLog(@"ERROR SoundEngine: Cannot open file: %@", theFilePath);
		return nil;
	}
	
	return outAFID;
}

- (UInt32) audioFileSize:(AudioFileID)fileDescriptor {
	UInt64 outDataSize = 0;
	UInt32 thePropSize = sizeof(UInt64);
	OSStatus result = AudioFileGetProperty(fileDescriptor, kAudioFilePropertyAudioDataByteCount, &thePropSize, &outDataSize);
	if(result != 0)	NSLog(@"ERROR: cannot file file size");
	return (UInt32)outDataSize;
}

- (void)addWithLoad:(NSString*)SEKey
		   FileName:(NSString*)fileName 
		   FileType:(NSString*)fileType 
		  Frequency:(NSUInteger)frequency
{
	NSString* filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
	AudioFileID fileID = [self openAudioFile:filePath];
	UInt32 fileSize = [self audioFileSize:fileID];
	void *outData = malloc(fileSize);
	
	OSStatus result = noErr;
	result = AudioFileReadBytes(fileID, FALSE, 0, &fileSize, outData);
	AudioFileClose(fileID);
	
	if(result != 0){
		NSLog(@"ERROR SoundEngine: Cannot load soundfile:%@",fileName);
		return;
	}
	NSUInteger bufferID;
	alGenBuffers(1, &bufferID);
	alBufferData(bufferID, AL_FORMAT_STEREO16, outData, fileSize, frequency);
	[soundLibrary setObject:[NSNumber numberWithUnsignedInt:bufferID] forKey:SEKey];
	
	if(outData){
		free(outData);
		outData = NULL;
	}
}

/* 
 Search through the max number of sources to find one which is not planning.  If one cannot
 be found that is not playing then the first one which is looping is stopped and used instead.
 If a source still cannot be found then the first source is stopped and used
 */
- (NSUInteger) nextAvailableSource {
	
	// Holder for the current state of the current source
	NSInteger sourceState;
	
	// Find a source which is not being used at the moment
	for(NSNumber *sourceNumber in soundSources) {
		alGetSourcei([sourceNumber unsignedIntValue], AL_SOURCE_STATE, &sourceState);
		// If this source is not playing then return it
		if(sourceState != AL_PLAYING) return [sourceNumber unsignedIntValue];
	}
	
	// If all the sources are being used we look for the first non looping source
	// and use the source associated with that
	NSInteger looping;
	for(NSNumber *sourceNumber in soundSources) {
		alGetSourcei([sourceNumber unsignedIntValue], AL_LOOPING, &looping);
		if(!looping) {
			// We have found a none looping source so return this source and stop checking
			NSUInteger sourceID = [sourceNumber unsignedIntValue];
			alSourceStop(sourceID);
			return sourceID;
		}
	}
	
	// If there are no looping sources to be found then just use the first sounrce and use that
	NSUInteger sourceID = [[soundSources objectAtIndex:0] unsignedIntegerValue];
	alSourceStop(sourceID);
	return sourceID;
}

/*
 Plays the sound which matches the key provided.  The Gain, pitch and if the sound should loop can
 also be set from the method signature
 */
- (NSUInteger) playSoundWithKey:(NSString*)SEKey 
						   gain:(ALfloat)theGain 
						  pitch:(ALfloat)thePitch 
					   location:(Vector2f)theLocation 
					 shouldLoop:(BOOL)theShouldLoop
{
	ALenum err = alGetError(); // clear the error code
	
	// Find the buffer linked to the key which has been passed in
	NSNumber *numVal = [soundLibrary objectForKey:SEKey];
	if(numVal == nil) return 0;
	NSUInteger bufferID = [numVal unsignedIntValue];
	
	// Find an available source i.e. it is currently not playing anything
	NSUInteger sourceID = [self nextAvailableSource];
	
	// Make sure that the source is clean by resetting the buffer assigned to the source
	// to 0
	alSourcei(sourceID, AL_BUFFER, 0);
	//Attach the buffer we have looked up to the source we have just found
	alSourcei(sourceID, AL_BUFFER, bufferID);
	
	// Set the pitch and gain of the source
	alSourcef(sourceID, AL_PITCH, thePitch);
	alSourcef(sourceID, AL_GAIN, theGain);
	
	// Set the looping value
	if(theShouldLoop) {
		alSourcei(sourceID, AL_LOOPING, AL_TRUE);
	} else {
		alSourcei(sourceID, AL_LOOPING, AL_FALSE);
	}
	
	// Check to see if there were any errors
	err = alGetError();
	if(err != 0) {
		NSLog(@"ERROR SoundManager: %d", err);
		return 0;
	}
	
	// Now play the sound
	alSourcePlay(sourceID);
	
	// Return the source ID so that loops can be stopped etc
	return sourceID;
}

- (void)loadBackMusic:(NSString*)fileName FileType:(NSString*)fileType
{
	NSString* filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
	NSURL* fileURL = [NSURL fileURLWithPath:filePath];
	backMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
}

- (void)playBackMusic
{
	[backMusic setNumberOfLoops:-1];
	[backMusic setCurrentTime:0.0f];
	[backMusic play];
}

- (void)dealloc
{
	for(NSNumber *numval in soundSources){
		NSUInteger sourceID = [numval unsignedIntValue];
		alDeleteSources(1, &sourceID);
	}
	alcMakeContextCurrent(NULL);
	alcDestroyContext(context);
	alcCloseDevice(device);
	[super dealloc];
}

@end
