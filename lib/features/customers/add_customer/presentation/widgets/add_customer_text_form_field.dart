import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddCustomerTextFormField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Widget? suffixIcon;
  final bool needValidation;
  const AddCustomerTextFormField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.suffixIcon,
    this.needValidation = false,
  }) : super(key: key);

  @override
  State<AddCustomerTextFormField> createState() =>
      _AddCustomerTextFormFieldState();
}

class _AddCustomerTextFormFieldState extends State<AddCustomerTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Adaptive.px(15)),
      width: Adaptive.px(240),
      child: TextFormField(
        validator: (value) {
          if ((value == null || value.isEmpty) && widget.needValidation) {
            return "required";
          }
          return null;
        },
        controller: widget.textEditingController,
        decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.suffixIcon ?? const SizedBox()),
      ),
    );
  }
}
