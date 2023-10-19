import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class SexualHealthWidget extends StatelessWidget {
  const SexualHealthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.sexualhealthFormKey,
        child: InfoCardWidget(
          cardname: 'Sexual Health :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Are there any sexual health concerns or questions you would like to discuss?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.sexualhealthQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
