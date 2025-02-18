import 'package:flutter/material.dart';

class PeoplesItemWidgetGridview extends StatelessWidget {
  const PeoplesItemWidgetGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
              ),
              SizedBox(height: 10),
              Text(
                'Christofer Vetroves',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'UI/UX Designer',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.call, color: Colors.grey),
                  SizedBox(width: 10),
                  Text('+44 32 821 0273 0')
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.email, color: Colors.grey),
                  SizedBox(width: 10),
                  Text('HSETECHNO@Gmail.com')
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.web, color: Colors.grey),
                  SizedBox(width: 10),
                  Text('https://hse13278.com')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
