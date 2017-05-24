#
# Be sure to run `pod lib lint TestGroup.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TestGroup'
  s.version          = '0.0.1'
  s.summary          = 'TestGroup'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 测试组件化 组件分支
                       DESC

  s.homepage         = 'https://github.com/ganliangjun/testGroup'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '970721775@qq.com' => '970721775@qq.com' }
  s.source           = { :git => 'https://github.com/ganliangjun/testGroup.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

#s.source_files = 'TestGroup/Classes/**/*'
    s.subspec 'categry' do |a|
        a.source_files = 'TestGroup/Classes/categry/**/*'
    end

    s.subspec 'GLJBaseModel' do |b|
        b.source_files = 'TestGroup/Classes/GLJBaseModel/**/*'
    end

    s.subspec 'categry' do |c|
        c.source_files = 'TestGroup/Classes/GLJNoteworkRequestTool/**/*'
        s.dependency 'AFNetworking'
    end

    s.subspec 'categry' do |d|
        d.source_files = 'TestGroup/Classes/tool/**/*'
    end


  # s.resource_bundles = {
  #   'TestGroup' => ['TestGroup/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'

end
