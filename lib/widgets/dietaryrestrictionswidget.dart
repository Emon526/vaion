import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class DietaryRestrictionsWidget extends StatelessWidget {
  const DietaryRestrictionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.dietaryrestrictionsFormKey,
        child: InfoCardWidget(
          cardname: 'Dietary Restrictions :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Do you have any dietary restrictions or specific dietary preferences?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.dietaryrestrictionsQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
