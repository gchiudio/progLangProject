// nthFibonacci.cpp 

#include <iostream>
using namespace std;

int fibonacci(int n) {                          //start of fibonacci function. int n is the parameters
    if (n <= 1)                                 //if n is 1 or 0, n is returned. This is the stopping parameter for the recursive code
        return n;                               //n is returned
    return fibonacci(n - 1) + fibonacci(n - 2); // This is the recursive call for the fibonacci sequence
}

int main()
{
    int n;                                      // n is declared and initialized to 0
    cout << "Enter an integer greater than 0: ";// prompt to enter n
    cin >> n;                                   //input for n
    cout << "The fibonacci number for your value of n is: " << fibonacci(n) << ".\n"; //output for nth fibonacci number
    return 0;                                   //end of program
}

