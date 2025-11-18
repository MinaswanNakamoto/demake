Gem::Specification.new do |s|
  s.name        = "demake"
  s.version     = "0.0.2"
  s.summary     = "Develop, Decorate and manage Dependencies for C Makefiles easily with a Ruby script."
  s.description = "== Develop, Decorate and manage Dependencies for C Makefiles easily with a Ruby script.

  Install using the Ruby Gem:

  > gem install demake

  It requires a demake directory and application file containing the application
  names followed by depencencies separated by spaces and with a new line to indicate
  a different application. Something like:

  > mkdir demake
  > echo \"hello string\" > demake/applications
  > echo \"goodbye string\" >> demake/applications
  > demake > Makefile

  For customization, optionally include (see example):
  demake/settings.rb, demake/test-target.rb, demake/install-target.rb

  The gem uses a command line interface:

  > demake > Makefile

  You can also clone from git for a more complete example:

  > git clone https://github.com/MinaswanNakamoto/demake.git
  > cd demake/bin
  > chmod +x demake
  > cd ../example
  > ../bin/demake > Makefile
  > make
  > make build
  > bin/hello
  > bin/goodbye

  If you have an existing C application and you want to generate a Makefile for it,
  you might try the gen_application shell script.

  > ./gen_application myapp
"
  s.authors     = ["Minaswan Nakamoto"]
  s.email       = "minaswan.nakamoto@onionmail.org"
  s.files       = ["bin/demake"]
  s.executables = ["demake"]
  s.add_runtime_dependency "pipetext", "~> 0.1", ">= 0.1.3"
  s.homepage    = "https://github.com/MinaswanNakamoto/demake"
  s.license     = "MIT"
end
