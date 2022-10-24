import 'package:flutter/material.dart';

class StartScreenWidget extends StatelessWidget {
  const StartScreenWidget({Key? key}) : super(key: key);

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
              Image.asset('assets/logo.png'),
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
