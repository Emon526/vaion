import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class LifestyleHabitsWidget extends StatelessWidget {
  const LifestyleHabitsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final question1 = TextEditingController();
    final question2 = TextEditingController();
    final question3 = TextEditingController();
    final question4 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.lifestylehabitsFormKey,
        child: InfoCardWidget(
          cardname: 'Lifestyle and Habits :',
          child: Column(
            children: [
              InputWidget(
                textEditingController: question1,
                labelText:
                    'Do you smoke or use tobacco products? If so, how much and how often?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q1) {
                  value.lifestylehabitsQ1 = q1;
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                textEditingController: question2,
                labelText:
                    'Do you consume alcohol? If so, how frequently and in what amounts?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q2) {
                  value.lifestylehabitsQ2 = q2;
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textEditingController: question3,
                labelText: 'Do you exercise regularly?',
                textInputType: TextInputType.text,
                onChanged: (q3) {
                  value.lifestylehabitsQ3 = q3;
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textEditingController: question4,
                labelText: 'What is your typical diet like?',
                textInputType: TextInputType.text,
                onChanged: (q4) {
                  value.lifestylehabitsQ4 = q4;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
