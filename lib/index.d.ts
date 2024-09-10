type TRNAudioSpeaker = {
    toggleSpeaker: () => void;
    isSpeaker: () => Promise<boolean | 1 | 0>;
    switchToReceiver: () => void;
    switchToSpeaker: () => void;
};
declare const _default: TRNAudioSpeaker;
export default _default;
