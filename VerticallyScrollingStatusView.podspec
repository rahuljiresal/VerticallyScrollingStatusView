#
# Be sure to run `pod lib lint VerticallyScrollingStatusView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "VerticallyScrollingStatusView"
  s.version          = "0.1.0"
  s.summary          = "A short description of VerticallyScrollingStatusView."
  s.description      = <<-DESC
                       A subclass of UIView that has scrolling animation when setting its text.
For more information, check the screenshots or try the example project.
                       DESC
  s.homepage         = "https://github.com/<GITHUB_USERNAME>/VerticallyScrollingStatusView"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Rahul Jiresal" => "rahul.jiresal@gmail.com" }
  s.source           = { :git => "https://github.com/rahuljiresal/VerticallyScrollingStatusView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/rahuljiresal'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'VerticallyScrollingStatusView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'PureLayout'
end
