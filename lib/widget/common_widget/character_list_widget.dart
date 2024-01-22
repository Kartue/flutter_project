import 'package:flutter/material.dart';
import 'package:flutter_project/widget/common_widget/character_widget.dart';

import '../../domain/model/character.dart';

class CharacterListWidget extends StatelessWidget {
  const CharacterListWidget({
    super.key,
    required this.characters,
  });

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: 0.6,
      ),
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      itemCount: characters.length,
      itemBuilder: (BuildContext context, int index) {
        final character = characters[index];
        return CharacterWidget(character: character);
      },
    );
    ;
  }
}
