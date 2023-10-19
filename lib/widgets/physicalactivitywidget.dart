import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class PhysicalActivityWidget extends StatelessWidget {
  const PhysicalActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.physicalactivityFormKey,
        child: InfoCardWidget(
          cardname: 'Mobility and Physical Activity :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Do you have any mobility limitations or engage in regular physical activity or exercise?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.physicalactivityQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
