@dependency_targets = <<-END_OF_STRING
# Dependencies
$(OBJECT)#{path}#{filename.sub(/\.cp?p?$/, '.o')} : $(SOURCE)#{path}#{filename}#{dependencies}
\t@echo "|=!|O #{@emoji_compile} Compiling... |Y$(OBJECT)#{path}#{filename.sub(/\.cp?p?$/, '.o')}|n"
ifeq '$(OS)' 'Windows_NT'
\t@test -d $(OBJECT)#{path} |||| mkdir $(OBJECT)#{path}
else
\t@mkdir -p $(OBJECT)#{path}
endif
\t$(CC) $(BUILD_FLAGS) $(LIBS) -c $(SOURCE)#{path}#{filename} -o $(OBJECT)#{path}#{filename.gsub(/\.cp?p?$/, '.o')}
# Dependencies for debug
# $(OBJECT)#{path}#{filename.sub(/\.cp?p?$/, '_debug.o')} : BUILD_FLAGS := $(DEBUG_FLAGS) $(CFLAGS)
#
$(OBJECT)#{path}#{filename.sub(/\.cp?p?$/, '_debug.o')} : $(SOURCE)#{path}#{filename}#{dependencies}
\t@echo "|=!|O #{@emoji_debug} #{@emoji_compile} Compiling... |Y$(OBJECT)#{path}#{filename.sub(/\.cp?p?$/, '_debug.o')}|n"
ifeq '$(OS)' 'Windows_NT'
\t@test -d $(OBJECT)#{path} |||| mkdir $(OBJECT)#{path}
else
\t@mkdir -p $(OBJECT)#{path}
endif
\t$(CC) $(BUILD_FLAGS) $(LIBS) -c $(SOURCE)#{path}#{filename} -o $(OBJECT)#{path}#{filename.gsub(/\.cp?p?$/, '_debug.o')}
END_OF_STRING
