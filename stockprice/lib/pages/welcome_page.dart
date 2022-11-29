import 'package:flutter/material.dart';
import 'package:stockprice/pages/login_page.dart';
import 'package:stockprice/widgets/blinking_button.dart';
import '../widgets/app_text_bold.dart';
import '../widgets/app_text_normal.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int pageValue = 0;
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  List images = [
    "assets/images/welcome_1.jpg",
    "assets/images/welcome_2.jpg",
    "assets/images/welcome_3.jpg",
  ];
  //dummy text
  List<String> textHeader = [
    "Looking for a wise investment?"
        //"Be the first to know about cheap stock"
        //"SureMoney Stock Price Prediction App"
  ];
  List<String> textSubHeader = [
    "Look no further",
    //"We use a highly developed Artificial Intelligence software to predict stock prices"
        //"Where your money is valued "
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: sized_box_for_whitespace
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (i) => setState(() {
                pageValue = i;
                //print(pageValue);
              }),
              itemCount: images.length,
              itemBuilder: (ctx, index) {
                return Container(
                  padding: const EdgeInsets.only(top: 55, left: 20, right: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter:
                          const ColorFilter.mode(Colors.blue, BlendMode.darken),
                      image: AssetImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  //Text
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //decorting text
                      AppTextBold(text: textHeader[index]),
                      AppTextNormal(
                        text: textSubHeader[index],
                        size: 25,
                      ),
                    ],
                  ),
                );
              },
            ),
//-----------------------------Slider indicator----------------------------------------------------
            Positioned(
              right: MediaQuery.of(context).size.width / 2 - 60,
              bottom: 10,
              child: Row(
                children: List.generate(
                  images.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: pageValue == index ? 30 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: pageValue == index ? Colors.orange : Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),

            //-------------------blinking button----------------------------------
            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              right: 10,
              child: BlinkingButton(
                onTap: () {
                  // ignore: avoid_print
                  print(pageValue);
                  //slide page
                  if (pageValue + 1 < images.length) {
                    _pageController.animateToPage(
                      pageValue + 1,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                    );
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const LoginPage()));
                  }
                  //moving to a new page
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//to make it an animated container
