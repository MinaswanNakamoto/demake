# Uncomment to use / override
#
#@silent = false
#@compiler = "clang"
#@prefix = "/usr/local/bin/"
#@library_prefix = "/usr/lib64/"
#@emojis = false
#@replace_with = "|b*|n"
#@libraries << "-lc"
#@flags << "-ansi -pedantic -D_DEFAULT_SOURCE"
#@linux_flags << "-static"       # clang
#@linux_flags << "-static -static-libgcc"
#@x86_64_flags << "-msse2 -mssse3 -msse4.1 -msha"
#@aarch64_flags << "-march=armv8-a+crypto"
#@windows_flags << ""
#@freebsd_flags << ""
#@darwin_flags << "-bundle"
#@flags = "-g -Wall"
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
# No default flags (use only flags in the line above)
#$flags_override = true
notify("|g|[check mark] demake/settings.rb is present|n")
