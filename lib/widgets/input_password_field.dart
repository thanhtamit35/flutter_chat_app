import 'package:chat_app/color/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPasswordField extends StatefulWidget {
  const InputPasswordField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.textValidator,
    required this.hintText,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String textValidator;
  final String hintText;

  @override
  State<InputPasswordField> createState() => _InputPasswordFieldState();
}

class _InputPasswordFieldState extends State<InputPasswordField> {
  bool _showClearButton = false;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleTextChanged);
    super.dispose();
  }

  void _handleTextChanged() {
    setState(() {
      _showClearButton = widget.controller.text.isNotEmpty;
    });
  }

  void _clearText() {
    widget.controller.clear();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.textValidator;
        }
        return null;
      },
      controller: widget.controller,
      focusNode: widget.focusNode,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.none,
      keyboardType: TextInputType.text,
      cursorColor: AppColors.borderColor,
      obscureText: _obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.bgScreen,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.hintColor,
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _showClearButton ? IconButton(
              onPressed: _clearText,
              icon: const Icon(
                CupertinoIcons.clear_circled,
                size: 14,
              ),
            ) : const SizedBox(),
            IconButton(
              onPressed: _toggleObscureText,
              icon: Icon(_obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash),
            ),
          ],
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: AppColors.borderColor, width: 0.1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 1.25,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 1.25,
          ),
        ),
        labelStyle: const TextStyle(color: AppColors.primaryColor),
      ),
    );
  }
}
