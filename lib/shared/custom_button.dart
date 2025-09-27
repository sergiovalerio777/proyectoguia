import 'package:flutter/material.dart';

enum CustomButtonType { primary, outline }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.textButton,
    this.onPressed,
    this.colorText,
    this.type = CustomButtonType.primary,
    this.withShadow = false,
    this.iconLeft,
    this.height,
    this.width,
  });

  final void Function()? onPressed;
  final String textButton;
  final Color? colorText;
  final CustomButtonType type;
  final bool withShadow;
  final Icon? iconLeft;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final isPrimary = type == CustomButtonType.primary;
    return SizedBox(
      height: height,
      width: width,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow:
              withShadow && onPressed != null
                  ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                  : [],
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: isPrimary ? Colors.deepOrange : Colors.black,
            side: isPrimary ? null : BorderSide(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  if (iconLeft != null) ...[iconLeft!],
                  SizedBox(width: 10),
                  Text(
                    textButton,
                    style: TextStyle(
                      color:
                          colorText ??
                          (isPrimary ? Colors.white : Colors.white),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
