//
//  AudioSpeaker.h
//  AudioSpeaker
//
//  Created by Ngo Minh Toan on 29/11/24.
//

#ifdef RCT_NEW_ARCH_ENABLED
#import "RNAudioSpeaker.h"

@interface AudioSpeaker : NSObject <NativeAudioSpeakerSpec>
#else
#import <React/RCTBridgeModule.h>

@interface AudioSpeaker : NSObject <RCTBridgeModule>
#endif

@end
