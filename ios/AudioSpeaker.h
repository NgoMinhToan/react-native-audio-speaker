
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNAudioSpeakerSpec.h"

@interface AudioSpeaker : NSObject <NativeAudioSpeakerSpec>
#else
#import <React/RCTBridgeModule.h>

@interface AudioSpeaker : NSObject <RCTBridgeModule>
#endif

@end
