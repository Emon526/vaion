import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class MedicalDevicesWidget extends StatelessWidget {
  const MedicalDevicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.medicaldevicesFormKey,
        child: InfoCardWidget(
          cardname: 'Medical Devices :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Are you using any medical devices or equipment at home, such as a CPAP machine or insulin pump?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.medicaldevicesQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
