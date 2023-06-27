import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'customers_page.dart';

class CustomersLayoutPage extends StatefulWidget {
  const CustomersLayoutPage({Key? key}) : super(key: key);

  @override
  State<CustomersLayoutPage> createState() => _CustomersLayoutPageState();
}

class _CustomersLayoutPageState extends State<CustomersLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e1e2d),
      body: Row(
        children: [
          Container(
            width: Adaptive.px(70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.menu_rounded, color: Colors.white),
                Icon(Icons.calculate_rounded, color: Colors.white),
                Icon(Icons.sell_rounded, color: Colors.white),
                Icon(Icons.check_box_outline_blank_rounded,
                    color: Colors.white),
                Icon(Icons.people, color: Colors.white),
                Icon(Icons.article_rounded, color: Colors.white),
                Icon(Icons.settings, color: Colors.white),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50))),
              child: CustomersPage(),
            ),
          )
        ],
      ),
    );
  }
}
