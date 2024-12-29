#!/bin/bash

# Define variables
YACC_FILE="parser.y"
LEX_FILE="parser.l"
DRIVER_FILE="driver.cpp"
OUTPUT_BINARY="add_only"

# Step 1: Run bison
echo "Running bison..."
bison -d $YACC_FILE
if [ $? -ne 0 ]; then
  echo "Bison failed. Exiting."
  exit 1
fi

# Step 2: Run flex
echo "Running flex..."
flex $LEX_FILE
if [ $? -ne 0 ]; then
  echo "Flex failed. Exiting."
  exit 1
fi

# Step 3: Compile with g++
echo "Compiling with g++..."
g++ -o $OUTPUT_BINARY parser.tab.c lex.yy.c $DRIVER_FILE -lfl
if [ $? -ne 0 ]; then
  echo "Compilation failed. Exiting."
  exit 1
fi

# Completion message
echo "Build successful! Binary: $OUTPUT_BINARY"

