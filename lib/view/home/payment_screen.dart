import "package:flutter/material.dart";
import "package:rent_app/helper/color_package.dart";
import "package:rent_app/view/helper/helper.dart";

enum PaymentAmount { custom, balance, none }

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentAmount _paymentAmount = PaymentAmount.none;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .4,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "250\$",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: ColorPackage.primaryTextColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Due Date:",
                                style: TextStyle(
                                  fontSize: 21,
                                  color: ColorPackage.primaryTextColor,
                                ),
                              ),
                              Text(
                                "01/02/2023",
                                style: TextStyle(
                                  fontSize: 21,
                                  color: ColorPackage.primaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GestureDetector(
                    onTap: () =>
                        setState(() => _paymentAmount = PaymentAmount.balance),
                    child: Container(
                      width: size.width * .9,
                      height: 55,
                      decoration: BoxDecoration(
                        color: ColorPackage.secondaryColor.withOpacity(
                            _paymentAmount == PaymentAmount.balance ? 1 : 0),
                        border: Border.all(
                          color: ColorPackage.primaryTextColor.withOpacity(
                              _paymentAmount == PaymentAmount.balance ? 0 : 1),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Full Balance",
                          style: TextStyle(
                            color: ColorPackage.primaryTextColor,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () =>
                        setState(() => _paymentAmount = PaymentAmount.custom),
                    child: Container(
                      width: size.width * .9,
                      height: 55,
                      decoration: BoxDecoration(
                        color: ColorPackage.secondaryColor.withOpacity(
                            _paymentAmount == PaymentAmount.custom ? 1 : 0),
                        border: Border.all(
                          color: ColorPackage.primaryTextColor.withOpacity(
                              _paymentAmount == PaymentAmount.custom ? 0 : 1),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Custom Amount",
                          style: TextStyle(
                            color: ColorPackage.primaryTextColor,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: size.width * .9,
                    child: TextFormField(
                      enabled: _paymentAmount == PaymentAmount.custom,
                      cursorColor: ColorPackage.secondaryColor,
                      validator: (value) {
                        if (_paymentAmount == PaymentAmount.custom &&
                            (value == null || value.isEmpty)) {
                          return "Please enter amount";
                        }
                      },
                      decoration: InputDecoration(
                        suffix: const Text("\$"),
                        hintText: "Enter Amount",
                        hintStyle: TextStyle(
                          color: ColorPackage.primaryTextColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPackage.primaryTextColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPackage.secondaryColor,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPackage.secondaryTextColor,
                          ),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                          ),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        color: ColorPackage.primaryTextColor,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButtonFilled(
                    size: size,
                    text: "Pay",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButtonOutlined(
                    size: size,
                    text: "Cancel",
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
