class Item {
  String label, symbol, id;
  bool boxTwo;
  int color;

  Item({this.label, this.symbol, this.color, this.id});

  Item.colorBoxes({
    this.id,
    this.label,
    this.symbol,
    this.boxTwo = true,
    this.color,
  });

  Item.colors({
    this.id,
    this.boxTwo = false,
    this.color,
  });

  Item.symbols({
    this.id,
    this.boxTwo = false,
    this.symbol,
  });

  Item.fromMap(Map<List<String>, dynamic> map)
      : id = map['id'] as String,
        label = map['label'] as String,
        symbol = map['symbol'] as String,
        boxTwo = map['boxTwo'] as bool,
        color = map['color'] as int;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
      'symbol': symbol,
      'boxTwo': boxTwo,
      'color': color,
    };
  }

  @override
  String toString() {
    return {
      'id': id,
      'label': label,
      'symbol': symbol,
      'boxTwo': boxTwo,
      'color': color,
    }.toString();
  }
}
