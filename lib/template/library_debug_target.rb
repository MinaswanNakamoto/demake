@library_debug_target = <<-END_OF_STRING
\t@echo "|=[|#{SHORT_WIDTH}-]|O"
\t@echo "|]#{BOX_WIDTH}|=! #{@emoji_debug} #{@emoji_build} Building library:|O #{@library_directory}/|Y#{lib[0]}_debug#{@library_extension}|=|n|;!|O"
\t@echo "|={|#{SHORT_WIDTH}-}|O"
\t@$(MAKE) $(LIBRARY)/#{lib[0]}_debug#{@library_extension}#{@pager}
END_OF_STRING
