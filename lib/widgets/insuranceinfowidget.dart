// ignore: file_names
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class InsuranceInformationWidget extends StatelessWidget {
  const InsuranceInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.isnsuranceInformationFormKey,
        child: InfoCardWidget(
          cardname: 'Insurance Information :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Do you have health insurance coverage? If so, what is your policy information?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.insuranceInformationQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
