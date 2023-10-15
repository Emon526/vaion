import 'package:flutter/material.dart';

import '../consts/consts.dart';

class InfoCardWidget extends StatelessWidget {
  final String cardname;
  final Widget child;
  const InfoCardWidget({
    super.key,
    required this.cardname,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(Consts.defaultBorderRadius)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardname,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            child,
          ],
        ),
      ),
    );
  }
}
