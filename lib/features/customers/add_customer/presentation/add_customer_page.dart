import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ytech/core/utils/helper_functions.dart';
import 'package:ytech/features/customers/add_customer/bloc/add_customer_bloc.dart';
import 'package:ytech/features/customers/add_customer/bloc/add_customer_event.dart';
import 'package:ytech/features/customers/add_customer/bloc/add_customer_state.dart';
import 'package:ytech/features/customers/add_customer/data/add_customer_api.dart';
import 'package:ytech/features/customers/add_customer/data/add_customer_models/add_customer_body_model.dart';
import 'package:ytech/features/customers/add_customer/presentation/widgets/add_customer_text_form_field.dart';
import 'package:ytech/gen/assets.gen.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({Key? key}) : super(key: key);

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  final AddCustomerBloc _addCustomerBloc = AddCustomerBloc(DioAddCustomer());
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameArabicController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController commercialRegisterController = TextEditingController();
  TextEditingController firstStoreController = TextEditingController();
  TextEditingController userNameEnglishController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController taxNumberController = TextEditingController();
  TextEditingController customerCategoryNameController =
      TextEditingController();

  addCustomer() {
    if (_formKey.currentState!.validate()) {
      AddCustomerBodyModel addCustomerBodyModel = AddCustomerBodyModel(
        id: "b3417d27-386b-42ab-833c-" + getRandomString(11),
        arFullName: userNameArabicController.text.trim(),
        enFullName: userNameEnglishController.text.trim(),
        cityId: "b3417d27-386b-42ab-833c-" + getRandomString(11),
        phoneNumber: phoneNumberController.text.trim(),
        storeId: "b3417d27-386b-42ab-833c-" + getRandomString(11),
        email: emailController.text.trim(),
        address: addressController.text.trim(),
        commercialRegister: "1222222266",
        isActive: true,
        isDelivery: true,
        commission: 0,
        customerCategoryId: "b3417d27-386b-42ab-833c-" + getRandomString(11),
        taxIdNumber: "123451231214166",
      );
      _addCustomerBloc
          .add(AddEvent(addCustomerBodyModel: addCustomerBodyModel));
    }
  }

  @override
  void dispose() {
    _addCustomerBloc.close();
    userNameArabicController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    commercialRegisterController.dispose();
    firstStoreController.dispose();
    userNameEnglishController.dispose();
    cityController.dispose();
    emailController.dispose();
    taxNumberController.dispose();
    customerCategoryNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _addCustomerBloc,
      child: Container(
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(
            vertical: Adaptive.px(60), horizontal: Adaptive.px(120)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CUSTOMERS',
                  style: TextStyle(fontSize: Adaptive.px(40)),
                ),
              ],
            ),
            SizedBox(
              height: Adaptive.px(20),
            ),
            Row(
              children: [
                BlocConsumer<AddCustomerBloc, AddCustomerState>(
                  listener: (context, state) {
                    if (state is AddCustomerStateLoaded) {
                      showToast(msg: "added successfully", isError: false);
                    }
                    if (state is AddCustomerStateFailure) {
                      showToast(msg: state.message, isError: true);
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AddCustomerTextFormField(
                                        needValidation:
                                            userNameEnglishController
                                                .text.isEmpty,
                                        textEditingController:
                                            userNameArabicController,
                                        hintText: "Customer Name (Arabic)"),
                                    AddCustomerTextFormField(
                                        textEditingController:
                                            addressController,
                                        hintText: "Address"),
                                    AddCustomerTextFormField(
                                        needValidation: true,
                                        textEditingController:
                                            phoneNumberController,
                                        hintText: "Phone Number"),
                                    AddCustomerTextFormField(
                                        textEditingController:
                                            commercialRegisterController,
                                        hintText: "Commercial Register"),
                                    AddCustomerTextFormField(
                                        needValidation: true,
                                        textEditingController:
                                            firstStoreController,
                                        hintText: "First Store",
                                        suffixIcon: Icon(
                                            Icons.arrow_drop_down_rounded)),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AddCustomerTextFormField(
                                        needValidation: userNameArabicController
                                            .text.isEmpty,
                                        textEditingController:
                                            userNameEnglishController,
                                        hintText: "Customer Name (English)"),
                                    AddCustomerTextFormField(
                                        needValidation: true,
                                        textEditingController: cityController,
                                        hintText: "City",
                                        suffixIcon: Icon(
                                            Icons.arrow_drop_down_rounded)),
                                    AddCustomerTextFormField(
                                        textEditingController: emailController,
                                        hintText: "Email"),
                                    AddCustomerTextFormField(
                                        textEditingController:
                                            taxNumberController,
                                        hintText: "TAX Number"),
                                    AddCustomerTextFormField(
                                        textEditingController:
                                            customerCategoryNameController,
                                        hintText: "Customer Category Name",
                                        suffixIcon: Icon(
                                            Icons.arrow_drop_down_rounded)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Adaptive.px(10),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                fillColor: MaterialStateProperty.resolveWith(
                                    (Set states) {
                                  return Colors.green;
                                }),
                                value: true,
                                onChanged: null,
                              ),
                              const Text(
                                "Active",
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Adaptive.px(10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xfff1416c)),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.symmetric(
                                                horizontal: Adaptive.px(40),
                                                vertical: Adaptive.px(20))),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ))),
                                onPressed: () {
                                  addCustomer();
                                },
                                child: Text("SAVE",
                                    style: TextStyle(
                                      fontSize: Adaptive.px(16),
                                    ),
                                    textScaleFactor: 1.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: Adaptive.px(50),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Image.asset(
                    Assets.images.card.path,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
