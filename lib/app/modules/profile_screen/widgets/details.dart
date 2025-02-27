// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:partner_hub/app/api.dart';
import 'package:partner_hub/app/models/models/mobile_phones_model.dart';
import 'package:partner_hub/app/modules/profile_screen/controllers/profile_screen_controller.dart';
import 'package:partner_hub/app/modules/profile_screen/model/order_model.dart';
import 'package:partner_hub/app/modules/profile_screen/widgets/profile.dart';
import 'package:partner_hub/app/modules/support_hub/location/controller.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({super.key});

  @override
  State<OrderTrackingPage> createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  final controller = Get.put(ProfileScreenController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildOrderInfo(),
          const SizedBox(height: 16),
          if ((controller.selectedOrder?.counteroffer ?? []).isNotEmpty &&
              controller.selectedOrder?.status == 'In Progress')
            _buildOrdercounterofferStatus(),
          const SizedBox(height: 16),
          if ((controller.selectedOrder?.timeline ?? []).isNotEmpty)
            _buildOrderStatus(),
          const SizedBox(height: 16),
          _buildShipmentDetails(),
          const SizedBox(height: 16),
          _buildModelDetails(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildOrderInfo() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 100,
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order No: ${controller.selectedOrder?.orderNumber ?? 'N/A'}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Order Status: ${controller.selectedOrder?.status ?? 'N/A'}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (controller.selectedOrder?.status != 'booked')
                        TextButton(
                            onPressed: () {
                              _showStatusDialog(
                                  context, controller.selectedOrder!);
                            },
                            child: Text(
                              'Change Order Status',
                              style: TextStyle(color: Colors.blue),
                            ))
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Placed On: ${formatOrderDate(controller.selectedOrder?.createdAt ?? DateTime.now())}',
                          style: TextStyle(color: Colors.grey)),
                      if ((controller.selectedOrder?.counteroffer?.isEmpty ??
                              false) &&
                          controller.selectedOrder?.status == 'In Progress')
                        TextButton(
                            onPressed: () {
                              _showAddcounterOfferDialog(
                                  controller.selectedOrder!);
                            },
                            child: Text(
                              'Add Counter Offer',
                              style: TextStyle(color: Colors.blue),
                            ))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStatus() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 24),
                SizedBox(width: 8),
                Text(
                  'Order Status Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      _showAddStatusDialog(controller.selectedOrder!);
                    },
                    icon: Icon(Icons.add))
              ],
            ),
            const Divider(height: 24, color: Colors.grey),
            _buildTimeline(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdercounterofferStatus() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 24),
                SizedBox(width: 8),
                Text(
                  'Order Counter Offer Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                TextButton(
                    onPressed: () async {
                      await supbaseClient.from('orders').update({
                        'counter_offer': null,
                      }).eq('id', controller.selectedOrder!.id.toString());
                      controller.selectedOrder!.counteroffer = [];
                      setState(() {});
                      controller.update();
                    },
                    child: Text(
                      'Remove',
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ),
            const Divider(height: 24, color: Colors.grey),
            _buildcounterline(),
          ],
        ),
      ),
    );
  }

  Widget _buildcounterline() {
    final List<Map<String, String>> timeline = [];
    for (var status in controller.selectedOrder?.counteroffer ?? []) {
      timeline.add({
        'date': status['date'] ?? '',
        'time': status['time'] ?? '',
        'description': status['description'] ?? '',
        'price': status['price'] ?? '',
      });
    }

    return Column(
      children:
          timeline.map((entry) => _buildTimelineTileCounter(entry)).toList(),
    );
  }

  Widget _buildTimeline() {
    final List<Map<String, String>> timeline = [];
    for (var status in controller.selectedOrder?.timeline ?? []) {
      timeline.add({
        'date': status['date'] ?? '',
        'time': status['time'] ?? '',
        'description': status['description'] ?? '',
        'status': status['status'] ?? '',
      });
    }

    return Column(
      children: timeline.map((entry) => _buildTimelineTile(entry)).toList(),
    );
  }

  Widget _buildTimelineTile(Map<String, String> entry) {
    bool isDelivered = false;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              isDelivered
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isDelivered ? Colors.blue : Colors.grey,
              size: 20,
            ),
            if (entry['status'] != 'Order Pending')
              Container(
                width: 2,
                height: 40,
                color: Colors.grey[300],
              ),
          ],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('${entry['date']} ${entry['time']}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 8),
                  Text(
                    entry['status'] ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isDelivered ? Colors.blue : Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(entry['description']!),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineTileCounter(Map<String, String> entry) {
    bool isDelivered = false;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              isDelivered
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isDelivered ? Colors.blue : Colors.grey,
              size: 20,
            ),
            if (entry['status'] != 'Order Pending')
              Container(
                width: 2,
                height: 40,
                color: Colors.grey[300],
              ),
          ],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('${entry['date']} ${entry['time']}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 8),
                  Spacer(),
                ],
              ),
              const SizedBox(height: 4),
              Text(entry['description']!),
              const SizedBox(height: 16),
            ],
          ),
        ),
        Text(
          '£${entry['price']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 89, color: Colors.blue),
        ),
      ],
    );
  }

  Widget _buildShipmentDetails() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.local_shipping, size: 24),
                SizedBox(width: 8),
                Text(
                  'Other Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            Divider(height: 24, color: Colors.grey),
            Text(
                '${controller.selectedOrder?.firstName ?? 'First Name'} ${controller.selectedOrder?.lastName ?? 'Last Name'}'),
            SizedBox(height: 4),
            Text(controller.selectedOrder?.phone ?? 'No Phone Number Added'),
            SizedBox(height: 4),
            Text(controller.selectedOrder?.street ?? 'No Address Added'),
            SizedBox(height: 12),
            Text(
                'Delivery Method: ${controller.selectedOrder?.deliveryOption ?? 'No Delivery Option Selected'}'),
            Text(
                'Account Name: ${controller.selectedOrder?.accountName ?? 'No Account Name Added'}'),
            Text(
                'Account Number: ${controller.selectedOrder?.accountNumber ?? 'NO Account Number Selected'}'),
            Text(
                'Account Sort Code: ${controller.selectedOrder?.sortCode ?? 'NO Account Sort Code Added'}'),
            SizedBox(height: 4),
            Text(
                'Total Amount to be Paid: £${controller.selectedOrder?.models?.fold<num>(0, (sum, element) => sum + (element.manage_price ?? 0))}.00'),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  Widget _buildModelDetails() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.phone, size: 24),
                SizedBox(width: 8),
                Text(
                  'Model Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            Divider(height: 24, color: Colors.grey),
            ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.shade300,
                    ),
                itemCount: controller.selectedOrder?.models?.length ?? 0,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  MobilePhonesModel model =
                      controller.selectedOrder!.models![index];
                  return Row(
                    children: [
                      Image.network(model.image ?? '', height: 100, width: 100),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  model.name.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '£${model.manage_price ?? 0}.00',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: model.questions?.length ?? 0,
                                itemBuilder: (context, indexx) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          model.questions?[indexx]
                                                  ['question'] ??
                                              'No Question'.toString(),
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Text(
                                        model.questions?[indexx]
                                                ['selected_answer'] ??
                                            'No Answer Selected'.toString(),
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }

  void _showAddStatusDialog(OrderModel order) {
    final reasonController = TextEditingController();
    final titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Status Order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                child: TextField(
                  maxLines: 1,
                  controller: titleController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Status Title',
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 400,
                height: 300,
                child: TextField(
                  maxLines: 9,
                  controller: reasonController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Enter Title reason status',
                  ),
                ),
              ),
            ],
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
                    SnackBar(content: Text('Please enter a status')),
                  );
                  return;
                }
                if (titleController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a title')),
                  );
                  return;
                }
                try {
                  final timeline = (order.timeline)
                          ?.map((e) => e as Map<String, dynamic>)
                          .toList() ??
                      [];

                  timeline.add({
                    "date": DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    "time": DateFormat('HH:mm').format(DateTime.now()),
                    "status": titleController.text,
                    "description": reasonController.text,
                  });

                  await supbaseClient.from('orders').update({
                    'timeline': timeline,
                  }).eq('id', order.id.toString());
                  controller.selectedOrder!.timeline =
                      timeline.map((ele) => ele).toList();
                  await supbaseClient
                      .from('users')
                      .select()
                      .eq('id', controller.selectedOrder!.customerId.toString())
                      .single()
                      .then((value) => {
                            sendcustomEmail(
                                value['email'].toString(),
                                '${controller.selectedOrder!.firstName} ${controller.selectedOrder!.lastName}',
                                reasonController.text)
                          });

                  Get.back();
                  setState(() {});
                  controller.update();
                } on Exception catch (e) {
                  Get.snackbar('Error', 'Failed to add status: $e');
                }
              },
              child: Text('Add Status'),
            ),
          ],
        );
      },
    );
  }

  void _showAddcounterOfferDialog(OrderModel order) {
    final reasonController = TextEditingController();
    final titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Order Counter Offer'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                child: TextField(
                  maxLines: 1,
                  controller: titleController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Offer Price',
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 400,
                height: 300,
                child: TextField(
                  maxLines: 9,
                  controller: reasonController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Enter Offer reason status',
                  ),
                ),
              ),
            ],
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
                if (titleController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a price')),
                  );
                  return;
                }
                try {
                  final counter = (order.counteroffer)
                          ?.map((e) => e as Map<String, dynamic>)
                          .toList() ??
                      [];

                  counter.add({
                    "date": DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    "time": DateFormat('HH:mm').format(DateTime.now()),
                    "price": titleController.text,
                    "description": reasonController.text,
                    'actioned': false
                  });

                  /////////////////////////////////////
                  final timeline = (order.timeline)
                          ?.map((e) => e as Map<String, dynamic>)
                          .toList() ??
                      [];

                  timeline.add({
                    "date": DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    "time": DateFormat('HH:mm').format(DateTime.now()),
                    "status": 'Counter Offer has been created',
                    "description": 'Checkout the offer details',
                  });

                  await supbaseClient.from('orders').update({
                    'counter_offer': counter,
                    'timeline': timeline,
                  }).eq('id', order.id.toString());
                  controller.selectedOrder!.counteroffer =
                      counter.map((ele) => ele).toList();
                  controller.selectedOrder!.timeline =
                      timeline.map((ele) => ele).toList();
                  await supbaseClient
                      .from('users')
                      .select()
                      .eq('id', controller.selectedOrder!.customerId.toString())
                      .single()
                      .then((value) => {
                            sendOrderCounterEmail(
                                email: value['email'].toString(),
                                customerName:
                                    '${controller.selectedOrder!.firstName} ${controller.selectedOrder!.lastName}',
                                issueReason: reasonController.text,
                                offerAmount: double.parse(titleController.text),
                                deviceDetails: '',
                                acceptOfferLink:
                                    'https://trademydevice.co.uk/profile-screen/orders?id=${controller.selectedOrder?.id?? 0}&offerrequest=accept',
                                rejectOfferLink:
                                    'https://trademydevice.co.uk/profile-screen/orders?id=${controller.selectedOrder?.id?? 0}&offerrequest=reject',
                                websiteLink: 'https://trademydevice.co.uk')
                          });

                  Get.back();
                  setState(() {});
                  controller.update();
                } on Exception catch (e) {
                  Get.snackbar('Error', 'Failed to add status: $e');
                }
              },
              child: Text('Add Counter Offer'),
            ),
          ],
        );
      },
    );
  }

  Future<String?> _showStatusDialog(
      BuildContext context, OrderModel order) async {
    final List<String> statusOptions = [
      'Booked',
      'Cancelled',
      'Rejected',
      'Completed',
      'In Progress',
    ];

    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Status'),
          content: SizedBox(
            width: 400,
            height: 500,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns in the grid
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2, // Adjust the aspect ratio for better UI
              ),
              itemCount: statusOptions.length,
              itemBuilder: (context, index) {
                final status = statusOptions[index];
                return MaterialButton(
                  color: getStatusColor(status),
                  onPressed: () async {
                    try {
                      await supbaseClient.from('orders').update({
                        'status': status,
                      }).eq('id', order.id.toString());

                      Navigator.pop(context, status);
                    } on Exception catch (e) {
                      Get.snackbar('Error', 'Failed to Update status: $e');
                    }
// Return the selected status
                  },
                  child: Text(
                    status,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close the dialog
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

Color getStatusColor(String status) {
  switch (status) {
    case 'Cancelled':
      return Colors.orange;
    case 'Rejected':
      return Colors.red;
    case 'Completed':
      return Colors.green;
    case 'In Progress':
      return Colors.blue;
    default:
      return Colors.grey;
  }
}
