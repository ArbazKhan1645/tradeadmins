import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class NavigationBarWithDropdown extends StatelessWidget {
  const NavigationBarWithDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavItem(
          title: 'Update Profile',
          onTap: () {

          },
        ),


      ],
    );
  }
}

class NavItem extends StatefulWidget {
  final String title;
  final VoidCallback? onTap; // Add onTap property

  const NavItem({
    required this.title,
    this.onTap, // Make onTap optional
    super.key,
  });

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap, // Use the onTap property
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.cabin(
                      color: isHovered ? Colors.pink : Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    isHovered ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: isHovered ? Colors.pink : Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
