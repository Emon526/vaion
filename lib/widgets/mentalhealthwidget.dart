import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class MentalHealthWidget extends StatelessWidget {
  const MentalHealthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.mentalhealthFormKey,
        child: InfoCardWidget(
          cardname: 'Mental Health :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Are you currently experiencing any mental health concerns, such as anxiety or depression?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.mentalhealthQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
