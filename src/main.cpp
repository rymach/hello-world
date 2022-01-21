#include <iostream>
#include <unistd.h>

char version[] = "9.0.0";

int main() {

	std::string username = getlogin();

	std::cout
		<< "Hello, world!\n"
		<< "Version " << version
		<< std::endl;

	return 0;

}

