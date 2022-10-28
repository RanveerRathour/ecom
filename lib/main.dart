import 'package:ecom/screens/Search.dart';
import 'package:ecom/screens/checkout.dart';
import 'package:ecom/screens/home.dart';
import 'package:ecom/screens/login.dart';
import 'package:ecom/screens/profile.dart';
import 'package:ecom/utils/application_state.dart';
import 'package:ecom/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: (context, _) => Consumer<ApplicationState>(
      builder: (context, ApplicationState, _) {
        Widget child;
        switch (ApplicationState.loginState) {
          case ApplicationLoginState.loggetOut:
            child = LoginScreen();
            break;

          case ApplicationLoginState.loggedIn:
            child = MyApp();
            break;
          default:
            child = LoginScreen();
        }

        return MaterialApp(
          theme: CustomTheme.getTheme(),
          home: child,
        );
      },
    ),
  ));
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Elev8Homes"),
        ),
        bottomNavigationBar: Container(

          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              boxShadow: CustomTheme.cardShadow),
          child: const TabBar(

              padding: EdgeInsets.symmetric(vertical: 10),
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.search_outlined)),
                Tab(icon: Icon(Icons.person)),
                Tab(icon: Icon(Icons.shopping_cart))
              ]),
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
            Search(),
            ProfileScreen(),
            CheckoutScreen(),
          ],
        ),
      ),
    );
  }
}
