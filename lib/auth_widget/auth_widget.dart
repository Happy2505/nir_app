import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:async';

import '../Theme/app_color.dart';
import '../domain/data_provider/session_data_provider.dart';
import '../factoryes/screen_factory.dart';
import '../profile_screen/proile_widget.dart';
import 'auth_model.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    final _sessionDataProvider = SessionDataProvider();

    // var check = await _sessionDataProvider.getAccountCheck();
    // if(check == null) {
    //   await _sessionDataProvider.setAccountCheck("no");
    //   check = "no";
    // }
    // if(check == "no"){
    //   Navigator.pushReplacementNamed(context, '/auth');
    // }

    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 237, 237),
        body: _HeaderWidget(),
      ),
    );
  }
}

class _HeaderWidget extends StatefulWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  State<_HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<_HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    var heightAuth = MediaQuery.of(context).size.height - 490;
    if (heightAuth < 200) heightAuth = 200;
    return ListView(
      children: [
        Container(
          height: heightAuth,
          decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/logo2.png'),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(20, 0, 0, 0),
                  blurRadius: 40,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          // child: Stack(
          //   children: [
          //     Align(child: Image.asset('assets/logo.png', fit: BoxFit.fitWidth,)),
          //   ],
          // ),
        ),
        SizedBox(
          // height: MediaQuery.of(context).size.height-375,
          child: Column(
            children: [
              _RegField(),
            ],
          ),
        )
      ],
    );
  }
}

class _RegField extends StatefulWidget {
  const _RegField({Key? key}) : super(key: key);

  @override
  _RegFieldState createState() => _RegFieldState();
}

class _RegFieldState extends State<_RegField> {
  bool reg = true;

  Color color = Colors.grey;
  Color color2 = Color.fromARGB(255, 215, 215, 215);
  bool isChecked = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController CodController = TextEditingController();
  String email = " ";
  String cod = "1234";

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: reg,
      replacement: sendKode(context),
      child: TakeKode(context),
    );
  }

  Widget sendKode(BuildContext context) {
    final _screenFactory = ScreenFactory();

    if (isChecked == false) {
      color2 = Color.fromARGB(255, 215, 215, 215);
    }
    if (isChecked == true) {
      color2 = Colors.greenAccent;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: Text(
              "Вход",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: TextFormField(
              controller: emailController,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Логин",
                // isCollapsed: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                helperStyle: const TextStyle(
                  letterSpacing: 0.4,
                  height: 0.7,
                ),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(150, 0, 0, 0),
                  fontSize: 18,
                ),
                border: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(150, 0, 0, 0))),
                focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(150, 0, 0, 0))),
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: TextFormField(
              controller: emailController,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Пароль",
                // isCollapsed: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                helperStyle: const TextStyle(
                  letterSpacing: 0.4,
                  height: 0.7,
                ),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(150, 0, 0, 0),
                  fontSize: 18,
                ),
                border: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(150, 0, 0, 0))),
                focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(150, 0, 0, 0))),
              ),
            ),
          ),
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProfileWidget()),
                  );
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    backgroundColor: MaterialStateProperty.all(color2),
                    minimumSize:
                        MaterialStateProperty.all(const Size(314, 50))),
                child: Text(
                  "Войти",
                  style: const TextStyle(
                      letterSpacing: 0.25, fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Нет аккаунта? ",
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  child: Text(
                    "Зарегистрироваться",
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    setState(() {
                      reg = true;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget TakeKode(BuildContext context) {
    if (isChecked == false) {
      color2 = Color.fromARGB(255, 215, 215, 215);
    }
    if (isChecked == true) {
      color2 = Colors.greenAccent;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: Text(
              "Регистрация",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: TextFormField(
              controller: emailController,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Логин",
                // isCollapsed: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                helperStyle: const TextStyle(
                  letterSpacing: 0.4,
                  height: 0.7,
                ),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(150, 0, 0, 0),
                  fontSize: 18,
                ),
                border: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(150, 0, 0, 0))),
                focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(150, 0, 0, 0))),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: TextFormField(
              controller: emailController,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                // isCollapsed: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                helperStyle: const TextStyle(
                  letterSpacing: 0.4,
                  height: 0.7,
                ),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(150, 0, 0, 0),
                  fontSize: 18,
                ),
                border: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(150, 0, 0, 0))),
                focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(150, 0, 0, 0))),
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: TextFormField(
              controller: emailController,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Пароль",
                // isCollapsed: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                helperStyle: const TextStyle(
                  letterSpacing: 0.4,
                  height: 0.7,
                ),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(150, 0, 0, 0),
                  fontSize: 18,
                ),
                border: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(150, 0, 0, 0))),
                focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(150, 0, 0, 0))),
              ),
            ),
          ),
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushReplacementNamed(context, '/profile');
                  // Navigator.of(context).pushNamedAndRemoveUntil('/profile', (route) => false);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProfileWidget()),
                  );
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    backgroundColor: MaterialStateProperty.all(color2),
                    minimumSize:
                        MaterialStateProperty.all(const Size(314, 50))),
                child: Text(
                  "Зарегистрироваться",
                  style: const TextStyle(
                      letterSpacing: 0.25, fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Есть аккаунт? ",
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  child: Text(
                    "Войти",
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    setState(() {
                      reg = false;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
