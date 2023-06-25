import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomizedTextField extends StatefulWidget {
  final String title;
  final Widget titleIcon;
  final bool isSecured;
  final TextEditingController controller;
  const CustomizedTextField(
      {Key? key,
      required this.title,
      required this.controller,
      this.isSecured = false,
      required this.titleIcon})
      : super(key: key);

  @override
  State<CustomizedTextField> createState() => _CustomizedTextFieldState();
}

class _CustomizedTextFieldState extends State<CustomizedTextField> {
  Color iconColor = Colors.grey;
  bool isShown = false;
  toggleEyeColor() {
    if (iconColor == Colors.grey) {
      setState(() {
        iconColor = Colors.blue;
        isShown = true;
      });
    } else {
      setState(() {
        iconColor = Colors.grey;
        isShown = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: Adaptive.px(10),
            ),
            widget.titleIcon,
            SizedBox(
              width: Adaptive.px(5),
            ),
            Text(widget.title,
                style: TextStyle(
                  fontSize: Adaptive.px(16),
                ),
                textScaleFactor: 1.0),
          ],
        ),
        SizedBox(
          height: Adaptive.px(10),
        ),
        SizedBox(
          width: Adaptive.px(350),
          child: TextFormField(
            obscureText: widget.isSecured ? !isShown : false,
            controller: widget.controller,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: Adaptive.px(30)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Adaptive.px(100)),
                    borderSide: const BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Adaptive.px(100)),
                    borderSide: const BorderSide(color: Colors.transparent)),
                filled: true,
                fillColor: Colors.grey[300],
                suffixIcon: widget.isSecured
                    ? GestureDetector(
                        onTap: toggleEyeColor,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Adaptive.px(25)),
                          child: Icon(
                            Icons.remove_red_eye_rounded,
                            color: iconColor,
                          ),
                        ),
                      )
                    : const SizedBox()),
          ),
        ),
      ],
    );
  }
}
