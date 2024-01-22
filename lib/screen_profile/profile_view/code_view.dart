import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/navigation/auto_route.dart';
import 'package:provider/provider.dart';

import '../profile_view_model/profile_view_model.dart';

@RoutePage()
class CodeScreen extends StatefulWidget {
  const CodeScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final profileViewModel = context.read<ProfileViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'ВХОД',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            widget.email,
            style: const TextStyle(
              fontSize: 15,
              fontFamily: 'Montserrat',
              color: Colors.black,
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            // Устанавливаем ширину контейнера на всю ширину экрана
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Введите код',
              ),
              controller: codeController,
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
                final isCodeCorrect = profileViewModel.validateCode(widget.email, codeController.text);
                if (isCodeCorrect) {
                  context.router.navigate(const ProfileRoute());
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Ошибка валидации кода'),
                    ),
                  );
                }
              },
              child: const Text(
                'Войти',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
