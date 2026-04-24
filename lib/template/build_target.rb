@build_target = <<-END_OF_STRING
\t@echo "|=[|#{SHORT_WIDTH}-]|O"
\t@echo "|]#{BOX_WIDTH}|=! #{@emoji_build} Building executable: #{@binary_directory}/|O|g#{app[0]}|n|=|;!|O"
\t@echo "|={|#{SHORT_WIDTH}-}|O"
\t@$(MAKE) $(BINARY)/#{app[0]}
END_OF_STRING
