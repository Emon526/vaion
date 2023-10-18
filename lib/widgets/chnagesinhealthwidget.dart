import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class ChangesInHealthWidget extends StatelessWidget {
  const ChangesInHealthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.changesinhealthFormKey,
        child: InfoCardWidget(
          cardname: 'Changes in Health :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Have there been any significant changes in your health since your last visit to a healthcare provider?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.changesinhealthQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
