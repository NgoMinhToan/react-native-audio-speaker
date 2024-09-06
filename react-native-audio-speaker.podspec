Pod::Spec.new do |s|
  s.name         = "react-native-audio-speaker"
  s.version      = "1.0.0"
  s.description  = <<-DESC
                This React Native module allows toggling between speaker and phone speaker.
                DESC
  s.summary      = "A React Native module allow toggle speaker/phone speaker"
  s.homepage     = "https://github.com/NgoMinhToan/react-native-audio-speaker"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Minh Toan" => "mtoan2610@email.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/NgoMinhToan/react-native-audio-speaker.git", :tag => "v#{s.version}" }
  s.source_files = "ios/**/*.{h,m,mm,swift}"
  s.requires_arc = true
  s.dependency "React-Core"
end
