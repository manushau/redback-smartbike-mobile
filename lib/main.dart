import 'package:flutter/material.dart';
import 'pages/login.dart';
// for passing user data throughout the app:
import 'package:provider/provider.dart';
import 'provider/data_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: LoginPage(),
        //home: MapPage(),
      ),
    );
  }
}
