import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class PrimaryConcernWidget extends StatelessWidget {
  const PrimaryConcernWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final question1 = TextEditingController();
    final question2 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.primaryconcernFormKey,
        child: InfoCardWidget(
          cardname: 'Previous Medical Tests :',
          child: Column(
            children: [
              InputWidget(
                textEditingController: question1,
                labelText:
                    'What is your primary reason for seeking medical attention today?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q1) {
                  value.primaryconcernQ1 = q1;
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                textEditingController: question2,
                labelText:
                    'Are there any specific concerns or questions you would like to address during this visit?',
                validator: RequiredValidator(
                  errorText: 'Answer Required',
                ),
                textInputType: TextInputType.text,
                onChanged: (q2) {
                  value.primaryconcernQ2 = q2;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
