module.exports = {
    dependency: {
        platforms: {
            ios: {
                podspecPath: require.resolve('react-native-audio-speaker/react-native-audio-speaker.podspec'),
            },
            android: {
                sourceDir: '../node_modules/react-native-audio-speaker/android',
            },
        },
    },
};
