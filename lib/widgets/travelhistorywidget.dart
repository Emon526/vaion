import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class TravelHistoryWidget extends StatelessWidget {
  const TravelHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final question1 = TextEditingController();
    final question2 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.travelHistoryFormKey,
        child: InfoCardWidget(
          cardname: 'Travel History :',
          child: Column(
            children: [
              InputWidget(
                textEditingController: question1,
                labelText:
                    'Have you traveled outside of Ontario or internationally in the past few weeks?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q1) {
                  value.travelHistoryQ1 = q1;
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                textEditingController: question2,
                labelText: 'If yes, where and when?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q2) {
                  value.travelHistoryQ2 = q2;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
