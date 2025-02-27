.PHONY: default build clean docs git-hook pretty lint test run

default: clean build

build: output

clean:
	rm --force --recursive node_modules output

docs:
	@echo "No documentation included by default."

git-hook:
	echo "make pretty" > .git/hooks/pre-commit

pretty:
	yarn biome check --write --no-errors-on-unmatched
	npm pkg fix

lint:
	yarn biome check .
	yarn tsc --noEmit

test: clean
	yarn tsc
	yarn c8 --reporter=html-spa mocha output/*.test.js

run: build
	node ./output/main.js


node_modules:
	yarn install

output: node_modules
	node build.js
