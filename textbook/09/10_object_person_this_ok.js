const person = {
  name: "Alice",
  great: function () {
    console.log(`こんにちは、私は${this.name}です`);
  },
};

person.great();
