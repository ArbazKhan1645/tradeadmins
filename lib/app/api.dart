import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> sendcustomEmail(
    String email, String name, String message) async {
  print(email);
  print(name);
  print(message);
  final String url =
      "https://trademydevice.pythonanywhere.com/send-custom-message";

  final client = http.Client();
  try {
    final response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode(
        {
          "email": email,
          'customer_name': name,
          'subject': 'Your Trade My Device Order Status Notification',
          'message':
              'Hello $name,\n\nYour Trade My Device order has been processed. Your order details are as follows:\n\n$message\n\nBest regards,\nTrade My Device Team',
        },
      ),
    );

    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data["message"] ?? "Success";
    } else {
      return "Error: ${response.statusCode} - ${response.reasonPhrase}";
    }
  } catch (e) {
    return "Unexpected error: $e";
  } finally {
    client.close();
  }
}

Future<String> sendOrderRejectionEmail(
    String email, String name, String reason) async {
  final String url =
      "https://trademydevice.pythonanywhere.com/send-order-rejection-email";

  final client = http.Client();
  try {
    final response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({"email": email, "name": name, "reason": reason}),
    );

    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data["message"] ?? "Success";
    } else {
      return "Error: ${response.statusCode} - ${response.reasonPhrase}";
    }
  } catch (e) {
    return "Unexpected error: $e";
  } finally {
    client.close();
  }
}

Future<String> sendOrderCounterEmail({
  required String customerName,
    required String email,
  required String issueReason,
  required double offerAmount,
  required String deviceDetails,
  required String acceptOfferLink,
  required String rejectOfferLink,
  required String websiteLink,
}) async {
  final String url =
      "https://trademydevice.pythonanywhere.com/send-counter-offer-email";

  final client = http.Client();
  try {
    final response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "customer_name": customerName,
        "issue_reason": issueReason,
        "offer_amount": offerAmount,
        "device_details": deviceDetails,
        "accept_offer_link": acceptOfferLink,
        "reject_offer_link": rejectOfferLink,
        "website_link": websiteLink,
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data["message"] ?? "Success";
    } else {
      return "Error: ${response.statusCode} - ${response.reasonPhrase}";
    }
  } catch (e) {
    return "Unexpected error: $e";
  } finally {
    client.close();
  }
}
