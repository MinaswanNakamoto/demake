@silent = false
#@compiler = "clang"
#@emojis = false
#@replace_with = "|b*|n"
#@libraries << "-lc"
#@flags << "-ansi -pedantic -D_DEFAULT_SOURCE"
#@linux_flags << "-static"       # clang
#@linux_flags << "-static -static-libgcc"
#@x86_64_flags << "-msse2 -mssse3 -msse4.1 -msha"
#@aarch64_flags << "-march=armv8-a+crypto"
#@darwin_flags << "-bundle"
#@flags = "-g -Wall"
# No default flags (use only flags in the line above)
#$flags_override = true
notify("|g|[check mark] demake/settings.rb is present|n")
