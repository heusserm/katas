
#include <stdio.h>
#include <string.h>
int main()
{
    char strName[100];
    printf("\n\nWhat is your name? ");
    fgets(strName, 100, stdin);
    if (strcmp(strName,"Matt\n")!=0 && strcmp(strName,"Justin\n")!=0) 
      printf("\n\nHello, %s\n\n",strName);
    else
      printf("\n\nHello ITKE Writer!\n\n\n");
    
    return 0;
}



