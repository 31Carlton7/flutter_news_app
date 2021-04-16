import 'package:canton_design_system/canton_design_system.dart';

List<Item> tagColors = <Item>[
  Item.colors(
    color: cantonRed.value,
  ),
  Item.colors(
    color: cantonOrange.value,
  ),
  Item.colors(
    color: cantonYellow.value,
  ),
  Item.colors(
    color: cantonGreen.value,
  ),
  Item.colors(
    color: cantonBlue.value,
  ),
  Item.colors(
    color: cantonPurple.value,
  ),
  Item.colors(
    color: cantonLightBlue.value,
  ),
  Item.colors(
    color: cantonPink.value,
  ),
];

List<Item> symbolList() {
  List<Item> list = <Item>[];

  Emoji.all().forEach((emoji) {
    list.add(Item(
      symbol: emoji.toString(),
      label: emoji.name,
      color: 0,
    ));
  });

  return list;
}

List<Item> emojiList = symbolList();
