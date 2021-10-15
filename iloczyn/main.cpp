#include <iostream>

extern "C" int iloczyn (int n, ...);

int main() {
	std::cout << iloczyn(4, 1, 2, 3, 4);
	std::cout << iloczyn(10, 2, 1, 2, 1, 2,  1,  2, 1, 2, 3);
	return 0;
}