declare const RNAudioSpeaker: {
    toggleSpeaker: () => void;
    isSpeaker: () => Promise<boolean | 1 | 0>;
    switchToReceiver: () => void;
    switchToSpeaker: () => void;
};
export default RNAudioSpeaker;
