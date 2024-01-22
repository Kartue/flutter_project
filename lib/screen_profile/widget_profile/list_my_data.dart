import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/model/profile_model.dart';


class ListMyData extends StatelessWidget {
  const ListMyData({
    super.key,
    required this.data,
  });

  final ProfileModel? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
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
                Text(data!.name,
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
                const Text('Номер:',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                  ),),
                const SizedBox(width: 90),
                Text(data!.phone,
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
                const Text('Почта:',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                  ),),
                const SizedBox(width: 90),
                Text(data!.email,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                  ),),
              ]
          ),
        ],
      ),
    );
  }
}
