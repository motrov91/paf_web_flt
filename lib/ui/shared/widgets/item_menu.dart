import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemMenu extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPressed;

  const ItemMenu(
      {super.key,
      required this.text,
      required this.icon,
      this.isActive = false,
      required this.onPressed});

  @override
  State<ItemMenu> createState() => _ItemMenuState();
}

class _ItemMenuState extends State<ItemMenu> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: widget.isActive 
        ? const EdgeInsets.symmetric(horizontal: 20) 
        : isHovered ? const EdgeInsets.symmetric(horizontal: 20) : const EdgeInsets.symmetric(horizontal: 20),
      decoration: _buildDecoration(),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.isActive ? null : () => widget.onPressed(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: MouseRegion(
              onEnter: ( _ ) => setState(() => isHovered = true ),
              onExit: ( _ ) => setState(() => isHovered = false ),
              child: Row(
                crossAxisAlignment:  CrossAxisAlignment.center,
                children: [
                  Icon(widget.icon, color: widget.isActive 
                        ? Colors.white 
                        : isHovered ? Colors.white : const Color(0xff6d757f)),
                  const SizedBox( width: 10, ),
                  Text(
                    widget.text,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      // color: isHovered ? Colors.white : const Color(0xff6d757f),
                      color: widget.isActive 
                        ? Colors.white 
                        : isHovered ? Colors.white : const Color(0xff6d757f),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() => BoxDecoration(
    color: isHovered 
        ? const Color(0xff3069af) 
        : widget.isActive ? const Color(0xff3069af)  : Colors.transparent,
    borderRadius: BorderRadius.circular(10)
  );
}
