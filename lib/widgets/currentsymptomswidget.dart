import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class CurrentSymptomsWidget extends StatelessWidget {
  const CurrentSymptomsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final question1 = TextEditingController();
    final question2 = TextEditingController();
    final question3 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.currentsymptomsFormKey,
        child: InfoCardWidget(
          cardname: 'Current Symptoms :',
          child: Column(
            children: [
              InputWidget(
                textEditingController: question1,
                labelText: 'What symptoms are you experiencing today?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (value) {
                  debugPrint(value);
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                textEditingController: question2,
                labelText: 'When did these symptoms start?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (value) {
                  debugPrint(value);
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textEditingController: question3,
                labelText: 'Have they worsened or improved since they began?',
                textInputType: TextInputType.text,
                onChanged: (value) {
                  debugPrint(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
