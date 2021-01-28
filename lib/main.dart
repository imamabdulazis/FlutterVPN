import 'package:VarxVPN/presentation/screens/home/home_screen.dart';
import 'package:VarxVPN/presentation/screens/not_found/not_found_screen.dart';
import 'package:flutter/material.dart';

void main() {
  try {
    runApp(App());
  } catch (error) {
    print(error);
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VarxVPN',
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
      onUnknownRoute: (RouteSettings rs) => MaterialPageRoute(
        builder: (context) => NotFoundScreen(),
      ),
    );
  }
}
