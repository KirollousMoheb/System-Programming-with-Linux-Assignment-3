#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "fact.h"
#include "fib.h"
#include "rand.h"

int main(void){

char line  [200];
while(1){
printf("\nAna Gahez Ya Basha >");
scanf("%s",line);

if(!strcmp(line,"exit")){
printf("\nGood Bye :) \n");
exit(0);
}
else if(!strcmp(line,"fact")){
int num=0;
printf("Enter a number: ");
scanf("%d",&num);
printf("Result is: %d",factorial(num));
}
else if(!strcmp(line,"rand")){
printf("%d",my_random());
}
else if(!strcmp(line,"fib")){
int num=0;
printf("Enter a number: ");
scanf("%d",&num);
fib(num);
}

else{
printf("You said: %s",line);
}

}


return 0;
}
