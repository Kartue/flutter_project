import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/navigation/auto_route.dart';
import 'package:flutter_project/screen_showcase/showcase_view/showcase_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../introduction_widget/banner_slider_text_widget.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController controller = PageController();
  int pageNumber = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        if (controller.position.userScrollDirection.index == 1) {
          pageNumber -= 1;
        } else if (controller.position.userScrollDirection.index == 2) {
          pageNumber += 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/close.png'),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BannerSliderText(controller: controller),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                onPressed: () {
                  if (pageNumber == 3) {
                    context.router.push(const MainRouteWidget());

                    SharedPreferences.getInstance().then((value) {
                      value.setBool('isFirstRun', false);
                    });
                  } else {
                    setState(() {
                      pageNumber++;
                    });

                    controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Center(
                  child: Text(pageNumber <= 2 ? 'ДАЛЕЕ' : 'НАЧАТЬ'),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
              height: 10,
            ),
            Flexible(
              child: SmoothPageIndicator(
                controller: controller,
                count: 4,
                effect: const WormEffect(
                    dotHeight: 9.0,
                    dotWidth: 9.0,
                    spacing: 20.0,
                    dotColor: Colors.black,
                    activeDotColor: Colors.black,
                    paintStyle: PaintingStyle.stroke),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

