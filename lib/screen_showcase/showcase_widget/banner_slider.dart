import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: SizedBox(
            height: 300.0,
            child: PageView(
              controller: controller,
              children: [
                Column(
                  children: [
                    Image.asset('assets/images/product.png'),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/product.png'),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/product.png'),
                  ],
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,

            effect: const WormEffect(
              dotHeight: 9.0,
              dotWidth: 9.0,
              spacing: 25.0,
              dotColor: Colors.grey,
              activeDotColor: Colors.black38,
            ),
          ),
        ),
      ],
    );
  }
}
