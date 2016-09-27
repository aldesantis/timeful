$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'timeful/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'timeful'
  s.version     = Timeful::VERSION
  s.authors     = ['Alessandro Desantis']
  s.email       = ['desa.alessandro@gmail.com']
  s.homepage    = 'https://github.com/alessandro1997/timeful'
  s.summary     = 'A Rails engine for building timelines.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '>= 4.0.0', '< 6.0.0'

  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'fuubar'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'pg'
  s.add_development_dependency 'shoulda-matchers'
end
