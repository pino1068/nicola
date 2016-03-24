.PHONY: build test run war deploy clean

deploy: war
	cp nicola.war /usr/local/jetty/webapps	

war: test
	mkdir -pv dist
	cp -a web/* dist
	cp -a classes dist/WEB-INF
	cp -a lib dist/WEB-INF
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
