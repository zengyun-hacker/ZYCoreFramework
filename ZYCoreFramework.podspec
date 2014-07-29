Pod::Spec.new do |s|
  s.name         = 'ZYCoreFramework'
  s.version      = '1.0'
  s.license      =  :type => 'ZY'
  s.homepage     = 'http://www.codingtime.info'
  s.authors      =  'Programmer Du' => 'zengyun.programmer@gmail.com'
  s.summary      = 'It's a iOS Core Framework'

# Source Info
  s.platform     =  :ios, '6.0'
  s.source       =  :git => 'git@bitbucket.org:yun_zeng/zycoreframework.git', :tag => '1.0'
  s.source_files = 'Core/*.{h,m}'

  s.requires_arc = true
  
# Pod Dependencies

end