Pod::Spec.new do |s|
  s.name             = 'RadioPopup'
  s.version          = '0.1.0'
  s.summary          = 'RadioPopup'
  s.description      = <<-DESC
                      iOS, Objective C, Simple RadioPopup
                      DESC
  s.homepage         = 'https://github.com/bugkingK/RadioPopup'
  s.screenshots      = 'https://github.com/bugkingK/RadioPopup/Resource/image1.png', 'https://github.com/bugkingK/RadioPopup/Resource/image2.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'bugkingK' => 'myway0710@naver.com' }
  s.source           = { :git => 'https://github.com/bugkingK/RadioPopup.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Library/*'
end