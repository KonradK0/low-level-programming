#include <iostream>
using namespace std;

class A{
  public:
  virtual int oblicz(int n){
    return n*n;
  }
};

class B : public A {
  public:
  virtual int oblicz(int n){
    return 3*n - 4;
  } 
};

class F {
  public:
  virtual int wylicz(int a, int b){
   return a - b;
  }
};

extern "C" void zmien(void *ptr);

int main() {
  A a, b;
  A *pa = new A, *pb = new B, *pc = new B; 
  cout << pa->oblicz(1)
  << " "
  << pb->oblicz(2) 
  << " " 
  << pc->oblicz(3) << endl;

  zmien(pa);
  zmien(pb);

  cout << pa->oblicz(1)
       << " "
       << pb->oblicz(2) 
       << " " 
       << pc->oblicz(3) << endl;

  F *pf = new F;
  cout << pf->wylicz(7, 2) << endl;
  zmien(pf);
  cout << pf->wylicz(7, 2) << endl;
  return 0;
}
// Spodziewane wyjście:
// 1 2 5
// 0 1 5
// 5
// 4
