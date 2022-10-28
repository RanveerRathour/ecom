import 'package:ecom/components/custom_button.dart';
import 'package:ecom/components/custom_text_input.dart';
import 'package:ecom/utils/application_state.dart';
import 'package:ecom/utils/custom_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/login_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _loadingButton = false;
  Map<String, String> data = {};

  _LoginScreenState() {
    data = LoginData.signin;
  }
  void switchLogin() {
    setState(() {
      if (mapEquals(data, LoginData.signup)) {
        data = LoginData.signin;
      } else {
        data = LoginData.signup;
      }
    });
  }

  loginError(FirebaseAuthException e) {
    if (e.message != '') {
      setState(() {
        _loadingButton = false;
      });
    }
  }

  void loginButtonPressed() {
    setState(() {
      _loadingButton = true;
    });

    ApplicationState applicationState =
        Provider.of<ApplicationState>(context, listen: false);
    if (mapEquals(data, LoginData.signup)) {
      applicationState.signup(
          _emailcontroller.text, _passwordcontroller.text, loginError);
    } else {
      applicationState.signin(
          _emailcontroller.text, _passwordcontroller.text, loginError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(240, 247, 242, 1.000), //#F9F4F4
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: const Image(
                  image: AssetImage('assets/logo.jpg'),
                  // height: 300,
                  // width: 53,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        data["heading"] as String,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    Text(
                      data["subHeading"] as String,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
              model(data, _emailcontroller, _passwordcontroller),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      onPressed: switchLogin,
                      child: Text(
                        data["footer"] as String,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  model(Map<String, String> data, TextEditingController emailcontroller,
      TextEditingController passwordcontroller) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 56),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                spreadRadius: 0,
                offset: Offset(0, 1)),
          ]), //CustomTheme.getCardDecoration(),
      child: Column(
        children: [
          CustomTextInput(
              label: "Your email address",
              placeholder: "email@address.com",
              icon: Icons.person_outline,
              textEditingController: _emailcontroller),
          CustomTextInput(
              label: "Password",
              placeholder: "password",
              icon: Icons.lock_outlined,
              password: true,
              textEditingController: _passwordcontroller),
          CustomButton(
            text: data["label"] as String,
            onPress: loginButtonPressed,
            loading: _loadingButton,
          )
        ],
      ),
    );
  }
}
