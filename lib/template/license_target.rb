@license_target = <<-END_OF_STRING
.PHONY : license
license:
\t@echo "$$LICENSE_FILE" > LICENSE
\t@echo "$$LICENSE" | less -F -R -X -e

LICENSE:
\t@echo "$$LICENSE_FILE" > LICENSE
\t@echo "$$LICENSE" | less -R -X -e
END_OF_STRING
