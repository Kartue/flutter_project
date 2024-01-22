import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayBottomButton extends StatelessWidget {
  const PayBottomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      left: 0,
      right: 0,
      child: Container(

        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shape:
              const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
            onPressed: () {
            },

            child: const Text('Оформить заказ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                color: Colors.white,
              ),
            )),
      ),);
  }
}

