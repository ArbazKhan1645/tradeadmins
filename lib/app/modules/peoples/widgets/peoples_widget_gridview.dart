import 'package:flutter/material.dart';
import 'package:partner_hub/app/models/models/users_model.dart/customer_models.dart';

class PeoplesItemWidgetGridview extends StatelessWidget {
  const PeoplesItemWidgetGridview({super.key, required this.user});
  final CustomerModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('images/trade.jpeg'),
              ),
              SizedBox(height: 10),
              Text(
                '${user.firstName} ${user.lastName}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Customers Users',
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
                  Text(user.phone.toString())
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.email, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(user.email.toString())
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.outbond_rounded, color: Colors.grey),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'View Orders',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
