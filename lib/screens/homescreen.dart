import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaion/providers/infoprovider.dart';
import 'package:vaion/widgets/currentsymptomswidget.dart';
import '../consts/consts.dart';
import '../widgets/personalinfowidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
                ElevatedButton(
                  onPressed: () {
                    value.patientFormKey.currentState!.validate();
                    value.currentsymptomsFormKey.currentState!.validate();
                  },
                  child: const Text('Send '),
                ),
                // Material(
                //   borderRadius:
                //       BorderRadius.circular(Consts.defaultBorderRadius),
                //   color: Colors.red,
                //   child: InkWell(
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text("Send Information"),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
