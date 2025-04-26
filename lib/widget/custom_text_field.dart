import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatefulWidget {
  final String? value;
  final String? labelText;
  final IconData? prefixIcon;
  final void Function(String val)? onChanged;
  final bool readOnly;
  final TextInputType? keyboard;
  final bool obscureText;
  final int minLines;

  const CustomTextField({
    super.key,
    required this.value,
    this.labelText,
    this.prefixIcon,
    this.readOnly = false,
    this.onChanged,
    this.keyboard,
    this.obscureText = false, this.minLines =1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value ?? "");
  }

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value && controller.text != widget.value) {
      controller.text = widget.value ?? "";
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: controller,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboard,
      minLines: widget.minLines,
      maxLines: widget.minLines+1,
      style: TextStyle(fontSize: 16.sp),
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(fontSize: 16.sp),
        prefixIcon:widget.prefixIcon != null ? Icon(widget.prefixIcon, size: 22.sp) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(3.w)),
      ),
    );
  }
}
