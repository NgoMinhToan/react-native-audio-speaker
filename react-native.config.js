module.exports = {
    dependencies: {
        "react-native-audio-speaker": {
            platforms: {
                ios: {
                    podspecPath: '../node_modules/react-native-audio-speaker/react-native-audio-speaker.podspec',
                },
                android: {
                    sourceDir: '../node_modules/react-native-audio-speaker/android',
                },
            },
        }
    },
};
