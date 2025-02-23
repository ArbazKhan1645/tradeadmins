import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/models/models/users_model.dart/customer_models.dart';
import 'package:partner_hub/app/modules/peoples/controllers/peoples_controller.dart';
import 'package:partner_hub/app/modules/peoples/widgets/peoples_widget_gridview.dart';
import 'package:partner_hub/app/modules/stastics_bar/views/stastics_bar_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PeoplesViewBody extends StatelessWidget {
  const PeoplesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PeoplesController>(builder: (controller) {
      return ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
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
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            const Text(
                                'The folloeing are the peoples those are linked working'),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12)),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search Peoples'),
                      ),
                    ),
                    SizedBox(width: 20)
                  ],
                ),
              ),
            ),
          ),
          UsersGridView()
        ],
      );
    });
  }
}

class UsersGridView extends StatelessWidget {
  const UsersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;

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
                user.firstName != 'N/A' &&
                user.lastName != 'N/A' &&
                user.email != 'N/A')
            .toList();

        return GridView.builder(
          shrinkWrap: true,
          itemCount: users.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            CustomerModel user = users[index];
            if (user.firstName == 'N/A') {
              return Container();
            }
            if (user.lastName == 'N/A') {
              return Container();
            }
            if (user.email == 'N/A') {
              return Container();
            }
            return PeoplesItemWidgetGridview(user: user);
          },
        );
      },
    );
  }
}
