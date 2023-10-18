import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class ContraceptionWidget extends StatelessWidget {
  const ContraceptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.contraceptionFormKey,
        child: InfoCardWidget(
          cardname: 'Contraception :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'If relevant, are you using any form of contraception or family planning methods?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.contraceptionQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
