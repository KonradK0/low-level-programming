#include <stdio.h>

int iloczyn (int a, int* b);         /* prototyp funkcji */

int main()
{
      int tab[5];
	int i = 0;
      for (i; i < 5; i += 1) {
         tab[i] = i;
      }
      tab[0] = 2;
      printf("%d\n", iloczyn(5, tab));
      return 0;
}
