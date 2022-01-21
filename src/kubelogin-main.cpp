#include <iostream>
#include <unistd.h>

int main(int argc, char *argv[]) {
    std::string s = "kubelogin";

    // call kubelogin get-token with --browser-command hello
    std::string s2 = "get-token";
    if (argc >= 2 && argv[1] == s2) {
        s += " --browser-command hello";
    }

    for (int i = 1; i < argc; ++i){
        s+= " ";
        s+= argv[i];
    }

    system(s.c_str());
	return 0;

}

