#include <iostream>

extern "C" double wartosc (double a, double b, double x, int n);

int main() {
	std::cout << wartosc(4, 3, 2, 2);
}