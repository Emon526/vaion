import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'cutombutton.dart';

class SendDoctorWidget extends StatelessWidget {
  const SendDoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String createPatientInformationText(value) {
      return '''
Patient Information:
Patient name: ${value.patientName}
Date of Birth: ${value.patientdob}
Address: ${value.patientaddress}
Phone Number: ${value.patientphone}
Email Address: ${value.patientemail}

Current Symptoms:
What symptoms are you experiencing today? ${value.currentSymptomsQ1}
When did these symptoms start? ${value.currentSymptomsQ2}
Have they worsened or improved since they began? ${value.currentSymptomsQ3}

Medical History:
Do you have any chronic medical conditions? (e.g., diabetes, hypertension) ${value.medicalhistoryQ1}
Have you had any surgeries or hospitalizations in the past? ${value.medicalhistoryQ2}
Are you currently taking any medications or supplements? If so, please list them. ${value.medicalhistoryQ3}

Allergies:
Are you allergic to any medications, foods, or environmental factors? ${value.allergiesQ1}
Have you experienced any adverse reactions to medications in the past? ${value.allergiesQ2}

Immunization Status:
Are you up-to-date on your vaccinations? ${value.immunizationstatusQ1}
Have you received any specific vaccines recently? ${value.immunizationstatusQ2}
''';
    }

    final doctoremailController = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Consumer<InfoProvider>(
      builder: (BuildContext context, InfoProvider value, Widget? child) =>
          Form(
        key: value.senddoctoremailFormKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputWidget(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Email Required'),
                  EmailValidator(errorText: 'Enter a valid Email'),
                ]),
                textEditingController: doctoremailController,
                labelText: ' Doctor Email address',
                textInputType: TextInputType.emailAddress,
                // textInputAction: TextInputAction.done,
                onChanged: (value) {
                  // debugPrint(value);
                },
              ),
              SizedBox(height: size.height * 0.02),
              CustomButton(
                  ontap: () async {
                    if (value.senddoctoremailFormKey.currentState!.validate()) {
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((MapEntry<String, String> e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: doctoremailController.text,
                        query: encodeQueryParameters(<String, String>{
                          'subject': value.patientName,
                          'body': createPatientInformationText(value),
                        }),
                      );

                      if (await canLaunchUrl(emailLaunchUri)) {
                        launchUrl(emailLaunchUri);
                      } else {
                        throw Exception("Could not launch $emailLaunchUri");
                      }

                      // try {
                      //   await launchUrl(emailLaunchUri);
                      // } catch (e) {
                      //   print(e.toString());
                      // }
                    }
                  },
                  buttontext: "Send Email")
            ],
          ),
        ),
      ),
    );
  }
}
