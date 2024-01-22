import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerSliderText extends StatelessWidget {
  const BannerSliderText({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 58.5),
      child: SizedBox(
        height: 420,
        child: PageView(controller: controller, physics: const NeverScrollableScrollPhysics(), children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/page11.png'),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'ПОКУПАЙТЕ СВОИХ ГЕРОЕВ ИЗ ЗНАМЕНИТОГО СЕРИАЛА "RICK AND MORTY" ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/page2.png'),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'УДОБНАЯ НАВИГАЦИЯ ВНУТРИ МАГАЗИНА НЕ ПОЗВОЛИТ ВАМ ПОТЕРЯТЬСЯ ИЛИ ЧТО-ТО ЗАБЫТЬ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/page3.png'),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'ЛИСТАЙТЕ КАТАЛОГ С БЛИЗКИМИ И ДРУЗЬЯМИ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/page4.png'),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'ПРИЯТНОЙ РАБОТЫ С ПРИЛОЖЕНИЕМ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
