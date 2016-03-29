Pod::Spec.new do |s|
  s.name         = "iso-rfc822-date"
  s.version      = "1.0.0"
  s.summary      = "ISO and RFC822 extensions to NSDate for parsing and formatting."
  s.description  = <<-DESC
                   ISO and RFC822 extensions to NSDate for parsing and formatting.
                   The used date formatters are cached as a singleton instance to speed
                   up the formatting and parsing.
                   DESC

  s.homepage     = "https://github.com/anfema/iso-rfc822-date"
  s.license      = { :type => "BSD", :file => "LICENSE.txt" }
  s.author             = { "Johannes Schriewer" => "j.schriewer@anfe.ma" }
  s.social_media_url   = "http://twitter.com/dunkelstern"

  s.ios.deployment_target = "8.4"
  s.osx.deployment_target = "10.10"

  s.source       = { :git => "https://github.com/anfema/iso-rfc822-date.git", :tag => "1.0.0" }
  s.source_files  = "isodate/*.{m,h}"
  
end
