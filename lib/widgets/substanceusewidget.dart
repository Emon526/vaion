import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class SubstanceUseWidget extends StatelessWidget {
  const SubstanceUseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.substanceuseFormKey,
        child: InfoCardWidget(
          cardname: 'Substance Use :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Do you use recreational drugs or have a history of substance abuse?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.substanceuseQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
