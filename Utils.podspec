Pod::Spec.new do |s|

  s.name         = "Utils"
  s.version      = "0.0.1"
  s.homepage     = "https://github.com/alberortega/Utils"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Alberto Ortega" => "alberto.ortega@i3television.es" }
  s.source       = { :git => "https://github.com/alberortega/Utils.git", :tag => "0.0.1" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files  = 'Classes/**/*.{h,m}'
  
  s.subspec 'Image' do |s1|
    s1.source_files = 'Classes/Categories/Image/**/*.{h,m}'
  end

  s.subspec 'Color' do |s1|
    s1.source_files = 'Classes/Categories/Color/**/*.{h,m}'
  end

  s.subspec 'String' do |s1|
    s1.source_files = 'Classes/Categories/String/**/*.{h,m}'
  end

  s.subspec 'Data' do |s1|
    s1.source_files = 'Classes/Categories/Data/**/*.{h,m}'
  end

  s.subspec 'Screen' do |s1|
    s1.source_files = 'Classes/Categories/Screen/**/*.{h,m}'
  end

  s.subspec 'URLConnection' do |s1|
    s1.source_files = 'Classes/Categories/URLConnection/**/*.{h,m}'
  end


  s.subspec 'AlertView' do |s1|
    s1.source_files = 'Classes/Categories/AlertView/**/*.{h,m}'
  end

  s.subspec 'ViewController' do |s1|
    s1.source_files = 'Classes/Categories/ViewController/**/*.{h,m}'
  end

end