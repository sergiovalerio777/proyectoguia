import 'package:flutter/material.dart';
import 'package:loginprueba/shared/Formx/formx.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.value,
    required this.onChanged,
    this.isPassword = false,
    this.label,
    this.hintText,
    this.icon,
    this.error,
  });

  final FormxInput<String> value;
  final void Function(FormxInput<String> value) onChanged;
  final bool isPassword;
  final String? label;
  final String? hintText;
  final Icon? icon;
  final String? error;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (widget.icon != null) widget.icon!,
            if (widget.label != null) ...[
              SizedBox(width: 5),
              Text(
                widget.label!,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ],
        ),
        SizedBox(height: 10),
        TextFormField(
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            letterSpacing: widget.isPassword ? 0.5 : 0,
          ),
          obscureText: showPassword ? false : widget.isPassword,
          decoration: InputDecoration(
            hintText: widget.hintText,
            errorText: widget.error,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                        color: widget.error != null ? Colors.red : Colors.grey,
                        size: 24,
                      ),
                      splashRadius: 20,
                      padding: EdgeInsets.zero,
                    )
                    : null,
          ),
          onChanged: (v) {
            widget.onChanged(widget.value.updateValue(v));
          },
        ),
      ],
    );
  }
}
