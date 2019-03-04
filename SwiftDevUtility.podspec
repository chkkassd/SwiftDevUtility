Pod::Spec.new do |spec|

  spec.name         = "SwiftDevUtility"
  spec.version      = "1.0.2"
  spec.summary      = "Useful functions of Swift development"

  spec.description  = <<-DESC
                    SwiftDevUtility is a useful development tool which can make your programming easy.
                   DESC

  spec.homepage     = "https://github.com/chkkassd/SwiftDevUtility"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Peter Shi" => "peter1990lynn@gmail.com" }

  spec.source       = { :git => "https://github.com/chkkassd/SwiftDevUtility.git", :tag => "#{spec.version}" }
  spec.ios.deployment_target = '11.0'
  spec.source_files  = "SwiftDevUtility/**/*"
  spec.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }

end
