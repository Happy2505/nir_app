import 'package:flutter/material.dart';
import 'package:nir_app/Theme/app_color.dart';
import 'package:nir_app/factoryes/screen_factory.dart';
import 'package:nir_app/profile_screen/save_plane.dart';
import 'package:provider/provider.dart';

import 'favorite_widgt.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenFactory = ScreenFactory();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.input_rounded, color: AppColors.mainDark))
          ],
          title: const Text('Профиль',
              style: TextStyle(
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  letterSpacing: -0.17,
                  color: AppColors.mainDark)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdnn21.img.ria.ru/images/156087/28/1560872802_0:778:1536:1642_600x0_80_0_0_606c2d47b6d37951adc9eaf750de22f0.jpg'),
                      radius: 30),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Цуканов Максим",
                          style: TextStyle(
                              fontFamily: 'Jost',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15,
                              color: AppColors.mainDark)),
                      Text('@maksimTsukanov',
                          style: TextStyle(
                              fontFamily: 'Jost',
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.25,
                              color: AppColors.mainDark)),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 34),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 233, 233, 233)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 16)),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)))),
                  onPressed: () {
                    Navigator.of(context).push(_createRoute());

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Избранное',
                          style: TextStyle(
                              fontFamily: 'Jost',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainDark)),
                      Icon(Icons.arrow_forward_ios_rounded, color: AppColors.mainDark, size: 18,)
                    ],
                  )),
              const SizedBox(height: 23),
              const Text('Личные данные:',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Jost',
                      color: AppColors.mainDark)),
              const SizedBox(height: 17),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Имя',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Jost',
                            letterSpacing: 0.15,
                            color: Color.fromARGB(255, 189, 189, 189))),
                    Text("Цуканов Максим",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Jost',
                            letterSpacing: 0.25,
                            color: AppColors.mainDark)),
                    SizedBox(height: 29),
                    Text('Телефон',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Jost',
                            letterSpacing: 0.15,
                            color: Color.fromARGB(255, 189, 189, 189))),
                    Text("8 (888) 888 88-88",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Jost',
                            letterSpacing: 0.25,
                            color: AppColors.mainDark)),
                    SizedBox(height: 29),
                    Text("E-mail",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Jost',
                            letterSpacing: 0.15,
                            color: Color.fromARGB(255, 189, 189, 189))),
                    Text("user@example.com",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Jost',
                            letterSpacing: 0.25,
                            color: AppColors.mainDark)),
                    SizedBox(height: 29),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}


Route _createRoute() {
  final screenFactory = ScreenFactory();

  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  FavoritePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}