Pod::Spec.new do |s|

  s.name         = "Utils"
  s.version      = "0.0.1"
  s.homepage     = "https://github.com/alberortega/Utils"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Nick Hodapp" => "alberto.ortega@i3television.es" }
  s.source       = { :git => "https://github.com/alberortega/Utils.git", :tag => "0.0.1" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files  = '**/*.{h,m}'
  
  s.subspec 'Image' do |s1|
    s1.source = 'Categories/Image/**/*.{h,m}'
  end
end