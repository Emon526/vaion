// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../consts/consts.dart';
import '../widgets/customsnackbar.dart';

class Utils {
  BuildContext context;
  Utils(this.context);
  Size get getScreenSize => MediaQuery.of(context).size;

  onWillPop() async {
    return showCustomDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Are you sure?',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Consts.primaryColor),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Do you want to exit the app?',
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  'No',
                  style: TextStyle(color: Consts.primaryColor),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  'Yes',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future showCustomDialog({required Widget child}) async {
    return await showCupertinoModalPopup(
      barrierDismissible: true,
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Consts.defaultBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.close,
                    color: Consts.primaryColor,
                    size: 20.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future sendEmail({
  //   required String subject,
  //   required String toemail,
  //   required String fromemail,
  //   required String body,
  // }) async {
  //   final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  //   final response = await http.post(
  //     url,

  //     headers: {
  //       'origin': 'http://localhost',
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode({
  //       'service_id': Consts.serviceid,
  //       'template_id': Consts.templateid,
  //       'user_id': Consts.userid,
  //       'template_params': {
  //         'subject': subject,
  //         'body': body,
  //         'toemail': toemail,
  //         'fromemail': fromemail,
  //       }
  //     }),
  //   );
  //   debugPrint(response.body);
  //   log('done');
  //   log(response.body);
  // }

  Future<void> sendEmail({
    required String subject,
    required String toemail,
    required String fromemail,
    required String body,
  }) async {
    final url = Uri.parse(Consts.api);

    final headers = {
      'Content-Type': 'application/json',
      'api-key': Consts.apiKey,
    };

    final emailData = {
      "to": [
        {"email": toemail}
      ],
      "replyTo": {"email": fromemail},
      "subject": subject,
      "textContent": body,
      "sender": {"name": subject, "email": fromemail},
    };

    final emailBody = jsonEncode(emailData);

    final response = await http.post(url, headers: headers, body: emailBody);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202 ||
        response.statusCode == 204) {
      CustomSnackbar.show(
          context: context,
          snackbarColor: Colors.green,
          message: 'Email Sent Successfully');
      log("Email sent successfully.");
    } else {
      log("Failed to send email. Status code: ${response.statusCode}");
      log("Response body: ${response.body}");
      CustomSnackbar.show(
          context: context,
          snackbarColor: Colors.red,
          message: 'Failed to send email. Status code: ${response.statusCode}');
    }
  }
}
