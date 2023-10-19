import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class RecentStressorsWidget extends StatelessWidget {
  const RecentStressorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.recentstressorsFormKey,
        child: InfoCardWidget(
          cardname: 'Recent Stressors :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Are there any recent stressful events or changes in your life that you would like to mention?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.recentstressorsQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
