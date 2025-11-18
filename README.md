# demake

Develop, Decorate and manage Dependencies for C Makefiles easily with a Ruby script.

Install using the Ruby Gem:
```
> gem install demake
```

It requires a demake directory and application file:
```
> mkdir demake
> echo "hello" > demake/applications
> demake > Makefile
```
For customization, optionally include:
demake/settings.rb, demake/test-target.rb, demake/install-target.rb

The gem uses a command line interface:
```
> demake > Makefile
```

You can also clone from git for a more complete example:

```
> git clone https://github.com/MinaswanNakamoto/demake.git
> cd demake/bin
> chmod +x demake
> cd ../example
> ../bin/demake > Makefile
> make
> make build
```
