import { NativeModules } from 'react-native';

type T_REACT_NATIVE_MODULE = {
    RNAudioSpeaker: {
        toggleSpeaker: () => void;
        isSpeaker: () => Promise<boolean | 1 | 0>;
        switchToReceiver: () => void;
        switchToSpeaker: () => void;
    }
}

const { RNAudioSpeaker } = NativeModules as T_REACT_NATIVE_MODULE;

export default RNAudioSpeaker;
