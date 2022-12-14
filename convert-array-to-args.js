const arrayOfInputs = process.argv[2];
const argumentOption = process.argv[3];

try {
    const arr = JSON.parse(arrayOfInputs);
    console.log(arr.map(input => `${argumentOption}=${input}`).join(' '));
} catch (e) {
    console.log(`${argumentOption}=${arrayOfInputs}`)
}
