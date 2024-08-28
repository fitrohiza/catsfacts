import 'package:cat_facts_flutter/core/constant/constant.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final String text;

  const LoadingDialog({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: const Center(
        child: CircularProgressIndicator(color: AppColors.app),
      ),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
      ),
    );
  }
}
