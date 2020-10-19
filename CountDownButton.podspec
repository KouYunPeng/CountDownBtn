#
# Be sure to run `pod lib lint CountDownButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CountDownButton'
  s.version          = '0.1.3'
  s.summary          = '倒计时按钮的封装'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    用户处理登录，获取手机短信验证码时，发送短信验证码倒计时按钮可以直接使用此模块
                       DESC

  s.homepage         = 'https://github.com/KouYunPeng/CountDownBtn'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kouyunpeng' => 'kyp5146@126.com' }
  s.source           = { :git => 'https://github.com/KouYunPeng/CountDownBtn.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'CountDownButton/Classes'
  
  # s.resource_bundles = {
  #   'CountDownButton' => ['CountDownButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
