import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 54,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                  radius: 50, backgroundImage: AssetImage('assets/me.jpeg')),
            ),
            SizedBox(height: 16),
            Text(
              'AlBaihaki',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'baihaki.al@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Malang, Indonesia'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+62 838 9925 7090'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Joined on December 1, 2024'),
            ),
          ],
        ),
      ),
    );
  }
}
