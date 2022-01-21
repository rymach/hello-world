all: compile

compile:
	mkdir -p ./build
	g++ src/main.cpp -o build/hello

install: compile
	cp build/hello /usr/local/bin

run:
	@./build/hello

clean:
	rm -rf ./build
	rm -rf /usr/local/bin/hello

bump:
	@bash ./tools/bump.sh $<
