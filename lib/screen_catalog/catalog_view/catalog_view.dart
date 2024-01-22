import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screen_catalog/catalog_view_model/catalog_view_model.dart';
import 'package:flutter_project/widget/common_widget/character_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import '../../domain/data/character_repository.dart';
import '../../domain/model/character.dart';

@RoutePage()
class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CatalogViewModel>().getCatalog();
  }

  @override
  Widget build(BuildContext context) {
    final catalogViewModel = context.read<CatalogViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Подкатегории товаров',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Montserrat',
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 150.0),
            child: TextButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              label: const Text(
                'ПО ВОЗРАСТАНИЮ ЦЕНЫ',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                ),
              ),
              icon: const Icon(Icons.keyboard_arrow_down, size: 26),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                contentPadding: EdgeInsets.all(0.6),
                labelText: " П О И С К",
                filled: true,
                fillColor: Colors.white12,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(
            height: 7.0,
            width: 135.0,
          ),
          Flexible(
            child: StreamBuilder(
              stream: catalogViewModel.characters,
              builder: (context, snapshot) {
                final characters = snapshot.data;
                if (characters == null) {
                  return const CircularProgressIndicator();
                }
                return CharacterListWidget(characters: characters);
              },
            ),
          ),
        ],
      ),
    );
  }
}
