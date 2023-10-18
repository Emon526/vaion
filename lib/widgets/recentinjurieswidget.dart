import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class RecentInjuriesWidget extends StatelessWidget {
  const RecentInjuriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.recentinjuriesFormKey,
        child: InfoCardWidget(
          cardname: 'Recent Injuries or Trauma :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Have you experienced any recent injuries, accidents, or trauma?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.recentinjuriesQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
