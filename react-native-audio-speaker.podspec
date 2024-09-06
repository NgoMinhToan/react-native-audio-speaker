Pod::Spec.new do |s|
  s.name         = "RNAudioSpeakerModule"
  s.version      = "1.0.0"
  s.summary      = "A React Native module allow toggle speaker/phone speaker"
  s.homepage     = "https://github.com/NgoMinhToan/react-native-audio-speaker.git"
  s.license      = "MIT"
  s.author       = { "Minh Toan" => "mtoan2610@email.com" }
  s.source       = { :git => "https://github.com/NgoMinhToan/react-native-audio-speaker.git", :tag => "1.0.0" }
  s.platform     = :ios, "9.0"
  s.source_files  = "ios/**/*.{h,m}"
  s.dependency 'React'
end
