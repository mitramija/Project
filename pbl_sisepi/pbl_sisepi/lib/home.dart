import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double x = 0.0, y = 0.0, z = 0.0;
  StreamSubscription? _accelerometerSubscription;

  @override
  void initState() {
    super.initState();
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    });
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Pesan'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessagesScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Detail'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Sumbu X'),
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.red,
                      value: x.abs().clamp(0, 100),
                      title: 'X',
                      radius: 50,
                      titleStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    PieChartSectionData(
                      color: Colors.grey,
                      value: (100 - x.abs().clamp(0, 100)).toDouble(),
                      title: '',
                      radius: 50,
                      titleStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ],
                  centerSpaceRadius: 40,
                  sectionsSpace: 0,
                  startDegreeOffset: 270,
                ),
              ),
            ),
            Text('Sumbu Y'),
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.green,
                      value: y.abs().clamp(0, 100),
                      title: 'Y',
                      radius: 50,
                      titleStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    PieChartSectionData(
                      color: Colors.grey,
                      value: (100 - y.abs().clamp(0, 100)).toDouble(),
                      title: '',
                      radius: 50,
                      titleStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ],
                  centerSpaceRadius: 40,
                  sectionsSpace: 0,
                  startDegreeOffset: 270,
                ),
              ),
            ),
            Text('Sumbu Z'),
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.blue,
                      value: z.abs().clamp(0, 100),
                      title: 'Z',
                      radius: 50,
                      titleStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    PieChartSectionData(
                      color: Colors.grey,
                      value: (100 - z.abs().clamp(0, 100)).toDouble(),
                      title: '',
                      radius: 50,
                      titleStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ],
                  centerSpaceRadius: 40,
                  sectionsSpace: 0,
                  startDegreeOffset: 270,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class NotificationMessage {
  final String title;
  final String body;
  final DateTime dateTime;
  final String image;

  NotificationMessage({
    required this.title,
    required this.body,
    required this.dateTime,
    required this.image,
  });
}

class MessagesScreen extends StatelessWidget {
  final List<NotificationMessage> notifications = [
    NotificationMessage(
      title: "Sapi 1",
      body: "Sapi anda sedang tidak Aman!.",
      dateTime: DateTime.now(),
      image: 'assets/cow_alert.jpg',
    ),
    NotificationMessage(
      title: "Sapi 2",
      body: "Sapi anda Aman!",
      dateTime: DateTime.now().subtract(Duration(hours: 1)),
      image: 'assets/cow_normal.jpg',
    ),
    // Tambahkan lebih banyak notifikasi jika diperlukan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan Notifikasi'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            child: ListTile(
              leading: Image.asset(
                notification.image,
                width: 40, // Atur ukuran gambar sesuai kebutuhan
                height: 40,
                fit: BoxFit.cover,
              ),
              title: Text(notification.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification.body),
                  SizedBox(height: 4),
                  Text(
                    // Tampilkan tanggal dan waktu dengan format yang lebih baik
                    "${notification.dateTime.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Keamanan Sapi'),
      ),
      body: DetailScreenBody(),
    );
  }
}

class DetailScreenBody extends StatefulWidget {
  @override
  _DetailScreenBodyState createState() => _DetailScreenBodyState();
}

class _DetailScreenBodyState extends State<DetailScreenBody> {
  double x = 0.0, y = 0.0, z = 0.0;
  StreamSubscription? _accelerometerSubscription;

  @override
  void initState() {
    super.initState();
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    });
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Sample data for cow details
    List<Map<String, dynamic>> cowDetails = [
      {
        'name': 'Sapi 1',
        'status': 'Normal',
        'details': 'Sapi berada di kandang dan dalam kondisi aman.',
        'image': 'assets/cow_normal.jpg',
      },
      {
        'name': 'Sapi 2',
        'status': 'Tidak Normal',
        'details': 'Sapi terlihat keluar dari area kandang.',
        'image': 'assets/cow_alert.jpg',
      },
      {
        'name': 'Sapi 3',
        'status': 'Normal',
        'details': 'Sapi berada di kandang dan dalam kondisi aman.',
        'image': 'assets/cow_normal.jpg',
      },
    ];

    return ListView.builder(
      itemCount: cowDetails.length,
      itemBuilder: (context, index) {
        final cow = cowDetails[index];
        return Card(
          margin: EdgeInsets.all(10.0),
          child: ListTile(
            leading: Image.asset(
              cow['image'],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(
              cow['name'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CowDetailPage(
                    cow: cow,
                    x: x,
                    y: y,
                    z: z,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class CowDetailPage extends StatelessWidget {
  final Map<String, dynamic> cow;
  final double x;
  final double y;
  final double z;

  CowDetailPage({
    required this.cow,
    required this.x,
    required this.y,
    required this.z,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cow['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              cow['image'],
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              cow['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              cow['details'],
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Text(
              'Accelerometer:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Center(
              child: Container(
                width: 200,
                height: 200,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: [
                      PieChartSectionData(
                        color: Colors.red,
                        value: x.abs(),
                        title: 'X',
                        radius: 50,
                        titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      PieChartSectionData(
                        color: Colors.green,
                        value: y.abs(),
                        title: 'Y',
                        radius: 50,
                        titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      PieChartSectionData(
                        color: Colors.blue,
                        value: z.abs(),
                        title: 'Z',
                        radius: 50,
                        titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Sumbu X: $x'),
            Text('Sumbu Y: $y'),
            Text('Sumbu Z: $z'),
          ],
        ),
      ),
    );
  }
}


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/sapi1.png'),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
