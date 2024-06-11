import 'package:flutter/material.dart';

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

void main() {
  runApp(MaterialApp(
    home: MessagesScreen(),
  ));
}
