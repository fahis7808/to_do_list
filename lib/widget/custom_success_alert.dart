import 'package:flutter/material.dart';

import '../utlities/app_font.dart';
import '../utlities/colors.dart';
import 'custom_button.dart';

class CustomSuccessAlert extends StatelessWidget {
  final String txt;
  final void Function()? onTap;
  const CustomSuccessAlert({super.key, required this.txt, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Confirm Delete",
        style: AppFont.head,
      ),
      content: Text(
        txt,
        style: AppFont.subTitle,
      ),
      actions: [
        Row(
          mainAxisAlignment:
          MainAxisAlignment.end,
          children: [
            CustomButton(
              txt: "Cancel",
              btnClr: AppColor.bgClr,
              onPressed: () {
                Navigator.pop(context);
              },
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
            ),
            SizedBox(width: 10),
            CustomButton(
              btnClr: AppColor.error,
              txt: "Delete",
              onPressed: onTap,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
            ),
            // IconTextBtn(txt: "Cancel"),
          ],
        ),
      ],
    );
  }
}
