import { NativeModules } from 'react-native';

const { RNAudioSpeaker } = NativeModules;

type TRNAudioSpeaker = {
    toggleSpeaker: () => void;
    isSpeaker: () => Promise<boolean | 1 | 0>;
    switchToReceiver: () => void;
    switchToSpeaker: () => void;
}

export default RNAudioSpeaker as TRNAudioSpeaker;
