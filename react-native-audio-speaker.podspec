require 'json'

new_arch_enabled = ENV['RCT_NEW_ARCH_ENABLED'] == '1'
ios_platform = new_arch_enabled ? '11.0' : '9.0'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = package['name']
  s.version      = package['version']
  s.summary      = package['description']
  s.homepage     = package['homepage']
  s.license      = package['license']
  s.authors       = package['author']
  s.platforms     = {:ios => ios_platform}
  s.source       = { :git => "https://github.com/NgoMinhToan/react-native-audio-speaker.git", :tag => "v#{s.version}" }
  s.source_files = "ios/**/*.{h,m,mm,swift}"
  s.requires_arc = true
  s.dependency "React-Core"
end
