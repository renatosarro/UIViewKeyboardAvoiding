#
# Be sure to run `pod lib lint UIViewKeyboardAvoiding.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "UIViewKeyboardAvoiding"
  s.version          = "0.1.0"
  s.summary          = "A simple way to make your UITextField to be always visible when the keyboard appears"

  s.description      = "A simple way to make your UITextField to be always visible, moving up the UIView when the keyboard appears (firstResponder)"

  s.homepage         = "https://github.com/renatosarro/UIViewKeyboardAvoiding"
  s.license          = 'MIT'
  s.author           = { "Renato Matos" => "renatorsarro@gmail.com" }
  s.source           = { :git => "https://github.com/renatosarro/UIViewKeyboardAvoiding.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/rmatos_'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

s.source_files = 'Pod/Classes/*.{h,m}'
  s.resource_bundles = {
    'UIViewKeyboardAvoiding' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
