import 'package:flutter/material.dart';

void main() {
  runApp(GymApp());
}

class GymApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Classes',
      home: GymClassList(),
    );
  }
}

class GymClassList extends StatelessWidget {
  final List<Map<String, String>> classes = [
    {'class': 'Yoga', 'schedule': 'Monday – 8:00 AM'},
    {'class': 'Zumba', 'schedule': 'Wednesday – 6:00 PM'},
    {'class': 'Pilates', 'schedule': 'Friday – 7:00 AM'},
    {'class': 'Spin Class', 'schedule': 'Saturday – 9:00 AM'},
  ];

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Fitness Classes'),
      ),
      body: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index) {
          final className = classes[index]['class']!;
          final schedule = classes[index]['schedule']!;

          return ListTile(
            leading: Icon(Icons.fitness_center),
            title: Text(className),
            subtitle: Text(schedule),
            trailing: ElevatedButton(
              child: Text('Book'),
              onPressed: () {
                _showSnackBar(context, 'You booked $className class!');
              },
            ),
            onTap: () {
              _showSnackBar(context, 'You selected $className – ${schedule.replaceAll('–', 'at')}');
            },
          );
        },
      ),
    );
  }
}
		
	