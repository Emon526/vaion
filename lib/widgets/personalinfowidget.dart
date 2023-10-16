import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'infocardwidget.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fullnameController = TextEditingController();
    final addressController = TextEditingController();
    final dobController = TextEditingController();
    final numberController = TextEditingController();
    final emailController = TextEditingController();

    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.patientFormKey,
        child: InfoCardWidget(
          cardname: 'Patient Information :',
          child: Column(
            children: [
              InputWidget(
                textEditingController: fullnameController,
                labelText: 'Full Name',
                validator: RequiredValidator(
                  errorText: 'Name Required',
                ),
                textInputType: TextInputType.name,
                onChanged: (name) {
                  value.patientName = name;
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                textEditingController: dobController,
                labelText: 'Date of Birth',
                validator: RequiredValidator(
                  errorText: 'Date of Birth Required',
                ),
                textInputType: TextInputType.datetime,
                onChanged: (dob) {
                  value.patientdob = dob;
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                validator: RequiredValidator(
                  errorText: 'Address Required',
                ),
                textEditingController: addressController,
                labelText: 'Address',
                textInputType: TextInputType.text,
                onChanged: (address) {
                  value.patientaddress = address;
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                validator: RequiredValidator(
                  errorText: 'Phone Number Required',
                ),
                textEditingController: numberController,
                labelText: 'Phone Number',
                textInputType: TextInputType.number,
                onChanged: (number) {
                  value.patientphone = number;
                },
              ),
              SizedBox(height: size.height * 0.01),
              InputWidget(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Email Required'),
                  EmailValidator(errorText: 'Enter a valid Email'),
                ]),
                textEditingController: emailController,
                labelText: 'Email address (if applicable)',
                textInputType: TextInputType.emailAddress,
                // textInputAction: TextInputAction.done,
                onChanged: (email) {
                  value.patientemail = email;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
