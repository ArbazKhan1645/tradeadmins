import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:partner_hub/app/common_widgets/common_widgets.dart';

class MyImageWidget extends StatelessWidget {
  final String imageUrl;
  final String placeholderImagePath = 'images/logo.png';

  const MyImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return OneTimeFutureBuilder(
      futureFunction: () => controlImage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return _buildErrorWidget();
        } else {
          return snapshot.data ?? Container();
        }
      },
    );
  }

  Future<Widget> controlImage() async {
    try {
      http.Response response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
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
          ),
        );
      } else {
        return _buildErrorWidget();
      }
    } catch (e) {
      return _buildErrorWidget();
    }
  }

  Widget _buildErrorWidget() {
    return Image.asset(
      placeholderImagePath,
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return const SizedBox(
          child: Center(
            child: Icon(Icons.error_outline, color: Colors.red),
          ),
        );
      },
    );
  }
}
