
#include <stdio.h>
#include <string.h>
int main()
{
    char strName[100];
    printf("\n\nWhat is your name? ");
    fgets(strName, 100, stdin);
    if (strcmp(strName,"Matt")!=0) 
      printf("\n\nHello, World!\n\n");
    else
      printf("\n\nHello Matt!\n\n");
    
    return 0;
}



