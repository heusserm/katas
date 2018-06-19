#include <ctype.h>
#include <stdio.h>
#include <string.h>


void strupp(char* begin) {
  while ( ( *begin = toupper(*begin) )  ) begin++;
}


int main()
{
    char strName[100];
    printf("\n\nWhat is your name? ");
    fgets(strName, 100, stdin);

    if (strcmp(strName,"Matt\n")!=0) 
        printf("\n\nHello, World!\n\n");
    else
        printf("\n\nHello Matt!\n\n");

    printf("\n\nWhat is your quest? ");
    char strQuest[100];
  
    fgets(strQuest, 100, stdin);
    strupp(strQuest);
   

    if (strcmp(strQuest,"TO SEEK THE HOLY GRAIL\n")==0) {
       printf("Right. Off you go.\n\n");  
    } else {
       printf("Heh heh. Stop!\n\n");
    }
    
    return 0;
}

