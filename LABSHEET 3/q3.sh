#!/bin/bash

echo "Enter first number:"
read a

echo "Enter second number:"
read b

echo "Sum = $((a + b))"
echo "Difference = $((a - b))"
echo "Product = $((a * b))"

if [ "$b" -ne 0 ]; then
    echo "Quotient = $((a / b))"
else
    echo "Division by zero is not allowed."
fi