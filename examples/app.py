#!/usr/bin/env python3
"""
Example Python file for Git demonstrations
This file shows basic Python code for version control practice
"""

def calculate_age(birth_year):
    """Calculate age from birth year"""
    current_year = 2024
    return current_year - birth_year


def is_even(number):
    """Check if number is even"""
    return number % 2 == 0


def fibonacci(n):
    """Generate Fibonacci sequence up to n terms"""
    if n <= 0:
        return []
    elif n == 1:
        return [0]
    
    fib_sequence = [0, 1]
    for i in range(2, n):
        fib_sequence.append(fib_sequence[i-1] + fib_sequence[i-2])
    
    return fib_sequence[:n]


def merge_lists(*lists):
    """Merge multiple lists into one"""
    result = []
    for lst in lists:
        result.extend(lst)
    return result


if __name__ == "__main__":
    # Example usage
    print("Age:", calculate_age(1990))      # Calculate age
    print("Is 4 even?", is_even(4))         # Check if even
    print("Fibonacci:", fibonacci(10))      # Generate fibonacci
    
    # Merge lists
    merged = merge_lists([1, 2], [3, 4], [5, 6])
    print("Merged:", merged)
