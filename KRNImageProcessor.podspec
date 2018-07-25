
Pod::Spec.new do |s|

  s.name         = "KRNImageProcessor"
  s.version      = "0.0.1"
  s.summary      = "KRNImageProcessor is a simple group of classes to crop, resize and perform other actions with images"

  s.homepage     = "https://github.com/ulian-onua/KRNImageProcessor"

  s.license      = { :type => "MIT", :file => "LICENSE" }



  s.author             = { "Julian Drapaylo" => "ulian.onua@gmail.com" }
#s.social_media_url   = "http://www.linkedin.com/in/julian-drapaylo"



  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/ulian-onua/KRNImageProcessor.git", :tag => "0.0.1" }


  s.source_files  = "Source/*.{swift}"
#s.public_header_files = "Source/*.{swift}"

 s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '4.0',
  }

  s.frameworks = "UIKit"
  s.requires_arc = true

end
