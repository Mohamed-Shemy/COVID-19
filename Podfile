platform :ios, '12.1'

use_frameworks!
inhibit_all_warnings!
install! 'cocoapods', :warn_for_unused_master_specs_repo => false

target 'COVID19' do
  
  # Network
  pod 'Moya'
  
  # Image Caching
  pod 'Kingfisher'
  pod 'SVGKit'
  
  #
  pod 'NVActivityIndicatorView', :git => 'https://github.com/ninjaprox/NVActivityIndicatorView.git', :tag => '4.8.0'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.0'
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.1'
    end
  end
end
