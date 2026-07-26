# Lex-Yacc-Programs

A collection of Lex (Flex) and Yacc (Bison) programs developed for Compiler Design laboratory exercises. This repository contains programs demonstrating lexical analysis, syntax analysis, token generation and parser implementation using Lex and Yacc.

## Features

- Lexical analysis using Lex (Flex)
- Syntax analysis using Yacc (Bison)
- Token recognition
- Arithmetic expression parsing
- Grammar validation
- Compiler Design lab programs

## Technologies Used

- C
- Lex (Flex)
- Yacc (Bison)
- GCC (MinGW)

## Prerequisites (Windows)

Install the following:

- GCC (MinGW)
- WinFlexBison or Flex & Bison for Windows
- Command Prompt, PowerShell (or Git Bash)

WinFlexBison provides Windows versions of Flex and Bison. :contentReference[oaicite:0]{index=0}

## How to Run

### Compile a Lex program

```cmd
win_flex program.l
gcc lex.yy.c -o output.exe
output.exe
```

### Compile a Lex + Yacc program

```cmd
win_bison -d program.y
win_flex program.l
gcc lex.yy.c program.tab.c -o output.exe
output.exe
```

> Note:
> Depending on your WinFlexBison version, the generated parser files are typically `program.tab.c` and `program.tab.h`. :contentReference[oaicite:1]{index=1}

## Repository Contents

This repository includes multiple Lex and Yacc programs covering:
 
- To Evaluate arithmetic expressions
- To Evaluate boolean expressions
- Validation of for loop statement syntax
- Validation of if-else statement syntax
- Grammar validation
- Compiler Design laboratory exercises

## Learning Outcomes

- Understand lexical analysis
- Learn parser generation using Yacc
- Build simple compiler components
- Implement context-free grammars
- Practice Compiler Design concepts

## License

This repository is intended for educational purposes.
