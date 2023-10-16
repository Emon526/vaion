import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../consts/consts.dart';
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
      builder: (BuildContext context, InfoProvider value, Widget? child) {
        showCalender() {
          DateTime date = DateTime.now().subtract(
            const Duration(days: 30),
          );
          return showCupertinoModalPopup<void>(
            context: context,
            barrierDismissible: false,
            barrierColor: Colors.black45,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Consts.defaultBorderRadius),
                ),
                insetPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                backgroundColor: Consts.primaryColor,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(Consts.defaultBorderRadius),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SfDateRangePicker(
                          cancelText: 'Cancel',
                          confirmText: 'Ok',
                          maxDate: date,
                          // onSelectionChanged: (args) {
                          //   value.patientdob = Consts.dateFormat
                          //       .format(DateTime.parse(args.value.toString()));
                          // },
                          onSubmit: (date) {
                            String dob = Consts.dateFormat
                                .format(DateTime.parse(date.toString()));
                            dobController.text = dob;
                            value.patientdob = dob;
                            Navigator.pop(context);
                          },
                          onCancel: () {
                            Navigator.pop(context);
                          },
                          headerStyle: const DateRangePickerHeaderStyle(
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          selectionTextStyle: const TextStyle(
                            color: Consts.primaryColor,
                          ),
                          monthCellStyle: const DateRangePickerMonthCellStyle(
                            todayTextStyle: TextStyle(
                              color: Colors.white,
                            ),
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          yearCellStyle: const DateRangePickerYearCellStyle(
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                            todayTextStyle: TextStyle(
                              color: Consts.primaryColor,
                            ),
                          ),
                          selectionColor: Colors.white,
                          todayHighlightColor: Colors.white,
                          showActionButtons: true,
                          enablePastDates: true,
                          showNavigationArrow: true,
                          selectionMode: DateRangePickerSelectionMode.single,
                          view: DateRangePickerView.month,
                          initialDisplayDate: date,
                          initialSelectedDate: date,
                          navigationDirection:
                              DateRangePickerNavigationDirection.vertical,
                          navigationMode: DateRangePickerNavigationMode.snap,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }

        return Form(
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
                  onFieldSubmitted: (p0) {
                    showCalender();
                  },
                ),
                SizedBox(height: size.height * 0.01),
                InputWidget(
                  readOnly: true,
                  textEditingController: dobController,
                  labelText: 'Date of Birth',
                  validator: RequiredValidator(
                    errorText: 'Date of Birth Required',
                  ),
                  textInputType: TextInputType.datetime,
                  onChanged: (dob) {
                    value.patientdob = dob;
                  },
                  onTap: () => showCalender(),
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
        );
      },
    );
  }
}
