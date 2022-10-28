import 'package:flutter/material.dart';
import 'package:nir_app/Theme/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreenWidget extends StatelessWidget {
  const WelcomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/start_image1.png',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 41, left: 41),
            child: Column(
              children: [
                Image.asset('assets/logo.png'),
                const Text(
                  'Lorem',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 395,
            left: 41,
            child: AnimatedSmoothIndicator(
              count: 3,
              activeIndex: 0,
              effect: const WormEffect(
                dotColor: Color.fromARGB(76, 217, 217, 217),
                activeDotColor: Colors.white,
                dotWidth: 14,
                dotHeight: 14,
              ),
            ),
          ),
          Positioned(
            left: 40,
            bottom: ((MediaQuery.of(context).size.height) / 2) - 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Создай свой',
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
                Text(
                  'Уютный дом',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 70,
            left: 25,
            child: Row(
              children: [
                TextButton(
                  child: const Text('Пропустить',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/catalog');
                  },
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/catalog');
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        minimumSize:
                            MaterialStateProperty.all(const Size(161, 68))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'Далее',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.mainDark,
                              fontSize: 26),
                        ),
                        SizedBox(width: 15),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.mainDark,
                          size: 18,
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
