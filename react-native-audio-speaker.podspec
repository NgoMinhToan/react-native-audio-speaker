Pod::Spec.new do |s|
  s.name         = "react-native-audio-speaker"
  s.version      = "1.0.0"
  s.summary      = "A React Native module allow toggle speaker/phone speaker"
  s.homepage     = "https://github.com/NgoMinhToan/react-native-audio-speaker"
  s.license      = "MIT"
  s.author       = { "Minh Toan" => "mtoan2610@email.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/NgoMinhToan/react-native-audio-speaker.git", :tag => "#{s.version}" }
  s.source_files = "ios/**/*.{h,m}"
  s.requires_arc = true
  s.dependency "React-Core"
end
