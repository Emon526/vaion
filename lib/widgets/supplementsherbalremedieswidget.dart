import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class SupplementsHerbalRemediesWidget extends StatelessWidget {
  const SupplementsHerbalRemediesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.supplementsherbalremediesFormKey,
        child: InfoCardWidget(
          cardname: 'Supplements and Herbal Remedies :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Are you currently taking any dietary supplements, herbal remedies, or alternative treatments?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.supplementsherbalremediesQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
