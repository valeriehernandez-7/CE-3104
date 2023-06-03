#include <stdio.h>
#include <math.h>


/**
 *
 * @param num
 * @return
 */
int isPrimeNumber(long num) {
    if (num == 0 || num == 1) {
        return 0;
    }
    for (int n = 2; n <= (num / 2); ++n) {
        if ((num % n) == 0) {
            return 0;
        }
    }
    return 1;
}


/**
 * The Euclid–Euler theorem [num = (2^(n - 1)) * (2^(n) - 1)] states that an even natural
 * number is perfect if and only if it has the form (2^(n - 1)) * Mp, where Mp is a Mersenne prime.
 * @param n integer number
 * @return long long integer perfect number or 0 if the result is not perfect number
 */
long long perfectNumber(int n) {
    if (isPrimeNumber(n)) {
        if (isPrimeNumber(pow(2, n) - 1)) {
            return (pow(2, (n - 1)) * (pow(2, n) - 1));
        }
    }
    return 0;
}


/**
 *
 * @param range
 */
void printPerfectNumbersWhileInRange(long long range) {
    long long perfectNum;
    int n = 0;
    while ((perfectNum = perfectNumber(n)) < range) {
        if (perfectNum != 0) {
            printf("%lld ", perfectNum);
        }
        n++;
    }
    printf("\n");
}


/**
 *
 * @param num
 * @return
 */
long long divisorSum(long long num) {
    long long sum = 0;
    for (long long divisor = 1; divisor < num; divisor++) {
        if (num % divisor == 0) {
            sum += divisor;
        }
    }
    return sum;
}


/**
 *
 * @param num
 * @return
 */
int isPerfectNumber(long long num) {
    return (num != 0) && (num == divisorSum(num));
}


/**
 *
 * @param range
 */
void printPerfectNumbersForInRange(long long range) {
    for (long long num = 1; num < range; num++) {
        if (isPerfectNumber(num)) {
            printf("%lld ", num);
        }
    }
    printf("\n");
}


int main() {
    printPerfectNumbersForInRange(100);
    printPerfectNumbersWhileInRange(100);
    return 0;
}
