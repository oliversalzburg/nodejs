.PHONY: default build clean docs pretty lint test run

default: clean build

build: output

clean:
	rm -rf ./output

docs:
	@echo "No documentation included by default."

pretty:
	yarn biome check --write --no-errors-on-unmatched

lint:
	yarn biome check .
	yarn tsc --noEmit

test: clean
	yarn tsc
	yarn c8 --reporter=html-spa mocha output/*.test.js

run: clean build
	node ./output/main.js


node_modules:
	yarn install

output: node_modules
	node build.js
