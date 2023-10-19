import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../consts/consts.dart';
import '../providers/infoprovider.dart';
import '../utils/utils.dart';
import '../widgets/allergieswidget.dart';
import '../widgets/chnagesinhealthwidget.dart';
import '../widgets/contraceptionwidget.dart';
import '../widgets/currentsymptomswidget.dart';
import '../widgets/customsnackbar.dart';
import '../widgets/cutombutton.dart';
import '../widgets/dietaryrestrictionswidget.dart';
import '../widgets/familymedicalhistorywidget.dart';
import '../widgets/genderidentitywidget.dart';
import '../widgets/immunizationstatuswidget.dart';
import '../widgets/insuranceInfowidget.dart';
import '../widgets/lifestylehabitswidget.dart';
import '../widgets/medicaldeviceswidget.dart';
import '../widgets/medicalhistorywidget.dart';
import '../widgets/medicationhistorywidget.dart';
import '../widgets/menstrualhistorywidget.dart';
import '../widgets/mentalhealthhistorywidget.dart';
import '../widgets/mentalhealthwidget.dart';
import '../widgets/otherconcernswidget.dart';
import '../widgets/painscalewidget.dart';
import '../widgets/personalinfowidget.dart';
import '../widgets/physicalactivitywidget.dart';
import '../widgets/previousmedicaltestwidget.dart';
import '../widgets/primaryconcernwidget.dart';
import '../widgets/recentinjurieswidget.dart';
import '../widgets/recentstressorswidget.dart';
import '../widgets/senddoctorwidget.dart';
import '../widgets/sexualhealthwidget.dart';
import '../widgets/sleeppatternswidget.dart';
import '../widgets/socialenvironmentalfactorswidget.dart';
import '../widgets/substanceusewidget.dart';
import '../widgets/supplementsherbalremedieswidget.dart';
import '../widgets/travelhistorywidget.dart';
import '../widgets/visionhearingwidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return await Utils(context)
            .onWillPop(); // Allow popping the current route
      },
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Consts.primaryColor,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          backgroundColor: const Color(0xFF38ACDB),
          title: const Text(Consts.appName),
        ),
        body: Consumer<InfoProvider>(
          builder: (BuildContext context, InfoProvider value, Widget? child) =>
              SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PersonalInfoWidget(),
                  SizedBox(height: size.height * 0.02),
                  const CurrentSymptomsWidget(),
                  SizedBox(height: size.height * 0.02),
                  const MedicalHistoryWidget(),
                  SizedBox(height: size.height * 0.02),
                  const AllergiesWidget(),
                  SizedBox(height: size.height * 0.02),
                  const ImmunizationStatusWidget(),
                  SizedBox(height: size.height * 0.02),
                  const LifestyleHabitsWidget(),
                  SizedBox(height: size.height * 0.02),
                  const FamilyMedicalHistoryWidget(),
                  SizedBox(height: size.height * 0.02),
                  const TravelHistoryWidget(),
                  SizedBox(height: size.height * 0.02),
                  const SocialEnvironmentalFactorsWidget(),
                  SizedBox(height: size.height * 0.02),
                  const InsuranceInformationWidget(),
                  SizedBox(height: size.height * 0.02),
                  const GenderIdentityWidget(),
                  SizedBox(height: size.height * 0.02),
                  const Text(
                    'Additional Questions',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  const PreviousMedicalTestWidget(),
                  SizedBox(height: size.height * 0.02),
                  const PrimaryConcernWidget(),
                  SizedBox(height: size.height * 0.02),
                  const MedicationHistoryWidget(),
                  SizedBox(height: size.height * 0.02),
                  const PainScaleWidget(),
                  SizedBox(height: size.height * 0.02),
                  const ChangesInHealthWidget(),
                  SizedBox(height: size.height * 0.02),
                  const MenstrualHistoryWidget(),
                  SizedBox(height: size.height * 0.02),
                  const RecentInjuriesWidget(),
                  SizedBox(height: size.height * 0.02),
                  const MentalHealthWidget(),
                  SizedBox(height: size.height * 0.02),
                  const ContraceptionWidget(),
                  SizedBox(height: size.height * 0.02),
                  const DietaryRestrictionsWidget(),
                  SizedBox(height: size.height * 0.02),
                  const SleepPatternsWidget(),
                  SizedBox(height: size.height * 0.02),
                  const PhysicalActivityWidget(),
                  SizedBox(height: size.height * 0.02),
                  const MedicalDevicesWidget(),
                  SizedBox(height: size.height * 0.02),
                  const VisionHearingWidget(),
                  SizedBox(height: size.height * 0.02),
                  const SupplementsHerbalRemediesWidget(),
                  SizedBox(height: size.height * 0.02),
                  const SexualHealthWidget(),
                  SizedBox(height: size.height * 0.02),
                  const SubstanceUseWidget(),
                  SizedBox(height: size.height * 0.02),
                  const MentalHealthHistoryWidget(),
                  SizedBox(height: size.height * 0.02),
                  const RecentStressorsWidget(),
                  SizedBox(height: size.height * 0.02),
                  const OtherConcernWidget(),
                  SizedBox(height: size.height * 0.02),
                  CustomButton(
                      ontap: () {
                        if (value.patientFormKey.currentState!.validate() &&
                            value.currentsymptomsFormKey.currentState!
                                .validate() &&
                            value.medicalHistoryFormKey.currentState!
                                .validate() &&
                            value.allergiesFormKey.currentState!.validate() &&
                            value.immunizationstatusFormKey.currentState!
                                .validate() &&
                            value.lifestylehabitsFormKey.currentState!
                                .validate() &&
                            value.familyMedicalHistroryFormKey.currentState!
                                .validate() &&
                            value.travelHistoryFormKey.currentState!
                                .validate() &&
                            value
                                .socialEnvironmentalFactorsFormKey.currentState!
                                .validate() &&
                            value.isnsuranceInformationFormKey.currentState!
                                .validate() &&
                            value.genderIdentityFormKey.currentState!
                                .validate() &&
                            value.previousmedicaltestFormKey.currentState!
                                .validate() &&
                            value.primaryconcernFormKey.currentState!
                                .validate() &&
                            value.medicationhistoryFormKey.currentState!
                                .validate() &&
                            value.painscaleFormKey.currentState!.validate() &&
                            value.changesinhealthFormKey.currentState!
                                .validate() &&
                            value.menstrualhistoryFormKey.currentState!
                                .validate() &&
                            value.recentinjuriesFormKey.currentState!
                                .validate() &&
                            value.mentalhealthFormKey.currentState!
                                .validate() &&
                            value.contraceptionFormKey.currentState!
                                .validate() &&
                            value.dietaryrestrictionsFormKey.currentState!
                                .validate() &&
                            value.sleeppatternsFormKey.currentState!
                                .validate() &&
                            value.physicalactivityFormKey.currentState!
                                .validate() &&
                            value.medicaldevicesFormKey.currentState!
                                .validate() &&
                            value.visionhearingFormKey.currentState!
                                .validate() &&
                            value.supplementsherbalremediesFormKey.currentState!
                                .validate() &&
                            value.sexualhealthFormKey.currentState!
                                .validate() &&
                            value.substanceuseFormKey.currentState!
                                .validate() &&
                            value.mentalhealthhistoryFormKey.currentState!
                                .validate() &&
                            value.recentstressorsFormKey.currentState!
                                .validate() &&
                            value.otherconcernsFormKey.currentState!
                                .validate()) {
                          Utils(context).showCustomDialog(
                            child: const SendDoctorWidget(),
                          );
                        } else {
                          CustomSnackbar.show(
                              context: context,
                              snackbarColor: Colors.red,
                              message: 'Please Input All Fields');
                        }
                      },
                      buttontext: "Send Information to Doctor"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
