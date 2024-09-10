"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const react_native_1 = require("react-native");
const LINKING_ERROR = `The package 'react-native-audio-speaker' doesn't seem to be linked. Make sure: \n\n` +
    react_native_1.Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
    '- You rebuilt the app after installing the package\n' +
    '- You are not using Expo Go\n' +
    '- Manual link by add this line into Podfile\n' +
    `pod 'react-native-audio-speaker', :path => '../node_modules/react-native-audio-speaker'
`;
const RNAudioSpeaker = react_native_1.NativeModules.RNAudioSpeaker
    ? react_native_1.NativeModules.RNAudioSpeaker
    : new Proxy({}, {
        get() {
            throw new Error(LINKING_ERROR);
        },
    });
exports.default = RNAudioSpeaker;
