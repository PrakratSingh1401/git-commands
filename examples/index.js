// Example JavaScript file for Git demonstrations
// This file is used to show git add, commit, and push operations

function greet(name) {
  return `Hello, ${name}!`;
}

function add(a, b) {
  return a + b;
}

function subtract(a, b) {
  return a - b;
}

function multiply(a, b) {
  return a * b;
}

function divide(a, b) {
  if (b === 0) {
    throw new Error('Cannot divide by zero');
  }
  return a / b;
}

// Export functions
module.exports = {
  greet,
  add,
  subtract,
  multiply,
  divide
};

// Example usage:
// const math = require('./index.js');
// console.log(math.greet('World'));  // Hello, World!
// console.log(math.add(5, 3));       // 8
