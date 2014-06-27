Pod::Spec.new do |s|
  
  s.name = 'JDStatusBarNotification'
  s.version = '1.4.8'
  s.summary = 'Easy, customizable notifications displayed on top of the statusbar. With progress and activity.'

  s.description = 'Show messages on top of the status bar. Customizable colors, font and animation. Supports progress display and can show an activity indicator. iOS 7 ready. iOS6 support.'
  
  s.homepage = 'https://github.com/alexllao/NSString-Levenshtein.h'
  s.license = { :type => 'MIT' }
  s.author = { 'Àlex Llaó' => 'alexllao@me.com' }
  
  s.source = { :git => 'https://github.com/alexllao/NSString-Levenshtein.h.git', :tag => "#{s.version}" }
  s.source_files = 'JDStatusBarNotification/**'
    
  s.platform = :ios, '6.0'
  s.requires_arc = true

end