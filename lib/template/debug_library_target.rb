@debug_library_target = <<-END_OF_STRING
$(LIBRARY)/#{lib[0]}_debug#{@library_extension} : BUILD_FLAGS := $(DEBUG_FLAGS) $(LIB_CFLAGS) $(LIB_LDFLAGS)

$(LIBRARY)/#{lib[0]}_debug#{@library_extension} : $(DOL#{counter})
\t@echo "|=[|#{SHORT_WIDTH}-]|O"
\t@echo "|]#{BOX_WIDTH}|=! #{@emoji_debug} #{@emoji_link} Linking Files...|O #{@library_directory}/|Y#{lib[0]}_debug#{@library_extension}|=|n|;!|O"
\t@echo "|={|#{SHORT_WIDTH}-}|O"
ifeq '$(OS)' 'Windows_NT'
\t@test -d $(LIBRARY) |||| mkdir $(LIBRARY)
else
\t@mkdir -p $(LIBRARY)
endif
\t$(CC) $(BUILD_FLAGS) $(DOL#{counter}) #{@raw_binary_files} $(LIB_LDLIBS) -o $(LIBRARY)/#{lib[0]}_debug#{@library_extension}
END_OF_STRING
