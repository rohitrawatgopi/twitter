import 'package:flutter/material.dart';

class primaryTextForm extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  String hint;
  String label;
  GlobalKey formKey;
  primaryTextForm(
      {super.key,
      required this.textEditingController,
      required this.formKey,
      required this.hint,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        autofocus: true,
        validator: (value) {
          if (value!.isEmpty) {
            return "please fill  " + hint;
          }
        },
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
        ),
      ),
    );
  }
}
