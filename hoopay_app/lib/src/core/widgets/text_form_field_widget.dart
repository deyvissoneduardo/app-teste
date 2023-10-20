// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String?>? onFieldSubmitted;
  final String? Function(String?)? validator;
  final String? path;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<PointerDownEvent>? onTapOutside;
  final FocusNode? focusNode;
  const TextFormFieldWidget({
    Key? key,
    this.hintText,
    this.controller,
    required this.onFieldSubmitted,
    this.validator,
    this.path,
    this.obscureText,
    this.textInputAction,
    this.textInputType,
    this.inputFormatters,
    this.onTapOutside,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      autofocus: false,
      inputFormatters: inputFormatters,
      obscureText: obscureText ?? false,
      onTapOutside: onTapOutside,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: Image.asset(
            path!,
            height: 30,
            width: 30,
          ),
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blueAccent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
