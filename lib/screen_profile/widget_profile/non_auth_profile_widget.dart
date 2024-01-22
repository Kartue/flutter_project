import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../navigation/auto_route.dart';

class NonAuthProfileWidget extends StatelessWidget {
  const NonAuthProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          // Устанавливаем ширину контейнера на всю ширину экрана
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          // Устанавливаем отступы по горизонтали
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            onPressed: () {
              context.router.navigate(const EnterRoute());
              // Действия при нажатии кнопки
            },
            child: const Text(
              'ВХОД/ЗАРЕГИСТРИРОВАТЬСЯ',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          // Устанавливаем ширину контейнера на всю ширину экрана
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          // Устанавливаем отступы по горизонтали
          child: TextButton(
            onPressed: () {},
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Адреса магазинов',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Icon(
                  // <-- Icon
                  Icons.keyboard_arrow_right,
                  size: 28.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}