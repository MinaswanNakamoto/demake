@clean_target = <<-END_OF_STRING
.PHONY : clean
clean :
\t@echo "#{@emoji_clean} Removed |Yeverything|n from |R$(OBJECT)|n, |R$(BINARY)|n, and |R$(LIBRARY)|n directories"
\t@rm -rf $(OBJECT) $(BINARY) $(LIBRARY)
END_OF_STRING
