import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ytech/features/customers/customers_page/data/customers_models/customers_model.dart';
import 'package:ytech/gen/assets.gen.dart';

class CustomerItem extends StatefulWidget {
  final CustomersData? customersData;
  const CustomerItem({Key? key, required this.customersData}) : super(key: key);

  @override
  State<CustomerItem> createState() => _CustomerItemState();
}

class _CustomerItemState extends State<CustomerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adaptive.px(100),
      margin: EdgeInsets.only(bottom: Adaptive.px(5)),
      padding: EdgeInsets.all(Adaptive.px(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: Adaptive.px(70),
            width: Adaptive.px(70),
            child: Stack(
              children: [
                Image.asset(
                  Assets.images.defaultProfilePic.path,
                  fit: BoxFit.cover,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.circle_rounded,
                      size: Adaptive.px(15),
                      color: (widget.customersData?.isActive ?? false)
                          ? Colors.green
                          : Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: Adaptive.px(250),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.customersData?.displayName ?? ''),
                Text((widget.customersData?.isDelivery ?? false)
                    ? "Delivery"
                    : "Not Delivery"),
              ],
            ),
          ),
          SizedBox(
            width: Adaptive.px(350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: Adaptive.px(15),
                    ),
                    Text(widget.customersData?.phoneNumber ?? ''),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.contact_phone_rounded,
                      size: Adaptive.px(15),
                    ),
                    Text(widget.customersData?.address ?? ''),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: Adaptive.px(100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.customersData?.commission.toString() ?? ''),
                Text(widget.customersData?.loyalityBalance.toString() ?? ''),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.mode_edit_rounded,
                size: Adaptive.px(15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
