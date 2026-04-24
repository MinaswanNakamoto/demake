test_targets = <<-END_OF_STRING
\t@echo
\t@echo "|YBasic functional testing of command oreo:|n"
\tbin/oreo Test 1
\techo -n "Test 2" | bin/oreo
\techo -n "Test 3" | bin/oreo Test 4
\tbin/oreo oreo_test.txt
END_OF_STRING
test_target << test_targets
