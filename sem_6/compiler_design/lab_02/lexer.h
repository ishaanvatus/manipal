/*
 * lexer.h 
 * function signatures
 */
#ifndef LEXER_H
#define LEXER_H
#define TAB 9
#define SPACE 32
void remove_whitespace(char *input_file, char *output_file);
void remove_preprocessor(char *input_file, char *output_file);
void regurge_keywords(char *input_file, char *output_file);
#endif
