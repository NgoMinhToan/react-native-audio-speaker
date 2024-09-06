//
//  RNAudioSpeakerModule.m
//
//  Created by Ngo Minh Toan on 16/04/2024.
//

#import "RNAudioSpeakerModule.h"
#import <AVFoundation/AVFoundation.h>

@implementation RNAudioSpeakerModule

RCT_EXPORT_MODULE(RNAudioSpeaker);

RCT_EXPORT_METHOD(switchToSpeaker) {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    NSError *error = nil;
    if (![audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:&error]) {
        NSLog(@"Error setting category: %@", error.localizedDescription);
    }
    if (![audioSession overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:&error]) {
        NSLog(@"Error setting output port: %@", error.localizedDescription);
    }
    if (![audioSession setActive:YES error:&error]) {
        NSLog(@"Error activating session: %@", error.localizedDescription);
    }
}

RCT_EXPORT_METHOD(switchToReceiver) {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    NSError *error = nil;
    if (![audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:&error]) {
        NSLog(@"Error setting category: %@", error.localizedDescription);
    }
    if (![audioSession overrideOutputAudioPort:AVAudioSessionPortOverrideNone error:&error]) {
        NSLog(@"Error setting output port: %@", error.localizedDescription);
    }
    if (![audioSession setActive:YES error:&error]) {
        NSLog(@"Error activating session: %@", error.localizedDescription);
    }
}

RCT_EXPORT_METHOD(isSpeaker:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    resolve(@(audioSession.currentRoute.outputs[0].portType == AVAudioSessionPortBuiltInSpeaker));
}

RCT_EXPORT_METHOD(toggleSpeaker) {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if (audioSession.currentRoute.outputs[0].portType == AVAudioSessionPortBuiltInSpeaker) {
        [self switchToReceiver];
    } else {
        [self switchToSpeaker];
    }
}

@end
