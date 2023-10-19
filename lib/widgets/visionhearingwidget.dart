import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class VisionHearingWidget extends StatelessWidget {
  const VisionHearingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final question1 = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.visionhearingFormKey,
        child: InfoCardWidget(
          cardname: 'Vision and Hearing :',
          child: InputWidget(
            textEditingController: question1,
            labelText:
                'Do you wear corrective lenses or hearing aids? Are you experiencing any changes in vision or hearing?',
            validator: RequiredValidator(
              errorText: 'Answer Required',
            ),
            textInputType: TextInputType.text,
            onChanged: (q1) {
              value.visionhearingQ1 = q1;
            },
          ),
        ),
      ),
    );
  }
}
