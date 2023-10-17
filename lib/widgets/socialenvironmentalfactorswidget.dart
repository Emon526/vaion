import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class SocialEnvironmentalFactorsWidget extends StatelessWidget {
  const SocialEnvironmentalFactorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.socialEnvironmentalFactorsFormKey,
        child: InfoCardWidget(
          cardname: 'Social and Environmental Factors :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Do you live or work in an environment that may impact your health (e.g., exposure to pollutants, hazardous materials)?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.socialEnvironmentalFactorsQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
