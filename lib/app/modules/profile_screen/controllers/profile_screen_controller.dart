import 'dart:async';

import 'package:get/get.dart';
import 'package:partner_hub/app/models/models/users_model.dart/customer_models.dart';

import 'package:partner_hub/app/modules/support_hub/location/controller.dart';

import '../model/order_model.dart';

class ProfileScreenController extends GetxController {
  CustomerModel? selectedCustomer;
  setSelectedCustomer(CustomerModel? customer) {
    selectedCustomer = customer;
    update();
  }

  final orders = <OrderModel>[].obs;
  final isLoading = true.obs;
  final selectedFilter = 'Current Orders'.obs;
  RxList<OrderModel> filteredOrders =
      <OrderModel>[].obs; // For filtered results

  @override
  void onInit() {
    super.onInit();

    fetchOrders();

    subscribeToOrders();
  }

  OrderModel? selectedOrder;
  setSelectedOrder(OrderModel? order) {
    selectedOrder = order;
    update();
  }

  void fetchOrders() async {
    try {
      isLoading.value = true;
      final response = await supbaseClient.from('orders').select();

      orders.value = response.map((json) => OrderModel.fromJson(json)).toList();
      orders.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      filteredOrders.value = List.from(orders);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch orders: $e');
    } finally {
      fetchupdatedUrls();
      isLoading.value = false;
    }
  }

  StreamSubscription? _orderSubscription;

  void subscribeToOrders() {
    _orderSubscription?.cancel(); // Cancel any existing subscription
    _orderSubscription =
        supbaseClient.from('orders').stream(primaryKey: ['id']).listen(
      (List data) {
        final newOrders =
            data.map((json) => OrderModel.fromJson(json)).toList();
        newOrders.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
        orders.value = newOrders;
        filteredOrders.value = List.from(orders);
      },
      onError: (error) {
        print("Stream error: $error");
        Future.delayed(
            Duration(seconds: 5), subscribeToOrders); // Auto-reconnect
      },
      onDone: () {
        print("Stream closed. Reconnecting...");
        Future.delayed(
            Duration(seconds: 5), subscribeToOrders); // Auto-reconnect
      },
    );
  }

// Call this method when disposing the screen to avoid memory leaks
  void disposeStream() {
    _orderSubscription?.cancel();
  }

  String getStatusFilter() {
    switch (selectedFilter.value) {
      case 'Current Orders':
        return 'current';
      case 'Pending Orders':
        return 'pending';
      case 'Older Orders':
        return 'completed';
      case 'Refund Orders':
        return 'refund';
      default:
        return 'current';
    }
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
    fetchOrders();
  }

  void updateBrowserURL(String id) {
    if (id == '-1') return;
    final queryParams = <String, String>{};
    queryParams['id'] = id;

    final newUrl = Uri(
      path: '/profile-screen/orders',
      queryParameters: queryParams,
    ).toString();

    // html.window.history.pushState(null, '', newUrl);
  }

  void resetBrowserURL() {
    final newUrl = Uri(
      path: '/profile-screen/orders',
    ).toString();

    // html.window.history.pushState(null, '', newUrl);
  }

  fetchupdatedUrls() {
    final uri = Uri.parse(Get.currentRoute);
    _parseQueryParameters(uri.queryParameters);
  }

  void _parseQueryParameters(Map<String, String> params) {
    String? id = params['id'];
    String? offerrequest = params['offerrequest'];
    if (id != null) {
      selectedOrder =
          orders.where((ele) => ele.id.toString() == id).firstOrNull;
      if (selectedOrder == null) {
        resetBrowserURL();
      } else {}

      update();
    }
  }

  void searchOrders(String query) {
    if (query.isEmpty) {
      // If search is cleared, reset to current status filter
      filteredOrders.value = List.from(orders);
      return;
    }

    // Search in all orders
    filteredOrders.value = orders.where((order) {
      // Convert to lowercase for case-insensitive search
      final orderNumber = order.orderNumber?.toLowerCase() ?? '';
      final orderId = order.id?.toString().toLowerCase() ?? '';
      final searchLower = query.toLowerCase();

      return orderNumber.contains(searchLower) || orderId.contains(searchLower);
    }).toList();
  }

  // Method to filter orders by status
  void filterOrdersByStatus(String status) {
    if (status == 'All') {
      filteredOrders.value = List.from(orders);
      return;
    }

    filteredOrders.value =
        orders.where((order) => order.status?.toString() == status).toList();
  }

  // Reset all filters
  void resetFilters() {
    filteredOrders.value = List.from(orders);
    selectedFilter.value = 'Current Orders';
  }

  // Reset search but maintain status filter
  void resetSearch() {
    filterOrdersByStatus(selectedFilter.value);
  }
}
