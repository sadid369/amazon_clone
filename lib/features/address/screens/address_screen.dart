// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/address/services/address_services.dart';
import 'package:amazon_clone/features/cart/screens/cart_screen.dart';
import 'package:amazon_clone/home/screens/home_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final String totalAmount;
  AddressScreen({Key? key, required this.totalAmount}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _addressFromKey = GlobalKey<FormState>();
  String addressToBeUsed = "";
  List<PaymentItem> paymentItems = [];
  AddressServices addressServices = AddressServices();
  @override
  void initState() {
    super.initState();
    paymentItems.add(PaymentItem(
        amount: widget.totalAmount,
        label: "Total Amount",
        status: PaymentItemStatus.final_price));
  }

  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }

  Future<void> onGooglePayResult(res) async {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveUserAddress(
          context: context, address: addressToBeUsed);
    }
    addressServices.placeOrder(
        context: context,
        address: addressToBeUsed,
        totalSum: double.parse(widget.totalAmount));
  }

  Future<void> payPressed(String addressFromProvider) async {
    addressToBeUsed = "";
    bool isForm = flatBuildingController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        cityController.text.isNotEmpty;
    if (isForm) {
      if (_addressFromKey.currentState!.validate()) {
        addressToBeUsed =
            "${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}";
      } else {
        throw Exception("Please enter all the values!");
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      showSnackBar(context, "Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    // final address = context.watch<UserProvider>().user.address;
    final address = context.watch<UserProvider>().user.address;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              Form(
                key: _addressFromKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: flatBuildingController,
                      hintText: "Flat, House no, Building",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: areaController,
                      hintText: "Ares, Street",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: pincodeController,
                      hintText: "Pincode",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: cityController,
                      hintText: "Town/City",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              GooglePayButton(
                onPressed: () => payPressed(address),
                height: 50,
                width: double.infinity,
                style: GooglePayButtonStyle.black,
                type: GooglePayButtonType.buy,
                paymentConfigurationAsset: 'gpay.json',
                onPaymentResult: onGooglePayResult,
                paymentItems: paymentItems,
                margin: EdgeInsets.only(top: 15),
                loadingIndicator: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await payPressed(address);
                  await onGooglePayResult("");
                },
                child: Text("Pay"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
