import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vaion/widgets/allergieswidget.dart';
import 'package:vaion/widgets/medicalhistorywidget.dart';
import '../consts/consts.dart';
import '../providers/infoprovider.dart';
import '../utils/utils.dart';
import '../widgets/currentsymptomswidget.dart';
import '../widgets/cutombutton.dart';
import '../widgets/immunizationstatuswidget.dart';
import '../widgets/lifestylehabitswidget.dart';
import '../widgets/personalinfowidget.dart';
import '../widgets/senddoctorwidget.dart';

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
                  CustomButton(
                      ontap: () {
                        if (value.patientFormKey.currentState!.validate() &&
                            value.currentsymptomsFormKey.currentState!
                                .validate() &&
                            value.medicalHistoryFormKey.currentState!
                                .validate() &&
                            value.allergiesFormKey.currentState!.validate()) {
                          Utils(context).showCustomDialog(
                            child: const SendDoctorWidget(),
                          );
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
