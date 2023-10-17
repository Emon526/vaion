// ignore: file_names
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class GenderIdentityWidget extends StatelessWidget {
  const GenderIdentityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.genderIdentityFormKey,
        child: InfoCardWidget(
          cardname: 'Gender Identity :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'What is your gender identity? (Options may include male, female, transgender, non-binary, prefer not to say, or a space for self-identification.',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.genderIdentityQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
