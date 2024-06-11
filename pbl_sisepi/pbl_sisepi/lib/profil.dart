import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _usernameController = TextEditingController(text: '');
  final _nameController = TextEditingController(text: '');
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  String _username = '';
  String _name = '';
  String _email = '';
  String _password = '';

  void _saveProfile() {
    setState(() {
      _username = _usernameController.text;
      _name = _nameController.text;
      _email = _emailController.text;
      _password = _passwordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/profil.png'), // Ganti dengan path logo profil Anda
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Username',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan Username',
                filled: true,
                fillColor: Colors.teal[50],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Nama',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan Nama Lengkap',
                filled: true,
                fillColor: Colors.teal[50],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Email',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan Email',
                filled: true,
                fillColor: Colors.teal[50],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Password',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan Password',
                filled: true,
                fillColor: Colors.teal[50],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text('Simpan', style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 20),
            if (_username.isNotEmpty &&
                _name.isNotEmpty &&
                _email.isNotEmpty &&
                _password.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Data Profil:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  Text('Username: $_username'),
                  Text('Nama: $_name'),
                  Text('Email: $_email'),
                  Text('Password: $_password'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}
