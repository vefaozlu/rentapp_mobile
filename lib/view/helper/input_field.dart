import "package:flutter/material.dart";
import "package:rent_app/helper/color_package.dart";

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.width,
    this.validator,
    this.controller,
  });
  final String label;
  final bool isPassword;
  final double? width;
  final bool? validator;
  final TextEditingController? controller;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late String label;
  late bool isPassword;
  late double? width;
  late bool validator;
  late TextEditingController? controller;

  @override
  void initState() {
    label = widget.label;
    isPassword = widget.isPassword;
    width = widget.width;
    validator = widget.validator ?? false;
    controller = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: width ?? size.width * .8,
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: ColorPackage.primaryTextColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: width ?? size.width * .8,
          child: TextFormField(
            controller: controller,
            cursorColor: ColorPackage.secondaryColor,
            obscureText: isPassword,
            validator: (value) {
              if (validator && (value == null || value.isEmpty)) {
                return 'Please enter some text';
              }
              return null;
            },
            style: TextStyle(
              fontSize: 18,
              color: ColorPackage.primaryTextColor,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorPackage.primaryTextColor.withOpacity(.2)),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorPackage.primaryTextColor.withOpacity(.5)),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.withOpacity(.2)),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.withOpacity(.5)),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
