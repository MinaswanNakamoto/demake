# demake

Develop, Decorate and manage Dependencies for C (GNU) Makefiles easily.

# 🚀 Features
- **Easy**: Added a bunch of C header files? Just type demake.
- **Highly Available**: GNU Make is everywhere, build with demake, deploy with only a Makefile.
- **Simple**: Update simple variables and run demake to adjust compiler, linker flags, & debug flags.
            Minimize problems with tabs, spaces and arcane syntax while utilizing old school tools.

## 🛠  Create Tech Stack
- **Ruby**: Core Ruby
- **Pipetext**: Ruby Pipetext gem
- **GNU Make**: Should work with most versions
- **Compiler**: Typically gcc or clang

## 🛠  DEPLOY Tech Stack
- **GNU Make**: Should work with most versions
- **Compiler**: Typically gcc or clang

## 🏁 Getting Started

### Prerequisites
Install Ruby and Ruby Gems, typically either:
```bash
$ dnf install ruby rubygems make gcc
```
**OR**
```bash
$ apt install ruby rubygems make gcc
```

### Installation

Install using the Ruby Gem (best):
```bash
gem install demake
```

**OR**

1. **Clone the repos:**
   ```bash
   git clone https://github.com/MinaswanNakamoto/demake.git
   ```
2. **Install dependencies:**
   ```bash
   gem install pipetext
   ```
3. **Change directories, make executable, and execute:**
   ```bash
   cd demake/bin
   chmod +x demake
   ./demake help
   ```
4. **Add demake to your path for this session:**
   ```bash
   PATH=`realpath demake|sed 's/demake$//'`:$PATH
   ```

   **Optionally add to .bashrc so it is always available:**
   ```bash
   echo "export PATH=$PATH" >> ~/.bashrc
   ```
5. **Use demake:**
   ```bash
   demake new hello
   cd hello ; make ; make build ; make test
   ```

## 📖 Usage

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

To create or update a GNU Makefile, execute without arguments:
```bash
demake
```

For up to date syntax and usage use:
```bash
demake help
```

To create an example with multiple sample applications:
```bash
demake example
```
This will create a directory named example containing the example.

To create a new application:
```bash
demake new <name>
```
This will create a new directory and basic files for a new application.

To create an example with a single sample application:
```bash
demake oreo
```
This will create a directory named oreo containing the example.

If you have an existing C application and you want to generate a Makefile for it,
you might try the gen_application shell script.

```
./gen_application myapp
```

## 🗺 Roadmap
- [x] Initial Release
- [x] Make Build
- [x] Make Debug
- [x] Make Test
- [x] Menu
- [x] Emojis
- [x] Make Install/Uninstall
- [x] Examples
- [x] Build Library
- [x] Licensing
- [x] Help
- [X] Demake New
- [ ] Make Check
- [ ] Make Documentation
- [ ] Make Readme
- [ ] Additional C Applications & Templates

## 📄 License
This project is licensed under the [MIT License](LICENSE).

## ✉ Contact
Minaswan Nakamoto – minaswan.nakamoto@proton.me

