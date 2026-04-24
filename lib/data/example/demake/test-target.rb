test_targets = <<-END_OF_STRING
\t@echo
\t@echo "|YTesting command hello:|n"
\tbin/hello
\t@echo "|YTesting command goodbye:|n"
\tbin/goodbye
END_OF_STRING
test_target << test_targets
