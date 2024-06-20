import 'package:chat_app/color/app_color.dart';
import 'package:chat_app/widgets/input_password_field.dart';
import 'package:chat_app/widgets/input_text_field.dart';
import 'package:chat_app/widgets/round_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildFormLogin(),
              Align(
                alignment: Alignment.center,
                child: _buildBottom(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, Welcome back!',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
        Text(
          'Hello again, you\'ve been missed!',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  Widget _buildFormLogin() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputTextField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
            textValidator: 'Email is required',
          ),
          const SizedBox(
            height: 20,
          ),
          InputPasswordField(
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            hintText: 'Password',
            textValidator: 'Password is required',
          ),
          const SizedBox(
            height: 25,
          ),
          RoundButton(
            title: 'Login',
            onPress: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return RichText(
      text: TextSpan(
        text: 'Don\'t have an account? ',
        style: const TextStyle(color: AppColors.hintColor),
        children: <TextSpan>[
          TextSpan(
            text: 'Sign Up',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
