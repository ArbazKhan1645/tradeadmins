// order_screen.dart
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:partner_hub/app/modules/profile_screen/model/order_model.dart';
import 'package:partner_hub/app/modules/profile_screen/widgets/details.dart';
import 'package:partner_hub/app/modules/support_hub/location/controller.dart';
import 'package:partner_hub/app/modules/support_hub/widgets/homepage_header.dart';

import '../controllers/profile_screen_controller.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final controller = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            height: 120,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (controller.selectedOrder != null)
                      IconButton(
                          onPressed: () {
                            controller.resetBrowserURL();
                            controller.selectedOrder = null;
                            setState(() {});
                          },
                          icon: Icon(Icons.arrow_back_ios, size: 40)),
                    controller.selectedOrder != null
                        ? Text('Order Details',
                            style: defaultTextStyle.copyWith(
                                fontSize: 24, fontWeight: FontWeight.w600))
                        : Text('Order History',
                            style: defaultTextStyle.copyWith(
                                fontSize: 24, fontWeight: FontWeight.w600))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: controller.selectedOrder == null
                ? _buildOrdersList()
                : Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: OrderTrackingPage(),
                  ),
          )
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    final filters = [
      'Current Orders',
      'Pending Orders',
      'Older Orders',
      'Refund Orders'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: filters
          .map((filter) => Obx(() {
                final isSelected = controller.selectedFilter.value == filter;
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: InkWell(
                    onTap: () => controller.changeFilter(filter),
                    child: Text(
                      filter,
                      style: TextStyle(
                        color: isSelected ? Colors.blue : Colors.black87,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        SizedBox(width: 16),
        Text(
          'Order History',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildOrdersList() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: LinearProgressIndicator());
      }

      if (controller.orders.isEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text('No orders found'),
          ),
        );
      }

      return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.orders.length,
        itemBuilder: (context, index) {
          final order = controller.orders[index];
          final isBooked = order.status == 'booked';
          final isCompleted = order.status == 'Completed';
          final inProgress = order.status == 'In Progress';
          final isRejected = order.status == 'Rejected';

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color:
                    getStatusColor(order.status.toString()).withOpacity(0.10),
                border: Border.all(
                    width: isBooked ? 1 : 2,
                    color: getStatusColor(order.status.toString())),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    if (order.models != null)
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(order.models!.first.image!),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Order No: ${order.orderNumber} - ${order.id}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              if (isBooked)
                                Row(
                                  children: [
                                    MaterialButton(
                                      color: Colors.green,
                                      onPressed: () async {
                                        await _updateOrderStatus(
                                          order,
                                          'In Progress',
                                          'Your Order has been Accepted',
                                          'Your Order is in In Progress, We are working on it',
                                        );
                                      },
                                      child: const Text(
                                        'Accept',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    MaterialButton(
                                      color: Colors.red,
                                      onPressed: () =>
                                          _showRejectionDialog(order),
                                      child: const Text(
                                        'Reject',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              TextButton(
                                onPressed: () {
                                  controller.selectedOrder = order;
                                  controller.updateBrowserURL(
                                      controller.selectedOrder?.id.toString() ??
                                          '-1');
                                  setState(() {});
                                },
                                child: Text(
                                  isRejected
                                      ? 'Order has been rejected : View'
                                      : 'View Order Status',
                                  style: TextStyle(
                                    color:
                                        isRejected ? Colors.red : Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Placed On: ${formatOrderDate(order.createdAt ?? DateTime.now())}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Future<void> _updateOrderStatus(
    OrderModel order,
    String status,
    String acceptedDescription,
    String inProgressDescription,
  ) async {
    try {
      final timeline =
          (order.timeline)?.map((e) => e as Map<String, dynamic>).toList() ??
              [];

      timeline.add({
        "date": DateFormat('yyyy-MM-dd').format(DateTime.now()),
        "time": DateFormat('HH:mm').format(DateTime.now()),
        "status": status,
        "description": acceptedDescription,
      });

      if (status == 'In Progress') {
        timeline.add({
          "date": DateFormat('yyyy-MM-dd').format(DateTime.now()),
          "time": DateFormat('HH:mm').format(DateTime.now()),
          "status": "In Progress",
          "description": inProgressDescription,
        });
      }

      await supbaseClient.from('orders').update({
        'timeline': timeline,
        'status': status,
      }).eq('id', order.id.toString());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update order status: $e')),
      );
    }
  }

  void _showRejectionDialog(OrderModel order) {
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Reject Order'),
          content: SizedBox(
            width: 400,
            height: 300,
            child: TextField(
              maxLines: 9,
              controller: reasonController,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade200,
                filled: true,
                hintText: 'Enter reason for rejection',
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (reasonController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a reason')),
                  );
                  return;
                }

                Navigator.pop(context);
                await _updateOrderStatus(
                  order,
                  'Rejected',
                  'Your Order has been Rejected - Reason: ${reasonController.text}',
                  reasonController.text,
                );
              },
              child: Text('Reject'),
            ),
          ],
        );
      },
    );
  }
}

String formatOrderDate(DateTime date) {
  return DateFormat('h:mm a dd MMMM yyyy').format(date);
}
