//
//  AudioSpeaker.m
//  AudioSpeaker
//
//  Created by Ngo Minh Toan on 29/11/24.
//

//#import "AudioSpeaker.h"
//
//@implementation AudioSpeaker
//
//@end

#import "AudioSpeaker.h"
#import <AVFoundation/AVFoundation.h>

@implementation AudioSpeaker
RCT_EXPORT_MODULE(RNAudioSpeaker);

RCT_EXPORT_METHOD(switchToSpeaker:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    NSError *error = nil;
    if (![audioSession setCategory:AVAudioSessionCategoryPlayAndRecord
                      withOptions:AVAudioSessionCategoryOptionDefaultToSpeaker
                            error:&error]) {
        reject(@"set_category_error", @"Error setting audio session category.", error);
        return;
    }
    if (![audioSession setActive:YES error:&error]) {
        reject(@"set_active_error", @"Error activating audio session.", error);
        return;
    }
    resolve(@(YES));
}

RCT_EXPORT_METHOD(switchToReceiver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    NSError *error = nil;
    if (![audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:&error]) {
        reject(@"set_category_error", @"Error setting audio session category.", error);
        return;
    }
    if (![audioSession overrideOutputAudioPort:AVAudioSessionPortOverrideNone error:&error]) {
        reject(@"override_port_error", @"Error setting output port.", error);
        return;
    }
    if (![audioSession setActive:YES error:&error]) {
        reject(@"set_active_error", @"Error activating audio session.", error);
        return;
    }
    resolve(@(YES));
}

RCT_EXPORT_METHOD(isSpeaker:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    NSArray<AVAudioSessionPortDescription *> *outputs = audioSession.currentRoute.outputs;

    if (outputs.count > 0) {
        resolve(@([outputs[0].portType isEqualToString:AVAudioSessionPortBuiltInSpeaker]));
    } else {
        reject(@"no_audio_output", @"No audio output is available.", nil);
    }
}

RCT_EXPORT_METHOD(toggleSpeaker:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    NSError *error = nil;

    if (audioSession.currentRoute.outputs.count > 0 &&
        [audioSession.currentRoute.outputs[0].portType isEqualToString:AVAudioSessionPortBuiltInSpeaker]) {
        [self switchToReceiver:resolve rejecter:reject];
    } else {
        [self switchToSpeaker:resolve rejecter:reject];
    }
}

@end
