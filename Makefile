.PHONY: build test clean run war

build:
	mkdir -pv classes
	find . -name "*.groovy" > sources
	groovyc -d classes @sources
	rm -fr sources

	mkdir -pv dist
	cp -a classes dist/
	cp -a web/* dist
	jar cvf nicola.war -C dist/ .
	rm -fr dist

clean:
	rm -fr classes
