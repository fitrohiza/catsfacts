import 'package:cat_facts_flutter/core/constant/constant.dart';
import 'package:cat_facts_flutter/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

class FormFieldData {
  final String label;
  final bool isPassword;
  final String hintText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final bool isRequired;
  final double fontSize;
  final bool isPasswordVisible;
  final VoidCallback togglePasswordVisibility;
  final String? Function(String?)? validator;

  FormFieldData({
    required this.label,
    required this.isPassword,
    required this.hintText,
    required this.textInputType,
    required this.textInputAction,
    required this.controller,
    required this.isRequired,
    required this.fontSize,
    required this.isPasswordVisible,
    required this.togglePasswordVisibility,
    this.validator,
  });
}

class CustomForm extends StatefulWidget {
  final List<FormFieldData> fields;

  const CustomForm({super.key, required this.fields});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.fields.map((field) {
        return buildInputForm(field);
      }).toList(),
    );
  }

  Padding buildInputForm(FormFieldData field) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          obscureText: field.isPassword ? !field.isPasswordVisible : false,
          controller: field.controller,
          keyboardType: field.textInputType,
          textInputAction: field.textInputAction,
          decoration: InputDecoration(
            hintText: field.hintText,
            hintStyle: KTextStyle.textFieldHintStyle,
            isDense: true,
            contentPadding: const EdgeInsets.all(12),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: AppColors.grayshade, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: AppColors.grayshade),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.red),
            ),
            suffixIcon: field.isPassword
                ? IconButton(
                    onPressed: field.togglePasswordVisibility,
                    icon: Icon(
                      field.isPasswordVisible
                          ? FluentSystemIcons.ic_fluent_eye_show_regular
                          : FluentSystemIcons.ic_fluent_eye_hide_regular,
                      color: AppColors.lightgray,
                      size: 20,
                    ),
                  )
                : null,
          ),
          validator: field.isRequired
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return '${field.label} tidak boleh kosong';
                  }
                  return null;
                }
              : null,
          style: TextStyle(fontSize: field.fontSize),
        ),
      ),
    );
  }
}
