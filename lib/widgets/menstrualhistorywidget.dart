import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class MenstrualHistoryWidget extends StatelessWidget {
  const MenstrualHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.menstrualhistoryFormKey,
        child: InfoCardWidget(
          cardname: 'Menstrual History :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'For individuals with menstrual cycles: When was your last menstrual period, and is it regular?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.menstrualhistoryQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
