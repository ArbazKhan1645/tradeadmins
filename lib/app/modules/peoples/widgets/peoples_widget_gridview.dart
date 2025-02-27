// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/models/models/users_model.dart/customer_models.dart';
import 'package:partner_hub/app/modules/Home/controllers/home_controller.dart';
import 'package:partner_hub/app/modules/profile_screen/controllers/profile_screen_controller.dart';
import 'package:partner_hub/app/routes/app_pages.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class PeoplesItemWidgetGridview extends StatefulWidget {
  const PeoplesItemWidgetGridview({super.key, required this.user});
  final CustomerModel user;

  @override
  State<PeoplesItemWidgetGridview> createState() =>
      _PeoplesItemWidgetGridviewState();
}

class _PeoplesItemWidgetGridviewState extends State<PeoplesItemWidgetGridview> {
  Future<void> _deleteUser(BuildContext context) async {
    final supabase = Supabase.instance.client;

    bool confirmDelete = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete User"),
        content: const Text("Are you sure you want to delete this user?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (confirmDelete) {
      try {
        // Delete user from the database table
        await supabase
            .from('users')
            .delete()
            .match({'id': widget.user.id.toString()});
        setState(() {});

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User deleted successfully!")),
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error deleting user: $error")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('images/trade.jpeg'),
              ),
              const SizedBox(height: 10),
              // Text(
              //   '${widget.user.firstName} ${widget.user.lastName}',
              //   style:
              //       const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              // ),
              const SizedBox(height: 10),
              const Text(
                'Customer User',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.call, color: Colors.grey),
                  const SizedBox(width: 10),
                  Text(widget.user.phone.toString()),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email, color: Colors.grey),
                  const SizedBox(width: 10),
                  Text(widget.user.email.toString()),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.outbond_rounded, color: Colors.grey),
                  TextButton(
                    onPressed: () async {
                      await Get.put(ProfileScreenController())
                          .setSelectedCustomer(widget.user);
                      await Get.find<HomeController>()
                          .setselectedDrawerItem('Orders');
                      await Get.find<HomeController>()
                          .setCurrentPageName(Routes.ORDERS_HISTORY);
                    },
                    child: const Text(
                      'View Orders',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () => _deleteUser(context),
                icon: const Icon(Icons.delete, color: Colors.white),
                label: const Text("Delete"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
