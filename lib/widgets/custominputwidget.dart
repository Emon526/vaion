import 'package:flutter/material.dart';

import '../consts/consts.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final TextInputAction? textInputAction;
  final TextInputType textInputType;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final String? Function(String?) validator;
  final bool? readOnly;

  const InputWidget({
    super.key,
    required this.textEditingController,
    required this.labelText,
    this.textInputAction,
    required this.textInputType,
    required this.onChanged,
    required this.validator,
    this.onFieldSubmitted,
    this.onTap,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      validator: validator,
      controller: textEditingController,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        // labelStyle: const TextStyle(color: Consts.primaryColor),
        // enabledBorder: const OutlineInputBorder(
        //     borderSide: BorderSide(color: Consts.primaryColor)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Consts.primaryColor)),
      ),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
    );
  }
}
