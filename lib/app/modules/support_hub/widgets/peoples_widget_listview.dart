import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/services/fetch_supabase.dart';
import '../../../models/models/mobile_phones_model.dart';
import '../controllers/support_hub_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LocationsItemWidgetListview extends StatelessWidget {
  const LocationsItemWidgetListview(
      {super.key,
      required this.location,
      required this.controller,
      required this.countryname,
      required this.index});

  final MobilePhonesModel location;
  final bool index;

  final SupportHubController controller;
  final String countryname;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        final bool isSmallScreen = screenWidth <= 800;

        return Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isSmallScreen ? 250 : 115,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                    width: index ? 2 : 1,
                    color: index ? Color(0xff5E85CC) : Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 30),
                  buildPartnerLogo(location.image.toString(), isSmallScreen),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                location.name.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                maxLines: 1,
                                minFontSize: 14,
                              ),

                              // AutoSizeText(
                              //   '${location.city.toString()} - $countryname',
                              //   style: TextStyle(
                              //     color: Colors.grey,
                              //     fontWeight: FontWeight.w500,
                              //   ),
                              //   maxLines: 1,
                              //   minFontSize: 12,
                              // ),
                            ],
                          ),
                        ),
                        if (!isSmallScreen)
                          Expanded(
                            flex: 8,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Merchant Name',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      AutoSizeText(
                                        'phones',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                        ),
                                        maxLines: 1,
                                        minFontSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Brand',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      AutoSizeText(
                                        'Realme',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                        ),
                                        maxLines: 1,
                                        minFontSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  'Questions',
                                  style: TextStyle(color: Color(0xff5E85CC)),
                                ),
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: index
                                      ? Color(0xff5E85CC)
                                      : Colors.transparent,
                                  child: Center(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            index
                                                ? Icons.arrow_downward
                                                : Icons
                                                    .arrow_forward_ios_rounded,
                                            color: index
                                                ? Colors.white
                                                : Color(0xff5E85CC),
                                            size: 30)),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 12),
                                  child: Container(
                                      width: 4, color: Colors.grey.shade100),
                                ),
                                SizedBox(width: 10),
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return DeleteProductDialog(
                                            productName:
                                                location.name.toString(),
                                            onDelete: () async {
                                              try {
                                                var con = Get.find<
                                                    SupportHubController>();
                                                await supbaseClient
                                                    .from('phones_models')
                                                    .delete()
                                                    .eq('id', location.id ?? 0);
                                                con.initializedData();
                                                return true;
                                              } on Exception catch (e) {
                                                return false;
                                              }
                                            },
                                            onResult: (bool result) {
                                              if (result) {
                                                showError(
                                                  "Deletion Successfully",
                                                  "product delete sucessfull",
                                                );
                                              } else {
                                                showError(
                                                  "Deletion Failed",
                                                  "product delete failed",
                                                );
                                              }
                                            },
                                            onError: (String error) {
                                              showError(
                                                "Deletion Failed Available",
                                                "product delete failed $error",
                                              );
                                            },
                                          );
                                        },
                                      ).then((c) async {
                                        {
                                          var con =
                                              Get.find<SupportHubController>();
                                          return con.initializedData();
                                        }
                                      });
                                    },
                                    icon: Icon(Icons.delete,
                                        color: Color(0xff5E85CC), size: 30)),
                                SizedBox(width: 20),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

void showError(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red[100],
    colorText: Colors.red,
    duration: const Duration(seconds: 2),
    isDismissible: true,
  );
}

Widget buildPartnerLogo(String image, bool isSmallScreen) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isSmallScreen ? 60 : 80,
      height: isSmallScreen ? 60 : 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade100,
      ),
      child: MyImageWidget(
        imageUrl: image,
      ),
    ),
  );
}

class MyImageWidget extends StatelessWidget {
  final String imageUrl;
  final String placeholderImagePath = 'images/logo.png';

  const MyImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty || Uri.tryParse(imageUrl)?.hasAbsolutePath != true) {
      return Image.asset(placeholderImagePath, fit: BoxFit.cover);
    }

    return Center(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          }
        },
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return Image.asset(placeholderImagePath, fit: BoxFit.cover);
        },
      ),
    );
  }
}

class DeleteProductDialog extends StatefulWidget {
  final String productName;
  final Future<bool> Function() onDelete;
  final void Function(bool result) onResult;
  final void Function(String error)? onError;

  const DeleteProductDialog({
    super.key,
    required this.productName,
    required this.onDelete,
    required this.onResult,
    this.onError,
  });

  @override
  _DeleteProductDialogState createState() => _DeleteProductDialogState();
}

class _DeleteProductDialogState extends State<DeleteProductDialog> {
  bool isLoading = false;

  Future<void> _handleDelete() async {
    setState(() {
      isLoading = true;
    });

    try {
      bool result = await widget.onDelete();
      widget.onResult(result);
      if (result) {
        Navigator.pop(context);
      }
    } catch (error) {
      widget.onResult(false);
      String errorMessage = error.toString();
      widget.onError?.call(errorMessage);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Product'),
      content: isLoading
          ? const SizedBox(
              height: 50,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Text('Are you sure you want to delete ${widget.productName}?'),
      actions: isLoading
          ? []
          : [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: _handleDelete,
                child: const Text('Delete'),
              ),
            ],
    );
  }
}
