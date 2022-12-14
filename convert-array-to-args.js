const arrayOfInputs = process.argv[2];
const argumentOption = process.argv[3];

const arr = JSON.parse(arrayOfInputs);
console.log(arr.map(input => `${argumentOption}='${input}'`).join(' '));
