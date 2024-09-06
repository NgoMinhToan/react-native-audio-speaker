# react-native-audio-speaker

A React Native module to toggle speaker/phone speaker for iOS and Android.

## Installation
npm
```bash
npm install react-native-audio-speaker

# or

yarn add react-native-audio-speaker
```

### iOS

Add the following line to your `ios/Podfile`:
```ruby
pod 'react-native-audio-speaker', :path => '../node_modules/react-native-audio-speaker'

```

Then run:
```bash
cd ios && pod install
```

### Android

No additional steps required for Android.

## Usage

```javascript
import RNAudioSpeaker from 'react-native-audio-speaker';
// Toggle speaker
RNAudioSpeaker.toggleSpeaker();
// Check if speaker is on
RNAudioSpeaker.isSpeaker().then((isSpeakerOn) => {
console.log('Speaker is on:', isSpeakerOn);
});
// Switch to speaker
RNAudioSpeaker.switchToSpeaker();
// Switch to receiver
RNAudioSpeaker.switchToReceiver();

```

## License

MIT