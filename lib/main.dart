import 'package:flutter/material.dart';

void main() {
  runApp(TravelGuideApp());
}

class TravelGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Guide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomeScreen(),
    );
  }
}

// HEADER WIDGET
class AppHeader extends StatelessWidget {
  final String title;
  final BuildContext context;

  AppHeader({required this.title, required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  this.context, MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            child: Text('Home', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(this.context,
                  MaterialPageRoute(builder: (_) => ListScreen()));
            },
            child: Text('Destinations', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(this.context,
                  MaterialPageRoute(builder: (_) => AboutScreen()));
            },
            child: Text('About', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
