Pod::Spec.new do |s|

  s.name         = "I3Utils"
  s.version      = "0.0.1"
  s.summary      = "Storyboard category extension for MMDrawerController"
  s.homepage     = "https://github.com/TomSwift/MMDrawerController-Storyboard"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Nick Hodapp" => "alberto.ortega@i3television.es" }
  s.source       = { :git => "https://github.com/TomSwift/MMDrawerController-Storyboard.git", :tag => "0.0.1" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files  = '*.{h,m}'
  
end