/*Indeep Farma
  1015266
  ifarma@uoguelph.ca
  Assignment 4 RPM*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/*Function prototypes*/
long long int itMultiply(long long int m, long long int n);
long long int recMultiply(long long int m, long long int n);

int main()
{
  /* Declaring Variables*/
  long long int inA = 0;
  long long int inB = 0;
  long long int prodRec = 0;
  long long int prodIt = 0;
  double timeRec;
  clock_t startRec;
  clock_t endRec;
  double timeIt;
  clock_t startIt;
  clock_t endIt;


  /* Retrieve the numbers from the user*/
  printf("Please enter the first digit you'd like to multiply (whole numbers)\n");
  scanf("%llu", &inA);
  printf("Please enter the second digit you'd like to multiply (whole numbers)\n");
  scanf("%llu", &inB);

  /*Error Check*/
  if(inA < 0 || inB < 0)
  {
    printf("Plese enter positive numbers\n");
    return 0;
  }

  /*Calculate the product and time it took*/
  startRec = clock();
  prodRec = recMultiply(inA, inB);
  endRec = clock();

  startIt = clock();
  prodIt = itMultiply(inA, inB);
  endIt = clock();

  /*Calculate time*/
  timeRec = ((double)(endRec - startRec) / CLOCKS_PER_SEC);
  timeIt = ((double)(endIt - startIt) / CLOCKS_PER_SEC);

  /*Give results*/
  printf("*****************************\n");
  printf("Recursive multiplication:\n");
  printf("%llu x %llu = %llu\n", inA, inB, prodRec);
  printf("Time taken to calculate recursive method: %lf ms\n", timeRec);
  printf("\n");
  printf("Iterative multiplication:\n");
  printf("%llu x %llu = %llu\n", inA, inB, prodIt);
  printf("Time taken to calculate iterative method: %lf ms\n", timeIt);

  return 0;
}

/*This is the Recursive Algorithm*/
long long int recMultiply(long long int m, long long int n)
{
  /*Calculate the answer using algorithm given*/
  if(m == 0)
  {
    return 0;
  }
  else if(m == 1)
  {
    return n;
  }
  else if((m > 1) && ((m % 2) == 0))
  {
    return recMultiply((m/2), (n+n));
  }
  else if((m > 1) && ((m % 2) == 1))
  {
    return n + recMultiply((m/2), n+n);
  }

  return 0;
}

/*This is an Iterative Algorithm*/
long long int itMultiply(long long int m, long long int n)
{
  /*Declaring variables*/
  long long int p = 0;

  /*Calculate the product*/
  while(m != 0)
  {
    if((m % 2) == 1)
    {
      p = (n + p);
    }

    n = n + n;
    m = m / 2;
  }

  return p;
}
