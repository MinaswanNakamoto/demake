@library_target = <<-END_OF_STRING
\t@echo "|=[|#{SHORT_WIDTH}-]|O"
\t@echo "|]#{BOX_WIDTH}|=! #{@emoji_build} Building library: #{@library_directory}/|O|g#{lib[0]}|n|=|;!|O"
\t@echo "|={|#{SHORT_WIDTH}-}|O"
\t@$(MAKE) $(LIBRARY)/#{lib[0]}#{@library_extension}
END_OF_STRING
