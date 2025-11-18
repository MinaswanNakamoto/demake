STDERR.puts(@pipe.pipetext("|G|[check mark] |gdemake/settings.rb is present|n"))
debug = false
quiet = true
compiler = "clang"
flags = "-g -Wall"
# No default flags
$flags_override = true
