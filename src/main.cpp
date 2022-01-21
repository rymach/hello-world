#include <iostream>
#include <unistd.h>

int main() {

//	std::cout
//		<< "Hello, world!\n"
//		<< std::endl;

    system("osascript \"/usr/local/opt/foo.applescript\" > /dev/null");

	return 0;

}

