import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-audio-speaker' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n' + 
  '- Manual link by add this line into Podfile\n' +
  `pod 'react-native-audio-speaker', :path => '../node_modules/react-native-audio-speaker'
`;

const RNAudioSpeaker = NativeModules.RNAudioSpeaker
  ? NativeModules.RNAudioSpeaker
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

type TRNAudioSpeaker = {
    toggleSpeaker: () => void;
    isSpeaker: () => Promise<boolean | 1 | 0>;
    switchToReceiver: () => void;
    switchToSpeaker: () => void;
}

export default RNAudioSpeaker as TRNAudioSpeaker;
