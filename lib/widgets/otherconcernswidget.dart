import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class OtherConcernWidget extends StatelessWidget {
  const OtherConcernWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.otherconcernsFormKey,
        child: InfoCardWidget(
          cardname: 'Any Other Specific Concerns :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Is there anything else you believe is important for the doctor to know before your appointment?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.otherconcernsQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
