Pod::Spec.new do |s|
s.name        = 'SafeObject_zp'
s.version     = '0.1.1'
s.authors     = { 'ZPP506' => '94460330@qq.com' }
s.homepage    = 'https://github.com/ZPP506/SafeObject'
s.summary     = '项目中防止数组字典崩溃'
s.source      = { :git => 'https://github.com/ZPP506/SafeObject.git',
:tag => s.version.to_s }
s.license     = { :type => "MIT", :file => "LICENSE" }
s.platform = :ios, '7.0'
s.requires_arc = true
s.source_files = "SafeObject_zp", "*.{h,m}"
s.ios.deployment_target = '7.0'
end