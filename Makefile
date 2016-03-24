.PHONY: build test clean run

build:
	mkdir -pv classes
	find . -name "*.groovy" > sources
	groovyc -d classes @sources
	rm -fr sources

clean:
	rm -fr classes
