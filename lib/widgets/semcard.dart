import 'package:flutter/material.dart';

class SemesterCard extends StatefulWidget {
  final String semester;
  final VoidCallback onTap;

  const SemesterCard({
    super.key,
    required this.semester,
    required this.onTap,
  });

  @override
  State<SemesterCard> createState() => _SemesterCardState();
}

class _SemesterCardState extends State<SemesterCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    // Extract semester number (1–8)
    String number = widget.semester.replaceAll(RegExp(r'[^0-9]'), '');

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            isPressed = true;
          });
        },

        onTapUp: (_) {
          setState(() {
            isPressed = false;
          });

          widget.onTap();
        },

        onTapCancel: () {
          setState(() {
            isPressed = false;
          });
        },

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),

          transform: Matrix4.identity()
            ..scale(isPressed ? 0.97 : 1.0),

          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(22),

            border: Border.all(
              color: const Color(0xffE7E2FF),
            ),

            boxShadow: [
              BoxShadow(
                color: isPressed
                    ? const Color(0xff6C63FF).withOpacity(.25)
                    : Colors.black.withOpacity(.05),

                blurRadius: isPressed ? 20 : 10,
                spreadRadius: isPressed ? 2 : 0,
                offset: const Offset(0, 5),
              ),
            ],
          ),

          child: Row(
            children: [

              Container(
                height: 52,
                width: 52,

                decoration: const BoxDecoration(
                  color: Color(0xff6C63FF),
                  shape: BoxShape.circle,
                ),

                child: Center(
                  child: Text(
                    number,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 18),

              Expanded(
                child: Text(
                  widget.semester,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff2D2D2D),
                  ),
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0xff6C63FF),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}