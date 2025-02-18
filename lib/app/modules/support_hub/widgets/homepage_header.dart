// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, depend_on_referenced_packages

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner_hub/app/modules/Home/services/current_user_service.dart';
import 'package:partner_hub/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'nav.dart';

class HomePageHeaderWidget extends StatelessWidget {
  const HomePageHeaderWidget({super.key, this.constraints});
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return buildSubHeader(context, constraints: constraints);
  }

  // buildThemeWidget() {
  //   return Row(
  //     children: [
  //       TextButton(
  //           onPressed: () async {
  //             SharedPreferences prefs = await SharedPreferences.getInstance();
  //             prefs.remove('currentuser');
  //             Get.offAndToNamed(Routes.AUTHENTICATION);
  //           },
  //           child: Text('Log Out',
  //               style: defaultTextStyle.copyWith(color: Colors.white))),
  //       const Icon(Icons.logout_outlined, size: 20, color: Colors.white)
  //     ],
  //   );
  // }
}

class HomeTitlesWidget extends StatefulWidget {
  const HomeTitlesWidget(
      {super.key, required this.selectedPageName, required this.isSelected});
  final String selectedPageName;
  final bool isSelected;

  @override
  State<HomeTitlesWidget> createState() => _HomeTitlesWidgetState();
}

class _HomeTitlesWidgetState extends State<HomeTitlesWidget> {
  bool isHovering = false;

  void _onHover(bool hovering) {
    if (isHovering != hovering) {
      setState(() {
        isHovering = hovering;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: _onHover,
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: SizedBox(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.selectedPageName,
                  style: TextStyle(
                    color: widget.isSelected
                        ? const Color(0xff6EB356)
                        : const Color(0xff5D6374),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: widget.isSelected
                      ? const Color(0xff6EB356)
                      : const Color(0xff5D6374),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildSubHeader(BuildContext context, {BoxConstraints? constraints}) {
  return buildWidgetOFScrollHeader(context, constraints: constraints);
}

buildWidgetOFScrollHeader(BuildContext context, {BoxConstraints? constraints}) {
  double getPadding(double width) {
    if (width >= 1200) {
      return 150.0; // Large screen
    } else if (width >= 800) {
      return 50.0; // Medium screen
    } else {
      return 0.0; // Small screen
    }
  }

  double padding =
      getPadding(constraints == null ? 1200 : constraints.maxWidth);
  var con = Get.isRegistered<UserController>()
      ? Get.find<UserController>()
      : Get.put(UserController());
  return ClipRRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: Color(0xffF5F3FB),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Builder(builder: (context) {
              if (constraints != null) {
                if (constraints.maxWidth >= 1350) {
                  return const AddressInfoToggle(address: 'GlassGow PK');
                } else {
                  return Container();
                }
              }
              return const AddressInfoToggle(address: 'GlassGow PK');
            }),
            SizedBox(width: 10),

            GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey.shade300,
                    child: Center(
                      child: Icon(
                        Icons.account_box_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10), // Updated horizontalSpace with SizedBox
            Builder(builder: (context) {
              Widget widget = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Partner Number', style: defaultTextStyle),
                  Text(con.currentUser!.phone.toString(),
                      style: defaultTextStyle),
                ],
              );
              if (constraints != null) {
                if (constraints.maxWidth >= 600) {
                  return widget;
                } else {
                  return Container();
                }
              }
              return widget;
            }),
            const SizedBox(width: 10), // Updated horizontalSpace with SizedBox

            const SizedBox(width: 10), // Updated horizontalSpace with SizedBox
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                height: 80,
                width: 1,
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(width: 10), // Updated horizontalSpace with SizedBox

            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Center(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications,
                        color: Color(0xff5E85CC), size: 30)),
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Container(width: 4, color: Colors.grey.shade100),
            ),

            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Center(
                child: IconButton(
                    onPressed: () {},
                    icon:
                        Icon(Icons.person, color: Color(0xff5E85CC), size: 30)),
              ),
            ),

            const SizedBox(width: 20), // Updated horizontalSpace with SizedBox

            Builder(builder: (context) {
              Widget widget = GestureDetector(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove('currentuser');
                  Get.offAndToNamed(Routes.AUTHENTICATION);
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff5D4BE3),
                        Color(0xFF5B6CF5),
                        Color(0xFF4379F4)
                      ],
                    ),
                  ),
                  height: 90,
                  width: 80,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Icon(
                              Icons.logout_outlined,
                              size: 30,
                              color: Color(0xff5E85CC),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );

              return widget;
            }),
            // SizedBox(width: padding)
          ],
        ),
      ),
    ),
  );
}

Widget buildDot() {
  return Container(
    margin: const EdgeInsets.all(2.0),
    width: 5,
    height: 5,
    decoration: const BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
    ),
  );
}

Widget buildNavigationMenu(BuildContext context) {
  if (MediaQuery.of(context).size.width < 1000) {
    return const SizedBox.shrink();
  }
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: _menuItems.map((item) {
      bool isSelected = item == 'Home';
      return HomeTitlesWidget(selectedPageName: item, isSelected: isSelected);
    }).toList(),
  );
}

const List<String> _menuItems = ['Home', 'Menu', 'Contact', 'My Account'];

Widget buildActionIcons() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _buildIconWithLabel(
        icon: Icons.favorite_border_outlined,
        label: 'WishList',
      ),
      const SizedBox(width: 10),
      _buildIconWithLabel(
        icon: Icons.shopping_basket_outlined,
        label: 'My Cart',
        additionalText: '£23.98',
        additionalTextColor: const Color(0xff6EB356),
      ),
    ],
  );
}

Widget _buildIconWithLabel(
    {required IconData icon,
    required String label,
    String? additionalText,
    Color? additionalTextColor}) {
  return Row(
    children: [
      IconButton(
        onPressed: () {},
        icon: Icon(icon, color: const Color(0xff5D6374), size: 20),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label,
              style: const TextStyle(
                  color: Color(0xff5D6374),
                  fontWeight: FontWeight.w400,
                  fontSize: 16)),
          if (additionalText != null)
            Text(
              additionalText,
              style: TextStyle(
                  color: additionalTextColor ?? const Color(0xff5D6374),
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
        ],
      ),
    ],
  );
}

class AddressInfoToggle extends StatefulWidget {
  final String address;

  const AddressInfoToggle({super.key, required this.address});

  @override
  _AddressInfoToggleState createState() => _AddressInfoToggleState();
}

class _AddressInfoToggleState extends State<AddressInfoToggle> {
  final bool _isDelivery = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: NavigationBarWithDropdown(),
      ),
    );
  }

  Widget _buildToggleButton({
    required String text,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon,
                      color:
                          isSelected ? const Color(0xFF00CCBC) : Colors.grey),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Great",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Row(
          children: List.generate(5, (index) {
            return Container(
              margin: const EdgeInsets.only(right: 4),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: index == 4 ? Colors.white : Colors.green,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(
                Icons.star,
                size: 16,
                color: index == 4 ? Colors.grey : Colors.white, // Star color
              ),
            );
          }),
        ),
      ],
    );
  }
}

TextStyle defaultTextStyle = GoogleFonts.cabin(
  fontWeight: FontWeight.w500,
  fontSize: 14,
);