## 📄 Sample Output
```bash
minaswan@F42-Nakamoto1:~$ ls
minaswan@F42-Nakamoto1:~$ demake
WARNING: No such file or directory - demake/settings.rb
WARNING: No such file or directory - demake/applications

❌ Error: applications file cannot be empty

You must create a file named applications which contains a list of
executable application names and any dependencies to be compiled.

minaswan@F42-Nakamoto1:~$ demake new hello
✔  Created directory: hello 📂
✔  Created directory: hello/demake 📂
✔  Created file: hello/demake/applications 📄
✔  Created file: hello/demake/settings.rb 📄
✔  Created file: hello/demake/license 📄
✔  Created file: hello/demake/test-target.rb 📄
✔  Created directory: hello/src 📂
✔  Created file: hello/src/hello.c 📄
✔  demake/settings.rb is present
✔  Created file: hello/Makefile 📄

Suggestion: cd hello ; make ; make build ; make test
minaswan@F42-Nakamoto1:~$ cd hello ; make ; make build ; make test

┌────────────────────────────────────────────────────────────────────────────────┐
│ MIT License                                                                    │
│                                                                                │
│ Permission is hereby granted, free of charge, to any person obtaining a copy   │
│ of this software and associated documentation files (the "Software"), to deal  │
│ in the Software without restriction, including without limitation the rights   │
│ to use, copy, modify, merge, publish, distribute, sublicense, and/or sell      │
│ copies of the Software, and to permit persons to whom the Software is          │
│ furnished to do so, subject to the following conditions:                       │
│                                                                                │
│ The above copyright notice and this permission notice shall be included in all │
│ copies or substantial portions of the Software.                                │
│                                                                                │
│ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     │
│ IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       │
│ FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE    │
│ AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER         │
│ LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  │
│ OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  │
│ SOFTWARE.                                                                      │
└────────────────────────────────────────────────────────────────────────────────┘

╔═════════════════════════════════════════════════════════════════════════╗
║                                                                         ║
║                           Make targets:                                 ║
║                                                                         ║
║                             🚧  build                                   ║
║                             📜  license                                 ║
║                             🔥  clean                                   ║
║                             🐛  debug                                   ║
║                             🔩  install                                 ║
║                             🔧  uninstall                               ║
║                             ❓  test                                    ║
║                                                                         ║
╠═════════════════════════════════════════════════════════════════════════╣
║           Build Executable: bin/hello                                   ║
╠═════════════════════════════════════════════════════════════════════════╣
║           Debug Executable: bin/hello_debug                             ║
╠═════════════════════════════════════════════════════════════════════════╣
║   Install Binary Directory: /usr/local/bin/                             ║
║  Install Library Directory: /usr/local/lib/                             ║
╚═════════════════════════════════════════════════════════════════════════╝
╔═════════════════════════════════════════════════════════════════════════╗
║ 🚧  Building executable: bin/hello                                      ║
╚═════════════════════════════════════════════════════════════════════════╝
make[1]: Entering directory '/home/minaswan/hello'
║ 🛠  Compiling... obj/hello.o
gcc -O2 -ansi -pedantic   -c src/hello.c -o obj/hello.o
╔═════════════════════════════════════════════════════════════════════════╗
║ 🔗  Linking Files... bin/hello                                          ║
╚═════════════════════════════════════════════════════════════════════════╝
gcc -O2 -ansi -pedantic   obj/hello.o   -o bin/hello
make[1]: Leaving directory '/home/minaswan/hello'
Stripping bin/hello
╔═════════════════════════════════════════════════════════════════════════╗
║ 🚧  Building executable: bin/hello                                      ║
╚═════════════════════════════════════════════════════════════════════════╝
make[1]: Entering directory '/home/minaswan/hello'
make[1]: 'bin/hello' is up to date.
make[1]: Leaving directory '/home/minaswan/hello'
Stripping bin/hello
❓ Running tests:
Testing command:
bin/hello
Hello, world!
minaswan@F42-Nakamoto1:~$ cd ..
minaswan@F42-Nakamoto1:~$ demake oreo
✔  Created directory: oreo 📂
✔  Created file: oreo/Makefile 📄
✔  Created directory: oreo/demake 📂
✔  Created file: oreo/demake/applications 📄
✔  Created file: oreo/demake/brief_description 📄
✔  Created file: oreo/demake/license 📄
✔  Created file: oreo/demake/settings.rb 📄
✔  Created file: oreo/demake/suggestion 📄
✔  Created file: oreo/demake/test-target.rb 📄
✔  Created file: oreo/oreo_test.txt 📄
✔  Created directory: oreo/src 📂
✔  Created file: oreo/src/oreo.c 📄
✔  Created file: oreo/src/defines.h 📄
✔  Created file: oreo/src/fast_read_file.h 📄
✔  Created file: oreo/src/typedefs.h 📄
✔  demake/settings.rb is present
✔  Created file: oreo/Makefile 📄

Suggestion: cd oreo ; make ; make build ; make test
minaswan@F42-Nakamoto1:~$ cd oreo ; make ; make build ; make test

┌────────────────────────────────────────────────────────────────────────────────┐
│ MIT License                                                                    │
│                                                                                │
│ Permission is hereby granted, free of charge, to any person obtaining a copy   │
│ of this software and associated documentation files (the "Software"), to deal  │
│ in the Software without restriction, including without limitation the rights   │
│ to use, copy, modify, merge, publish, distribute, sublicense, and/or sell      │
│ copies of the Software, and to permit persons to whom the Software is          │
│ furnished to do so, subject to the following conditions:                       │
│                                                                                │
│ The above copyright notice and this permission notice shall be included in all │
│ copies or substantial portions of the Software.                                │
│                                                                                │
│ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     │
│ IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       │
│ FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE    │
│ AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER         │
│ LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  │
│ OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  │
│ SOFTWARE.                                                                      │
└────────────────────────────────────────────────────────────────────────────────┘

╔═════════════════════════════════════════════════════════════════════════╗
║                                                                         ║
║                           Make targets:                                 ║
║                                                                         ║
║                             🚧  build                                   ║
║                             📜  license                                 ║
║                             🔥  clean                                   ║
║                             🐛  debug                                   ║
║                             🔩  install                                 ║
║                             🔧  uninstall                               ║
║                             ❓  test                                    ║
║                                                                         ║
╠═════════════════════════════════════════════════════════════════════════╣
║           Build Executable: bin/oreo                                    ║
╠═════════════════════════════════════════════════════════════════════════╣
║           Debug Executable: bin/oreo_debug                              ║
╠═════════════════════════════════════════════════════════════════════════╣
║   Install Binary Directory: /usr/local/bin/                             ║
║  Install Library Directory: /usr/local/lib/                             ║
╚═════════════════════════════════════════════════════════════════════════╝
╔═════════════════════════════════════════════════════════════════════════╗
║ 🚧  Building executable: bin/oreo                                       ║
╚═════════════════════════════════════════════════════════════════════════╝
make[1]: Entering directory '/home/minaswan/oreo'
║ 🛠  Compiling... obj/oreo.o
gcc -O2 -ansi -pedantic -D_POSIX_C_SOURCE=200809L   -c src/oreo.c -o obj/oreo.o
╔═════════════════════════════════════════════════════════════════════════╗
║ 🔗  Linking Files... bin/oreo                                           ║
╚═════════════════════════════════════════════════════════════════════════╝
gcc -O2 -ansi -pedantic -D_POSIX_C_SOURCE=200809L   obj/oreo.o   -o bin/oreo
make[1]: Leaving directory '/home/minaswan/oreo'
Stripping bin/oreo
╔═════════════════════════════════════════════════════════════════════════╗
║ 🚧  Building executable: bin/oreo                                       ║
╚═════════════════════════════════════════════════════════════════════════╝
make[1]: Entering directory '/home/minaswan/oreo'
make[1]: 'bin/oreo' is up to date.
make[1]: Leaving directory '/home/minaswan/oreo'
Stripping bin/oreo
❓ Running tests:
Basic functional testing of command oreo:
bin/oreo Test 1
oreo: Test 1
echo -n "Test 2" | bin/oreo
oreo: Test 2
echo -n "Test 3" | bin/oreo Test 4
oreo: Test 3
oreo: Test 4
bin/oreo oreo_test.txt
oreo: Test 5
minaswan@F42-Nakamoto1:~/oreo$ demake
✔  demake/settings.rb is present
minaswan@F42-Nakamoto1:~/oreo$ make build
╔═════════════════════════════════════════════════════════════════════════╗
║ 🚧  Building executable: bin/oreo                                       ║
╚═════════════════════════════════════════════════════════════════════════╝
make[1]: Entering directory '/home/minaswan/oreo'
make[1]: 'bin/oreo' is up to date.
make[1]: Leaving directory '/home/minaswan/oreo'
Stripping bin/oreo
minaswan@F42-Nakamoto1:~/oreo$ 
```
