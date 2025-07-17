import { NativeModules, Platform } from 'react-native';
import NativeAudioSpeaker from './NativeAudioSpeaker';

const LINKING_ERROR =
  `The package 'react-native-audio-speaker' doesn't seem to be linked. Make sure:\n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n' +
  "- You linked the module correctly (CocoaPods / Gradle)\n";

const RNAudioSpeaker = NativeAudioSpeaker ??
  (NativeModules.RNAudioSpeaker
    ? NativeModules.RNAudioSpeaker
    : new Proxy(
        {},
        {
          get() {
            throw new Error(LINKING_ERROR);
          },
        }
      )
  );

type TRNAudioSpeaker = {
  toggleSpeaker: () => void;
  isSpeaker: () => Promise<boolean | 1 | 0>;
  switchToReceiver: () => void;
  switchToSpeaker: () => void;
};

export default RNAudioSpeaker as TRNAudioSpeaker;
