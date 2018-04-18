Pod::Spec.new do |s|
s.name        = 'SafeObject'
s.version     = '0.0.1'
s.authors     = { 'daniulaolu' => '287929070@qq.com' }
s.homepage    = 'https://github.com/MrLujh/SafeObject'
s.summary     = '项目中防止数组字典崩溃'
s.source      = { :git => 'https://github.com/MrLujh/SafeObject.git',
:tag => s.version.to_s }
s.license     = { :type => "MIT", :file => "LICENSE" }
s.platform = :ios, '7.0'
s.requires_arc = true
s.source_files = "SafeObject", "*.{h,m}"
s.ios.deployment_target = '7.0'
end