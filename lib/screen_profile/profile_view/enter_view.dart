import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/navigation/auto_route.dart';

@RoutePage()
class EnterScreen extends StatefulWidget {
  const EnterScreen({super.key});

  @override
  State<EnterScreen> createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'ВХОД',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Montserrat',
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 45,
            // Устанавливаем ширину контейнера на всю ширину экрана
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Введите почту',
              ),
              controller: controller,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 45,
            // Устанавливаем ширину контейнера на всю ширину экрана
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                onPressed: () {
                  // логика получения кода
                  context.router.navigate(CodeRoute(email: controller.text));
                },
                child: const Text(
                  'Получить код',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
