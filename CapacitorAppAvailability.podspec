
  Pod::Spec.new do |s|
    s.name = 'CapacitorAppAvailability'
    s.version = '0.0.1'
    s.summary = 'Allow users to check if an app is installed on the users device'
    s.license = 'MIT'
    s.homepage = 'https://github.com/danielsogl/capacitor-app-availability'
    s.author = 'Daniel Sogl'
    s.source = { :git => 'https://github.com/danielsogl/capacitor-app-availability', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end