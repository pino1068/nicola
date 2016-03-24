.PHONY: build test clean run war

war: test
	mkdir -pv dist
	cp -a classes dist/
	cp -a web/* dist
	jar cvf nicola.war -C dist/ .
	rm -fr dist

test: build
	java -classpath lib/groovy-2.4.5.jar:classes nicola.Main

build:
	mkdir -pv classes
	find . -name "*.groovy" > sources
	groovyc -d classes @sources
	rm -fr sources

clean:
	rm -fr classes
