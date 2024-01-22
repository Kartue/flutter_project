import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/model/character.dart';
import '../cart_view_model/cart_view_model.dart';

class MiniCartCounter extends StatelessWidget {
  const MiniCartCounter({
    super.key,
    required this.cartViewModel,
    required this.character,
    required this.count,
  });

  final CartCharacterViewModel cartViewModel;
  final Character character;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        SizedBox(
          height: 32,
          width: 32,
          child: ElevatedButton(
              onPressed: () {
                cartViewModel.changeCount(
                    character, count - 1);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.zero),
              ),
              child: Text(
                '-',
                textAlign: TextAlign.center,
              )),
        ),
        SizedBox(
          width: 32,
          child: Column(
            children: [
              Text('$count'),
            ],
          ),
        ),
        SizedBox(
          height: 32,
          width: 32,
          child: ElevatedButton(
              onPressed: () {
                cartViewModel.changeCount(
                    character, count + 1);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.zero),
              ),
              child: Text(
                '+',
                textAlign: TextAlign.center,
              )),
        ),
      ],
    );
  }
}

