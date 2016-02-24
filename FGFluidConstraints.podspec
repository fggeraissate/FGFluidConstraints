

Pod::Spec.new do |spec|

  spec.name         = 'FGFluidConstraints'
  spec.version      = '0.0.1'

 spec.summary      = 'Fluid layout in a easy way for iOS!'
 spec.description = 'With this category you can easily add constraints of an array of views that will have equal heights and space between them.'
 spec.homepage     = 'https://github.com/fggeraissate/FGFluidConstraints'

  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.authors      = { 'Fernanda G. Geraissate' => 'fggeraissate@gmail.com' }
  spec.source       = { :git => 'https://github.com/fggeraissate/FGFluidConstraints.git', :tag => spec.version.to_s}

  spec.platform     = :ios, '7.0'

  spec.social_media_url = 'https://twitter.com/innisvie'
  spec.source_files = 'Pods/Classes/**/*.{h,m}'
  spec.public_header_files = 'Pods/Classes/**/*.h'

end
