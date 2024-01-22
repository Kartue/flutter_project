import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/navigation/auto_route.dart';
import 'package:flutter_project/screen_showcase/showcase_widget/banner_slider.dart';
import 'package:flutter_project/widget/common_widget/to_cart_button.dart';

@RoutePage()
class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({super.key});

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  PageController controller = PageController(keepPage: true);
  PageController secondController = PageController(keepPage: true);

  get yourActiveIndex => 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo2.png',
          width: 118,
          height: 38,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 30,
            width: 400,
            padding: const EdgeInsets.only(left: 25),
            child: const Text(
              "З а г о л о в о к",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
          ),
          ToCartButton(
            onTap: () {
              context.router.navigate(const CartTab());
            },
          ),
          Flexible(
            child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 2,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  BannerSlider(controller: controller),
                  BannerSlider(controller: secondController),
                ]),
          )
        ],
      ),
    );
  }
}
