import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screen_profile/widget_profile/list_my_data.dart';
import 'package:flutter_project/screen_profile/widget_profile/non_auth_profile_widget.dart';
import 'package:provider/provider.dart';

import '../profile_view_model/profile_view_model.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileViewModel = context.read<ProfileViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Профиль',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Montserrat',
            color: Colors.black,
          ),
        ),
      ),
      body: StreamBuilder(
          stream: profileViewModel.profile,
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (data == null) {
              return const NonAuthProfileWidget();
            }
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 250),
                  child: const Text('Мои данные',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                ),
                ListMyData(data: data),
                SizedBox(
                  height: 16,
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
                      shape:
                      const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    ),
                    onPressed: () {
                      profileViewModel.logout();
                    },
                    child: const Text('Выйти',
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
            );
          }),
    );
  }
}



