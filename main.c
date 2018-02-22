#include <stdio.h>
#include <string.h>

#define DICTFILE "words.txt"

int isAlphabetical(char *w){
  // Returns true if the word w has characters in alphabetical order
  tolower(w);
  while(*w != '\0'){
    if(*w >= *(w+1) && *(w+1) != '\0')
      return 0;
    w++;
  }
  return 1;
}

int main(){
  FILE *f = fopen(DICTFILE, "r");
  char word[40];
  char longest[40];
  char command[40];
  int len = 0;
  
  while(fscanf(f, "%s ", word) != EOF){
    if (isAlphabetical(word)){
      if(strlen(word) > len){
	//	printf("%s\n", word);
	len = strlen(word);
	strcpy(longest, word);
      }
      if (strlen(word) >= 6){

	sprintf(command, "espeak %s", word);
	printf("%s\n", word);
	system(command);
      }
    }
  }

  printf("Longest: %s", longest);
  fclose(f);
  return 0;
}
