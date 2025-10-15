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

// LIST SCREEN
class ListScreen extends StatelessWidget {
  final List<Map<String, String>> destinations = [
    {'name': 'Lahore', 'desc': 'The cultural heart of Pakistan, famous for food and heritage.'},
    {'name': 'Karachi', 'desc': 'The city of lights and Pakistan’s economic hub.'},
    {'name': 'Islamabad', 'desc': 'The beautiful capital city surrounded by Margalla Hills.'},
    {'name': 'Murree', 'desc': 'A famous hill station and tourist resort.'},
    {'name': 'Skardu', 'desc': 'Gateway to K2 and home of stunning mountain views.'},
    {'name': 'Hunza Valley', 'desc': 'Known for its breathtaking scenery and peaceful environment.'},
    {'name': 'Peshawar', 'desc': 'One of the oldest cities with rich Pashtun culture.'},
    {'name': 'Multan', 'desc': 'The city of saints, known for its shrines and mangoes.'},
    {'name': 'Quetta', 'desc': 'Surrounded by mountains, known as the fruit garden of Pakistan.'},
    {'name': 'Gwadar', 'desc': 'A rising port city with beautiful beaches.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(title: 'Travel Guide - Destinations', context: context),
            Expanded(
              child: ListView.builder(
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      leading: Icon(Icons.place, color: Colors.teal),
                      title: Text(destinations[index]['name']!,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(destinations[index]['desc']!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ----------------- ABOUT SCREEN -----------------
class AboutScreen extends StatelessWidget {
  final List<Map<String, String>> attractions = [
    {'image': 'assets/badshahi.jpg', 'name': 'Badshahi Mosque (Lahore)'},
    {'image': 'assets/faisal.jpg', 'name': 'Faisal Mosque (Islamabad)'},
    {'image': 'assets/minar.jpg', 'name': 'Minar-e-Pakistan (Lahore)'},
    {'image': 'assets/mazar.jpg', 'name': 'Mazar-e-Quaid (Karachi)'},
    {'image': 'assets/hunza.jpg', 'name': 'Hunza Valley (Gilgit Baltistan)'},
    {'image': 'assets/k2.jpg', 'name': 'K2 Mountain (Skardu)'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(title: 'Travel Guide - About', context: context),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: attractions.map((place) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.antiAlias,
                      elevation: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              place['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            color: Colors.teal.shade50,
                            padding: EdgeInsets.all(6),
                            child: Text(
                              place['name']!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

