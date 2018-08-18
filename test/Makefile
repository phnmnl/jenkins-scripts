all: make-versions test-built-container test-workflow

make-versions:
	./test-make-versions-file -g

test-built-container:
	./test-test-built-container -g

test-workflow:
	./test-test-workflow -g

clean:

.PHONY: all clean make-versions test-built-container test-workflow
