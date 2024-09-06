module.exports = {
    dependencies: {
        "react-native-audio-speaker": {
            platforms: {
                ios: {
                    podspecPath: path.join(__dirname, 'react-native-audio-speaker.podspec'),
                },
                android: {
                    sourceDir: path.join(__dirname, 'android'),
                },
            },
        }
    },
};
