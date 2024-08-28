import 'package:cat_facts_flutter/core/constant/constant.dart';
import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  final String text;
  final String clickText;
  final IconData icon;
  final Function onClickOK;
  final Function? onClickCancel;

  const InfoDialog({
    super.key,
    required this.text,
    required this.icon,
    required this.onClickOK,
    this.onClickCancel,
    this.clickText = "OK",
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (a) async => false,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Text(text,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
            )),
        actions: <Widget>[
          onClickCancel != null
              ? TextButton(
                  onPressed: () => onClickCancel!(),
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    side: WidgetStateProperty.all(
                        const BorderSide(color: AppColors.grayshade)),
                  ),
                  child: const Text(
                    "Batal",
                    style: TextStyle(
                        color: AppColors.lightgray,
                        fontWeight: FontWeight.w600),
                  ),
                )
              : const SizedBox(),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(AppColors.app),
            ),
            onPressed: () => onClickOK(),
            child: Text(
              clickText,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
