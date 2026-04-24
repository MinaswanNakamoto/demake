@strip_build = <<-END_OF_STRING
\t@if command -v $(STRIP) >/dev/null 2>&1 ; then \
\t  echo "Stripping $(BINARY)/#{app[0]}"; \
\t  $(STRIP) $(STRIP_ARGS) $(BINARY)/#{app[0]} |||| echo "Warning: strip failed for $(BINARY)/#{app[0]}"; \
\telse \
\t  echo "strip not found; skipping strip step"; \
\tfi
END_OF_STRING
