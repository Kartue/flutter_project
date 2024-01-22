import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/model/character.dart';


class TableCharacteristic extends StatelessWidget {
  const TableCharacteristic({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Container(
          padding: const EdgeInsets.only(right: 100),
          child: const Text('Описание и характеристика',
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const Divider(color: Colors.grey),
        Row(
            children : [
              const Text('Статус:',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  color: Colors.black,

                ),),
              const SizedBox(width: 90),
              Text(character.status,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  color: Colors.black,

                ),),
            ]
        ),
        const Divider(color: Colors.grey),
        Row(
            children : [
              const Text('Вид:',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),),
              const SizedBox(width: 110),
              Text(character.species,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),),
            ]
        ),
        const Divider(color: Colors.grey),
        Row(
            children : [
              const Text('Гендер:',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),),
              const SizedBox(width: 90),
              Text(character.gender,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),),
            ]
        ),
      ],
    );
  }
}

