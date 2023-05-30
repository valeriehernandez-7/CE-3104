#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * Valerie M. Hernández Fernández
 * valeriehernandez@estudiantec.cr
 * https://github.com/valeriehernandez-7
 *
 * Programación Imperativa
 * Taller (Quiz)
 *
 * Instituto Tecnológico de Costa Rica
 * Campus Tecnológico Central Cartago
 * Área Académica Ingeniería en Computadores
 *
 * CE 3104 Lenguajes, Compiladores e Intérpretes
 * Ing. Marco Rivera Meneses, MGP
 * Grupo 01
 *
 * I Semestre
 * 2023
 */

void kilometersToMiles() {
    for (unsigned short km = 1; km < 11; ++km) {
        printf("\t%u km %c %.2f mi\n", km, 247, (km * 0.621371));
    }
}

void celsiusToFahrenheit(float C) {
    printf("\t%.2f %cC %c %.2f %cF\n", C, 248, 247, ((C * 1.8) + 32), 248);
}

void fahrenheitToCelsius(float F) {
    printf("\t%.2f %cF %c %.2f %cC\n", F, 248, 247, ((F - 32) * 1.8), 248);
}

void temperature(int mode) {
    float temperature = 0;
    printf("\tEnter the temperature (float): ");
    scanf("%f", &temperature);
    switch (mode) {
        case 1:
            celsiusToFahrenheit(temperature);
            break;
        case 2:
            fahrenheitToCelsius(temperature);
            break;
        default:
            printf("ERROR: %d temperature mode unavailable.\n", mode);
    }
}

unsigned int countDigits(int number) {
    if ((number / 10) == 0) {
        return 1;
    } else {
        return (1 + countDigits(number / 10));
    }
}

unsigned int countEvenDigits(int number) {
    if (((number / 10) == 0)) {
        if ((number % 2) == 0) {
            return 1;
        } else {
            return 0;
        }
    } else {
        if ((number % 2) == 0) {
            return (1 + countEvenDigits(number / 10));
        } else {
            return (countEvenDigits(number / 10));
        }
    }
}

unsigned int countOddDigits(int number) {
    if (((number / 10) == 0)) {
        if ((number % 2) == 1) {
            return 1;
        } else {
            return 0;
        }
    } else {
        if ((number % 2) == 1) {
            return (1 + countOddDigits(number / 10));
        } else {
            return (countOddDigits(number / 10));
        }
    }
}

void digits(int mode) {
    int number = 0;
    printf("\tEnter the number (integer): ");
    scanf("%d", &number);
    switch (mode) {
        case 1:
            printf("\t%d has %u digits\n", number, countDigits(number));
            break;
        case 2:
            printf("\t%d has %u even digits\n", number, countEvenDigits(number));
            break;
        case 3:
            printf("\t%d has %u odd digits\n", number, countOddDigits(number));
            break;
        default:
            printf("ERROR: %d digits mode unavailable.\n", mode);
    }
}

int stringLengthComparison(char *s, char *p) {
    while (*s != '\0' && *p != '\0') {
        s++, p++;
    }
    if (*s == '\0' && *p == '\0') {
        return 0;
    } else if (*s == '\0' && *p != '\0') {
        return -1;
    } else if (*s != '\0' && *p == '\0') {
        return 1;
    }
}

void stringConcatenation(char *dest, char *src) {
    char *destAddress = dest;

    while (*dest != '\0') {
        dest++;
    }
    while (*src != '\0') {
        *dest = *src;
        dest++, src++;
    }
    *dest = '\0';

    printf("\t");
    while (*destAddress != '\0') {
        printf("%c", *destAddress);
        destAddress++;
    }
    printf("\n");
}

const char *wordsIgnore[] = {
    "el","la","lo","los","las","un","una","unos","unas",
    "y", "a","e", "o", "u","ni","que",
    "pero", "aunque", "mas", "sino"
};
const int wordsIgnoreLength = (sizeof(wordsIgnore)/sizeof(*wordsIgnore));

struct word {
    char *text;
    int line;
    int count;
    struct word *nextWord;
};

int isWord(char *text) {
    for (int w = 0; w < wordsIgnoreLength; ++w) {
        if (text == wordsIgnore[w]) {
            return 0;
        }
    }
    return 1;
}

void wordCount(char *filename) {
    char filepath[100] = "../src/";
    FILE *file = fopen(strcat(filepath, filename), "r");
    if(file == NULL) exit(1);
    int lineMaxLength = 255;
    char line[lineMaxLength];
    while (fgets(line, lineMaxLength, file)) {
        printf(line , "\n");
        char *word = strtok(line, " ");
        while( word != NULL ) {
            printf( "%s\n", word);
            word = strtok(NULL, " ");
        }
    }
    fclose(file);
}

int main() {
//    printf("\nkm to mi\n"); // Exercise 2.1
//    kilometersToMiles();
//
//    printf("\n%cC to %cF\n", 248, 248); // Exercise 2.2
//    temperature(1);
//
//    printf("\n%cF to %cC\n", 248, 248);
//    temperature(2);
//
//    printf("\nNumber's length\n"); // Exercise 2.3
//    digits(1);
//
//    printf("\nNumber's even digits\n"); // Exercise 2.4
//    digits(2);
//
//    printf("\nNumber's odd digits\n");
//    digits(3);

    printf("\nString's length comparison using pointers\n"); // Exercise 2.5
    printf("\t%d\n", stringLengthComparison("ab", "abc")); // s < p
    printf("\t%d\n", stringLengthComparison("abc", "abc")); // s == p
    printf("\t%d\n", stringLengthComparison("abc", "ab")); // s > p

    printf("\nString's concatenation using pointers\n"); // Exercise 2.6
    char dest[100] = "CE";
    stringConcatenation(dest, "3104");

    printf("\nWord Counter\n"); // Exercise 2.7
    wordCount("allanturing.txt");
    return 0;
}
