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

// HOME SCREEN
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppHeader(title: 'Travel Guide - Home', context: context),
              Image.asset(
                'assets/home.jpg',
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.teal.shade50,
                child: Text(
                  'Welcome to Travel Guide App! Explore the beautiful cities and landmarks of Pakistan.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Explore ',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  children: [
                    TextSpan(
                      text: 'Pakistan ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(text: 'with Us!'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter City Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Let’s Explore Pakistan!')),
                  );
                },
                child: Text('Start Exploring'),
              ),
              TextButton(
                onPressed: () {
                  print('More info button pressed');
                },
                child: Text('More Info'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

