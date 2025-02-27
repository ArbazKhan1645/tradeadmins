// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/models/models/users_model.dart/customer_models.dart';
import 'package:partner_hub/app/modules/peoples/controllers/peoples_controller.dart';
import 'package:partner_hub/app/modules/peoples/widgets/peoples_widget_gridview.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PeoplesViewBody extends StatefulWidget {
  const PeoplesViewBody({super.key});

  @override
  _PeoplesViewBodyState createState() => _PeoplesViewBodyState();
}

class _PeoplesViewBodyState extends State<PeoplesViewBody> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PeoplesController>(builder: (controller) {
      return ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Customers',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            const Text(
                              'The following are the people who are linked and working',
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value.toLowerCase();
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search People',
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
          ),
          UsersGridView(searchQuery: _searchQuery),
        ],
      );
    });
  }
}
  final supabase = Supabase.instance.client;

class UsersGridView extends StatelessWidget {
  final String searchQuery;
  const UsersGridView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
  

    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: supabase.from('users').stream(primaryKey: ['id']),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No users found'));
        }

        final users = snapshot.data!
            .map((user) => CustomerModel.fromJson(user))
            .where((user) =>
           
                user.roles != 'Admin' &&
                user.email != 'N/A')
            .where((user) =>
                user.firstName.toString().toLowerCase().contains(searchQuery) ||
                user.lastName.toString().toLowerCase().contains(searchQuery) ||
                user.email.toString().toLowerCase().contains(searchQuery))
            .toList();

        return users.isEmpty
            ? const Center(child: Text('No matching users found'))
            : ResponsiveGridView(users: users);
      },
    );
  }
}

class ResponsiveGridView extends StatelessWidget {
  final List<CustomerModel> users;

  const ResponsiveGridView({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount =
        (screenWidth / 350).floor().clamp(2, 6); // Adjust 150 as per item size

    return GridView.builder(
      shrinkWrap: true,
      itemCount: users.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        return PeoplesItemWidgetGridview(user: users[index]);
      },
    );
  }
}
