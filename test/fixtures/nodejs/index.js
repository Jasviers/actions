function greeting() {
  return "hello from actions test fixture";
}

if (require.main === module) {
  console.log(greeting());
}

module.exports = { greeting };
