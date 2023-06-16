import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartScreenWidget extends StatefulWidget {
  const StartScreenWidget({Key? key}) : super(key: key);

  @override
  State<StartScreenWidget> createState() => _StartScreenWidgetState();
}

class _StartScreenWidgetState extends State<StartScreenWidget> {
  @override
  void initState() {
    super.initState();
    Future.delayed( const Duration(seconds: 1), (){
      Navigator.pushReplacementNamed(context, '/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/start_image_blur.png',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/logo.svg",
              ),
              const Text('Lorem',
                style: TextStyle(
                    fontSize: 32,
                  color: Colors.white,
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
