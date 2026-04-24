# demake

Develop, Decorate and manage Dependencies for C (GNU) Makefiles easily with a Ruby script.

Install using the Ruby Gem:
```
gem install demake
```

To create an example with multiple sample applications:
```
demake example
```
This will create a directory named example containing the example.

To create an example with a single sample application:
```
demake oreo
```
This will create a directory named oreo containing the example.

It requires a demake directory and application file containing the application
names followed by depencencies separated by spaces and with a new line to indicate
a different application. Something like (from the example):
```
mkdir demake
echo "hello string" > demake/applications
echo "goodbye string" >> demake/applications
demake
```
For customization, optionally include (see example):
demake/settings.rb, demake/test-target.rb, demake/install-target.rb,
demake/license


The output of the command by itself is a (GNU style) file named Makefile:
```
demake
```

You can also clone from git for a more complete example:

```
git clone https://github.com/MinaswanNakamoto/demake.git
chmod +x demake/bin/demake
cd demake
bin/demake example
cd example ; make ; make build ; make test
```
If you have an existing C application and you want to generate a Makefile for it,
you might try the gen_application shell script.

```
./gen_application myapp
```

