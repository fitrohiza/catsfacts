import 'package:cat_facts_flutter/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color background;

  const AuthButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 43,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: background,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style:
                KTextStyle.textWhiteStyle.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
