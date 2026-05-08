# Uncomment to use / override
#                                       # Default Setting | none = ""
#@silent = true                         # false
#@strip = false                         # true
#@debug_enabled = false                 # true
#@compiler = "clang"                    # "gcc"
#@num_threads = 16                      # 8
#@prefix = "/usr/local/bin64/"          # "/usr/local/bin/"
#@library_prefix = "/usr/local/lib64/"  # "/usr/local/lib/"
#
# ** demake never makes changes **
#
#@source_directory = "source"           # "src"
#
# ** make clean deletes all files in these directories **
#
#@binary_directory = "binary"           # "bin"
#@library_directory = "library"         # "lib"
#@object_directory = "object"           # "obj"
#
#@emojis = false                        # true
#@replace_with = "|b*|n"                # "|mo|n"
# Both compiler & linker
@flags = "-ansi -pedantic -D_POSIX_C_SOURCE=200809L"
@optimize_flags = "-O2"
#@compiler_flags = "-fPIE"
#@linker_flags = "-fPIE"
#@linker_libraries = "-lc"
# Platform based
#@linux_flags = "-static"
#@linux_flags = "-static -static-libgcc"
#@x86_64_flags = "-msse2 -mssse3 -msse4.1 -msha"
#@aarch64_flags = "-march=armv8-a+crypto"
#@riscv64_flags = "-march=native"
#@windows_flags = "-target x86_64-w64-windows-gnu"
#@freebsd_flags = ""
#@darwin_flags = "-bundle"
# Both compiler & linker
#@libraries = "-lc"
#@libraries = "-I/usr/include/ruby-3.4"
# Used for building libraries
#@library_compiler_flags = "-fPIC"
#@library_linker_flags = "-fPIC"
#@library_linker_libraries = "-lruby340"
# Debugging
@debug_flags = "-DOREO_DEBUG -g -Wall -Wextra -Wunused-variable -Wundef " +
               "-Wconversion -Wshadow -Wcast-qual -Wwrite-strings"
=begin
@debug_flags << "-Wpedantic -Wdeprecated-declarations -Wdiv-by-zero " +
                "-Wimplicit-function-declaration -Wimplicit-int " +
                "-Wpointer-arith -Wwrite-strings -Wold-style-definition " +
                "-Wmissing-noreturn -Wno-cast-function-type " +
                "-Wno-constant-logical-operand -Wno-long-long " +
                "-Wno-missing-field-initializers -Wno-overlength-strings " +
                "-Wno-packed-bitfield-compat -Wno-parentheses-equality " +
                "-Wno-self-assign -Wno-tautological-compare " +
                "-Wno-unused-parameter -Wno-unused-value " +
                "-Wsuggest-attribute=format -Wsuggest-attribute=noreturn"
=end
# Manually include (relative to Makefile) other raw binaries in linking
#@raw_binary_files = "myfile/hello.o myfile/goodbye.o"
notify("#{@emoji_success} demake/settings.rb is present")
