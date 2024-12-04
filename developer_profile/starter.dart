import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Profile Layout')),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: const [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('John or Jane Doe',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('Mobile Developer',
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('About:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Passionate about building mobile apps.'),
            SizedBox(height: 20),
            Text('Hobbies:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('- Reading Books'),
                Text('- Traveling'),
                Text('- Cooking'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
