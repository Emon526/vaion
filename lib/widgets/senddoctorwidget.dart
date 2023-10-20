// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:vaion/utils/utils.dart';

import '../providers/infoprovider.dart';
import 'custominputwidget.dart';
import 'customsnackbar.dart';
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

Lifestyle and Habits:
Do you smoke or use tobacco products? If so, how much and how often? ${value.lifestylehabitsQ1}
Do you consume alcohol? If so, how frequently and in what amounts? ${value.lifestylehabitsQ2}
Do you exercise regularly? ${value.lifestylehabitsQ3}
What is your typical diet like? ${value.lifestylehabitsQ4}

Family Medical History:
Does your immediate family have a history of specific medical conditions (e.g., heart disease, cancer)? ${value.familyMedicalHistroryQ1}

Travel History:
Have you traveled outside of Ontario or internationally in the past few weeks? ${value.travelHistoryQ1}
If yes, where and when? ${value.travelHistoryQ2}

Social and Environmental Factors:
Do you live or work in an environment that may impact your health (e.g., exposure to pollutants, hazardous materials)? ${value.socialEnvironmentalFactorsQ1}

Insurance Information:
Do you have health insurance coverage? If so, what is your policy information? ${value.insuranceInformationQ1}

Gender Identity:
What is your gender identity? (Options may include male, female, transgender, non-binary, prefer not to say, or a space for self-identification. ${value.genderIdentityQ1}

Previous Medical Tests:
Have you had any recent medical tests or imaging studies (e.g., X-rays, blood tests)? ${value.previousmedicaltestQ1}
If so, please provide details and results if available. ${value.previousmedicaltestQ2}

Primary Concern:
What is your primary reason for seeking medical attention today? ${value.primaryconcernQ1}
Are there any specific concerns or questions you would like to address during this visit? ${value.primaryconcernQ2}

Medication History:
Are you currently taking over-the-counter medications, herbal supplements, or vitamins? ${value.medicationhistoryQ1}
Have you recently started or stopped any medications? ${value.medicationhistoryQ2}

Pain Scale:
On a scale from 0 to 10, with 0 being no pain and 10 being the worst pain imaginable, how would you rate the severity of any pain you're experiencing? ${value.painscaleQ1}

Changes in Health:
Have there been any significant changes in your health since your last visit to a healthcare provider? ${value.changesinhealthQ1}

Menstrual History:
For individuals with menstrual cycles: When was your last menstrual period, and is it regular? ${value.menstrualhistoryQ1}

Recent Injuries or Trauma:
Have you experienced any recent injuries, accidents, or trauma? ${value.recentinjuriesQ1}

Mental Health:
Are you currently experiencing any mental health concerns, such as anxiety or depression? ${value.mentalhealthQ1}

Contraception:
If relevant, are you using any form of contraception or family planning methods? ${value.contraceptionQ1}

Dietary Restrictions:
Do you have any dietary restrictions or specific dietary preferences? ${value.dietaryrestrictionsQ1}

Sleep Patterns:
How is your sleep quality and duration? Are you experiencing any sleep disturbances? ${value.sleeppatternsQ1}

Mobility and Physical Activity:
Do you have any mobility limitations or engage in regular physical activity or exercise? ${value.physicalactivityQ1}

Medical Devices:
Are you using any medical devices or equipment at home, such as a CPAP machine or insulin pump? ${value.medicaldevicesQ1}

Vision and Hearing:
Do you wear corrective lenses or hearing aids? Are you experiencing any changes in vision or hearing? ${value.visionhearingQ1}

Supplements and Herbal Remedies:
Are you currently taking any dietary supplements, herbal remedies, or alternative treatments? ${value.supplementsherbalremediesQ1}

Sexual Healt :
Are there any sexual health concerns or questions you would like to discuss? ${value.sexualhealthQ1}

Substance Use:
Do you use recreational drugs or have a history of substance abuse? ${value.substanceuseQ1}

Mental Health History:
Have you been diagnosed with any mental health conditions in the past? ${value.mentalhealthhistoryQ1}

Recent Stressors:
Are there any recent stressful events or changes in your life that you would like to mention? ${value.recentstressorsQ1}

Any Other Specific Concerns:
Is there anything else you believe is important for the doctor to know before your appointment? ${value.otherconcernsQ1}
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
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (value.senddoctoremailFormKey.currentState!.validate()) {
                      try {
                        await Utils(context).sendEmail(
                          subject: value.patientName,
                          fromemail: value.patientemail,
                          toemail: doctoremailController.text,
                          body: createPatientInformationText(value),
                        );

                        Navigator.pop(context);
                        CustomSnackbar.show(
                            context: context,
                            snackbarColor: Colors.green,
                            message: 'Email Send Successfully');
                        // Navigator.pop(context);
                      } catch (e) {
                        CustomSnackbar.show(
                            context: context,
                            snackbarColor: Colors.red,
                            message: 'Email Send Failed');
                        print(e.toString());
                      }
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


 //   String? encodeQueryParameters(
                      //       Map<String, String> params) {
                      //     return params.entries
                      //         .map((MapEntry<String, String> e) =>
                      //             '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                      //         .join('&');
                      //   }

                      //   final Uri emailLaunchUri = Uri(
                      //     scheme: 'mailto',
                      //     path: doctoremailController.text,
                      //     query: encodeQueryParameters(<String, String>{
                      //       'subject': value.patientName,
                      //       'body': createPatientInformationText(value),
                      //     }),
                      //   );

                      //   try {
                      //     // await launchUrl(emailLaunchUri).then((value) =>
                      //     //     CustomSnackbar.show(
                      //     //         context: context,
                      //     //         snackbarColor: Colors.green,
                      //     //         message: 'Email Sent'));
                      //   } catch (e) {
                      //     CustomSnackbar.show(
                      //         context: context,
                      //         snackbarColor: Colors.red,
                      //         message: 'Send Failed');
                      //     print(e.toString());
                      //   }
                      // }