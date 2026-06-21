# defaults to only removing the object directory
if(@clean_includes_binary_directory == true && @clean_includes_library_directory == true)
  @clean_target = <<-END_OF_STRING
.PHONY : clean
clean :
\t@echo "#{@emoji_clean} Removed |Yeverything|n from |R$(OBJECT)|n, |R$(BINARY)|n, and |R$(LIBRARY)|n directories"
\t@rm -rf $(OBJECT) $(BINARY) $(LIBRARY)
END_OF_STRING
elsif(@clean_includes_binary_directory == true)
  @clean_target = <<-END_OF_STRING
.PHONY : clean
clean :
\t@echo "#{@emoji_clean} Removed |Yeverything|n from |R$(OBJECT)|n and |R$(BINARY)|n directories"
\t@rm -rf $(OBJECT) $(BINARY) $(LIBRARY)
END_OF_STRING
elsif(@clean_includes_library_directory == true)
  @clean_target = <<-END_OF_STRING
.PHONY : clean
clean :
\t@echo "#{@emoji_clean} Removed |Yeverything|n from |R$(OBJECT)|n and |R$(LIBRARY)|n directories"
\t@rm -rf $(OBJECT) $(BINARY) $(LIBRARY)
END_OF_STRING
else
  @clean_target = <<-END_OF_STRING
.PHONY : clean
clean :
\t@echo "#{@emoji_clean} Removed |Yeverything|n from |R$(OBJECT)|n directory"
\t@rm -rf $(OBJECT)
END_OF_STRING
end
