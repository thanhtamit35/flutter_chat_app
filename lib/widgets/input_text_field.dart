import 'package:chat_app/color/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.textValidator,
    required this.hintText,
    this.textInputType = TextInputType.text,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String? textValidator;
  final String hintText;
  final TextInputType textInputType;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _showClearButton = false;

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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      validator: (value) {
        if (widget.textValidator != null && (value == null || value.isEmpty)) {
          return widget.textValidator;
        }

        return null;
      },
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.none,
      keyboardType: widget.textInputType,
      cursorColor: AppColors.borderColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.bgScreen,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.hintColor,
        ),
        suffixIcon: _showClearButton
            ? IconButton(
                onPressed: _clearText,
                icon: const Icon(
                  CupertinoIcons.clear_circled,
                  size: 14,
                ),
              )
            : null,
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
            width: 1.25,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 1,
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
