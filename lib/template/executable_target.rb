@executable_target = <<-END_OF_STRING
$(BINARY)/#{app[0]} : BUILD_FLAGS := $(OFLAGS) $(CFLAGS) $(LDFLAGS)

$(BINARY)/#{app[0]} : $(OL#{counter})
\t@echo "|=[|#{SHORT_WIDTH}-]|O"
\t@echo "|]#{BOX_WIDTH}|=! #{@emoji_link} Linking Files...|O #{@binary_directory}/|g#{app[0]}|=|n|;!|O"
\t@echo "|={|#{SHORT_WIDTH}-}|O"
ifeq '$(OS)' 'Windows_NT'
\t@test -d $(BINARY) |||| mkdir $(BINARY)
else
\t@mkdir -p $(BINARY)
endif
\t$(CC) $(BUILD_FLAGS) $(OL#{counter})#{@raw_binary_files} $(LDLIBS) -o $(BINARY)/#{app[0]}
END_OF_STRING
