#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void strupp(char* begin) {
  while ( ( *begin = toupper(*begin) )  ) begin++;
}

/* Method get_month inspired by:
   https://www.cqse.eu/en/blog/mccabe-cyclomatic-complexity/
*/

char* get_month(int month) {
    char *strMonth = malloc(37);
    switch (month) {
                case 1: strMonth = strcpy(strMonth, "January"); break;
                case 2: strMonth = strcpy(strMonth, "February"); break;
                case 3: strMonth = strcpy(strMonth, "March"); break;
                case 4: strMonth = strcpy(strMonth, "April"); break;
                case 5: strMonth = strcpy(strMonth, "May"); break;
                case 6: strMonth = strcpy(strMonth, "June"); break;
                case 7: strMonth = strcpy(strMonth, "July"); break;
                case 8: strMonth = strcpy(strMonth, "August"); break;
                case 9: strMonth = strcpy(strMonth, "September"); break;
                case 10: strMonth = strcpy(strMonth, "October"); break;
                case 11: strMonth = strcpy(strMonth, "November"); break;
                case 12: strMonth = strcpy(strMonth, "December"); break;
                default: strMonth = strcpy(strMonth, "Please enter a month from 1-12");
    }

    return strMonth;
}





int main()
{
    char strMonthNum[100];
    printf("\n\nWhat is the month number? ");
    fgets(strMonthNum, 100, stdin);
    int iMonth = atoi(strMonthNum);

    char * strMonth = get_month(iMonth);

    printf("\n The month is %s\n\n", strMonth);

    return 0;
}

