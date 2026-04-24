@generic_dependency_targets = <<-END_OF_STRING
# General Auto-Dependencies
$(OBJECT)/%.o : $(SOURCE)/%.c
\t@echo "|=!|O #{@emoji_compile} Compiling... |Y$(@)|n"
ifeq '$(OS)' 'Windows_NT'
\t@test -d $(BINARY) |||| mkdir $(BINARY)
\t@test -d $(OBJECT) |||| mkdir $(OBJECT)
else
\t@mkdir -p $(BINARY)
\t@mkdir -p $(OBJECT)
endif
\t$(CC) $(BUILD_FLAGS) $(LIBS) -c $< -o $@
# General Auto-Dependencies for debug
# $(OBJECT)/%_debug.o : BUILD_FLAGS := $(DEBUG_FLAGS) $(CFLAGS)
#
$(OBJECT)/%_debug.o : $(SOURCE)/%.c
\t@echo "|=!|O #{@emoji_debug} #{@emoji_compile} Compiling... |Y$(@)|n"
ifeq '$(OS)' 'Windows_NT'
\t@test -d $(BINARY) |||| mkdir $(BINARY)
\t@test -d $(OBJECT) |||| mkdir $(OBJECT)
else
\t@mkdir -p $(BINARY)
\t@mkdir -p $(OBJECT)
endif
\t$(CC) $(BUILD_FLAGS) $(LIBS) -c $< -o $@
END_OF_STRING
