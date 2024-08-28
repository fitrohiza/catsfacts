import 'package:cat_facts_flutter/core/constant/constant.dart';
import 'package:cat_facts_flutter/core/constant/text_styles.dart';
import 'package:cat_facts_flutter/ui/widget/auth_botton.dart';
import 'package:cat_facts_flutter/ui/widget/custom_formfield.dart';
import 'package:cat_facts_flutter/core/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserController _controller = Get.put(UserController());
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<FormFieldData> formFields = [
      FormFieldData(
        label: 'Username',
        isPassword: false,
        hintText: 'Input your username or email',
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        controller: _usernameController,
        isPasswordVisible: _isPasswordVisible,
        togglePasswordVisibility: _togglePasswordVisibility,
        isRequired: true,
        fontSize: 10.sp,
      ),
      FormFieldData(
        label: 'Password',
        isPassword: true,
        hintText: 'Input your password',
        textInputType: TextInputType.text,
        textInputAction: TextInputAction.done,
        controller: _passwordController,
        isRequired: true,
        fontSize: 10.sp,
        isPasswordVisible: _isPasswordVisible,
        togglePasswordVisibility: _togglePasswordVisibility,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.app,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.05),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign In",
                            style: KTextStyle.textFieldHeading,
                          ),
                          Text(
                            "Sign in to continue the app",
                            style: KTextStyle.standartTextStyle,
                          ),
                        ],
                      ),
                    ),
                    CustomForm(fields: formFields),
                    const SizedBox(height: 20),
                    AuthButton(
                      onTap: () {
                        _controller.login(
                            _usernameController.text, _passwordController.text);
                      },
                      text: "Sign In",
                      background: AppColors.app,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
