#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

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

/**
 *
 */
void kilometersToMiles() {
    for (unsigned short km = 1; km < 11; ++km) {
        printf("\t%u km %c %.2f mi\n", km, 247, (km * 0.621371));
    }
}

/**
 *
 * @param C
 */
void celsiusToFahrenheit(float C) {
    printf("\t%.2f %cC %c %.2f %cF\n", C, 248, 247, ((C * 1.8) + 32), 248);
}

/**
 *
 * @param F
 */
void fahrenheitToCelsius(float F) {
    printf("\t%.2f %cF %c %.2f %cC\n", F, 248, 247, ((F - 32) * 1.8), 248);
}

/**
 *
 * @param mode
 */
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

/**
 *
 * @param number
 * @return
 */
unsigned int countDigits(int number) {
    if ((number / 10) == 0) {
        return 1;
    } else {
        return (1 + countDigits(number / 10));
    }
}

/**
 *
 * @param number
 * @return
 */
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

/**
 *
 * @param number
 * @return
 */
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

/**
 *
 * @param mode
 */
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

/**
 *
 * @param s
 * @param p
 * @return
 */
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

/**
 *
 * @param dest
 * @param src
 */
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

/**
 *
 */
struct word {
    char text[50];
    int lineIndex;
    int line[100];
    int frequency;
};


struct word words[400];

/**
 *
 */
const char *wordsIgnore[] = {
    "\0", "el", "la", "lo", "los", "las", "un", "una", "unos", "unas",
    "y", "a", "e", "o", "u", "ni", "por", "que", "ademas",
    "pero", "aunque", "mas", "sino", "de", "en", "se", "era",
    "su", "del", "es", "le", "al", "esta"
};

/**
 *
 * @param expression
 * @param words
 * @return
 */
int isWordsElement(char *expression) {
    int w = 0;
    while (words[w].frequency) {
        if (strcmp(expression, words[w].text) == 0) {
            return w;
        }
        w++;
    }
    return -1;
}

/**
 *
 * @param text
 * @return
 */
int isWord(const char *text) {
    int w = 0;
    while (wordsIgnore[w]) {
        if (strcmp(text, wordsIgnore[w]) == 0) {
            return 0;
        }
        w++;
    }
    return 1;
}

/**
 *
 * @param file
 * @return
 */
int fileWordCounter(FILE *file) {
    int count = 0;
    char ch;
    while ((ch = getc(file)) != EOF) {
        if (isspace(ch)) {
            count++;
        }
    }
    return count;
}

/**
 *
 * @param filename
 */
void fileWordParser(char *filename) {
    char filepath[100] = "../src/";
    FILE *file;
    if ((file = fopen(strcat(filepath, filename), "r")) == NULL) exit(1);
    char ch;
    char expression[50] = {'\0'};
    int line = 1;
    int w = -1;
    while ((ch = getc(file)) != EOF) {
        if (ch == '\n') {
            line++;
        }
        if (isalnum(ch)) {
            ch = tolower(ch);
            strncat(expression, &ch, 1);
        } else {
            if (isWord(expression) == 1) {
                int wordIndex = isWordsElement(expression);
                if (wordIndex == -1) {
                    w++;
                    struct word newWord;
                    strcpy(newWord.text, expression);
                    newWord.lineIndex = 0;
                    memset(newWord.line, '\0', sizeof(newWord.line));
                    newWord.line[0] = line;
                    newWord.frequency = 1;
                    words[w] = newWord;
                } else {
                    words[wordIndex].lineIndex++;
                    words[wordIndex].line[words[wordIndex].lineIndex] = line;
                    words[wordIndex].frequency++;
                }
            }
            memset(expression, '\0', sizeof(expression));
        }
    }
    fclose(file);
}

/**
 *
 * @param filename
 */
void fileWordFinder(char *filename) {
    fileWordParser(filename);
    int w = 0;
    while (words[w].frequency) {
        int l = 0;
        printf("%s : ", words[w].text);
        while (words[w].line[l]) {
            printf("%d ", words[w].line[l]);
            l++;
        }
        printf(" -- %d\n", words[w].frequency);
        //printf("\n");
        w++;
    }
    memset(words, '\0', sizeof(words));
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
//
//    printf("\nString's length comparison using pointers\n"); // Exercise 2.5
//    printf("\t%d\n", stringLengthComparison("ab", "abc")); // s < p
//    printf("\t%d\n", stringLengthComparison("abc", "abc")); // s == p
//    printf("\t%d\n", stringLengthComparison("abc", "ab")); // s > p

    printf("\nString's concatenation using pointers\n"); // Exercise 2.6
    char dest[100] = "CE";
    stringConcatenation(dest, "3104");

    printf("\nWord Finder\n\n"); // Exercise 2.7
    fileWordFinder("allanturing.txt");

    printf("\nWord Frequency\n\n"); // Exercise 2.8
//    fileWordParser("allanturing.txt");

    return 0;
}
