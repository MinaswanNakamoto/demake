@executable_debug_target = <<-END_OF_STRING
\t@echo "|=[|#{SHORT_WIDTH}-]|O"
\t@echo "|]#{BOX_WIDTH}|=! #{@emoji_debug} #{@emoji_build} |nBuilding executable:|O #{@binary_directory}/|Y#{app[0]}_debug|=|n|;!|O"
\t@echo "|={|#{SHORT_WIDTH}-}|O"
\t@$(MAKE) $(BINARY)/#{app[0]}_debug#{@pager}
END_OF_STRING
