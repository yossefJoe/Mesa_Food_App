import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/Widgets/Navigation_Method.dart';
import 'presentation/pages/App_Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return PageNavigate();
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // onGenerateRoute: approuter.generatedoute,

          title: 'Flutter Hello World',
          // Application theme data, you can set the colors for the application as
          // you want
          theme: ThemeData(
            fontFamily: "Poppins",
            // useMaterial3: true,
            primarySwatch: Colors.amber,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.blue,
            ),
          ),
          // A widget which will be started on application startup
          home: MovieHome()
          // FirebaseAuth.instance.currentUser != null
          //     ? FoodHome()
          //     : WelcomePage(),
          ),
    );
  }
}
