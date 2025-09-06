# myHTML Language Compiler

This project implements a custom markup language called **myHTML**, inspired by HTML, along with a parser and syntax checker using Flex (lex) and Bison (yacc) in C.

## Features
- **Custom Tags**: Supports a subset of HTML-like tags (e.g., `<MYHTML>`, `<head>`, `<body>`, `<title>`, `<meta>`, `<p>`, `<a>`, `<img>`, `<form>`, `<input>`, `<label>`, `<div>`, etc.).
- **Attributes**: Handles common attributes (e.g., `id`, `style`, `src`, `alt`, `width`, `height`, `type`, `value`, etc.).
- **Comments**: Recognizes and prints out comments in the form `<!-- ... -->`.
- **Syntax Checking**: Checks for syntactic correctness of `.myhtml` files and reports errors with line numbers.
- **Extensible Grammar**: Easily extendable for more tags or attributes by modifying the Flex and Bison files.

## File Structure
- `flex.l` — Flex (lex) file for lexical analysis (tokenizes the input).
- `bison.y` — Bison (yacc) file for grammar rules and parsing.
- `bison.tab.c`, `bison.tab.h` — Generated parser files (do not edit directly).
- `lex.yy.c` — Generated lexer file (do not edit directly).
- `Makefile` — Build instructions.
- `test.myhtml` — Example input file in the custom myHTML language.
- `myparser` — The compiled parser executable.

## How to Build

1. **Install Flex and Bison** (if not already installed):
	```bash
	sudo apt-get install flex bison build-essential
	```
2. **Build the parser:**
	```bash
	make
	```
	This will generate the `myparser` executable.

## How to Use

Run the parser on a `.myhtml` file:

```bash
./myparser test.myhtml
```

- If the file is syntactically correct, you will see:
  ```
  Your file is syntactic correct.
  ```
- If there are syntax errors, you will see an error message with the line number.

## Example
See `test.myhtml` for an example of the custom myHTML syntax supported by this project.

## Extending the Language
- To add new tags or attributes, edit `flex.l` and `bison.y` accordingly.
- Rebuild the project with `make` after making changes.
