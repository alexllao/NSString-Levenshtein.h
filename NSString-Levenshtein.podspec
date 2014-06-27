Pod::Spec.new do |s|
  
  s.name = 'NSString-Levenshtein.h'
  s.version = '1.0.0'
  s.summary = ''

  s.description = ''
  
  s.homepage = 'https://github.com/alexllao/NSString-Levenshtein.h'
  s.license = { :type => 'MIT' }
  s.author = { 'Àlex Llaó' => 'alexllao@me.com' }
  
  s.source = { :git => 'https://github.com/alexllao/NSString-Levenshtein.h.git', :tag => "#{s.version}" }
  s.source_files = '*.{h,m}'
    
  s.platform = :ios, '6.0'
  s.requires_arc = true

end