@debug_executable_target = <<-END_OF_STRING
$(BINARY)/#{app[0]}_debug : BUILD_FLAGS := $(DEBUG_FLAGS) $(CFLAGS) $(LDFLAGS)

$(BINARY)/#{app[0]}_debug : #{LICENSE} $(DOL#{counter})
\t@echo "|=[|#{SHORT_WIDTH}-]|O"
\t@echo "|]#{BOX_WIDTH}|=! #{@emoji_debug} #{@emoji_link} Linking Files...|O #{@binary_directory}/|Y#{app[0]}_debug|=|n|;!|O"
\t@echo "|={|#{SHORT_WIDTH}-}|O"
ifeq '$(OS)' 'Windows_NT'
\t@test -d $(BINARY) |||| mkdir $(BINARY)
else
\t@mkdir -p $(BINARY)
endif
\t$(CC) $(BUILD_FLAGS) $(LIBS) -o $(BINARY)/#{app[0]}_debug $(DOL#{counter}) #{@raw_binary_files}
END_OF_STRING
