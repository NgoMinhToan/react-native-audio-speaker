require "json"

new_arch_enabled = ENV['RCT_NEW_ARCH_ENABLED'] == '1'
ios_platform = new_arch_enabled ? '11.0' : '9.0'

package = JSON.parse(File.read(File.join(__dir__, "package.json")))
folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

Pod::Spec.new do |s|
  s.name         = package['name']
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => ios_platform }
  s.source       = { :git => package["repository"]["url"], :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,mm,cpp}"

  # Use install_modules_dependencies helper to install the dependencies if React Native version >=0.71.0.
  # See https://github.com/facebook/react-native/blob/febf6b7f33fdb4904669f99d795eba4c0f95d7bf/scripts/cocoapods/new_architecture.rb#L79.
  if respond_to?(:install_modules_dependencies, true)
    install_modules_dependencies(s)
  else
    s.dependency "React-Core"

    # Don't install the dependencies when we run `pod install` in the old architecture.
    if ENV['RCT_NEW_ARCH_ENABLED'] == '1' then
      s.compiler_flags = folly_compiler_flags + " -DRCT_NEW_ARCH_ENABLED=1"
      s.pod_target_xcconfig    = {
          "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost\"",
          "OTHER_CPLUSPLUSFLAGS" => "-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1",
          "CLANG_CXX_LANGUAGE_STANDARD" => "c++17"
      }
      s.preserve_paths = "build/generated/**/*"
      s.source_files   += "build/generated/ios/**/*.{h,m,mm,cpp}"
      s.dependency "React-Codegen"
      s.dependency "RCT-Folly"
      s.dependency "RCTRequired"
      s.dependency "RCTTypeSafety"
      s.dependency "ReactCommon/turbomodule/core"
      s.script_phase = {
        :name => 'Generate Specs',
        :input_files => ['${PODS_TARGET_SRCROOT}/package.json'],
        :output_files => ['${PODS_TARGET_SRCROOT}/build/generated/ios/RNAudioSpeaker.h'],
        :shell_path => '/bin/sh',
        :script => <<-SCRIPT
          set -e
          export RCT_NEW_ARCH_ENABLED=1
          export NODE_BINARY=$(which node)
          cd "${PODS_TARGET_SRCROOT}"
          $NODE_BINARY ../node_modules/react-native/scripts/generate-specs-cli.js \
            --platform ios \
            --outputDir build/generated \
            --config package.json
        SCRIPT
      }
    end
  end
end
