class medicine {
  final String name;
  final String combination;
  final int price;
  final int amount;
  final String image;
  medicine(this.name, this.combination, this.price, this.amount, this.image);
  static List<medicine> getmedicines() {
    List<medicine> items =<medicine>[];
    items.add(
      medicine("cetamol", "abc", 100, 10, "med1.jpg")
    );
    items.add(
        medicine("augmantine", "uhedu", 200, 40, "med2.jpg")
    );
    return items;
  }

}