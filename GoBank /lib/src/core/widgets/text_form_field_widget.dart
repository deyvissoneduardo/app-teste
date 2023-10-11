// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../modules/utils/colornotifire.dart';
import '../../modules/utils/media.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String?>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final String? path;
  final bool? obscureText;
  final ColorNotifire notifire;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  const TextFormFieldWidget({
    Key? key,
    this.hintText,
    this.controller,
    required this.onFieldSubmitted,
    this.validator,
    this.path,
    this.obscureText,
    required this.notifire,
    this.textInputAction,
    this.textInputType,
  }) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: height / 15,
      padding: EdgeInsets.symmetric(
        horizontal: width / 18,
      ),
      child: TextFormField(
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator,
        autofocus: false,
        obscureText: widget.obscureText ?? false,
        style: TextStyle(
          fontSize: height / 50,
          color: widget.notifire.getdarkscolor,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.notifire.getdarkwhitecolor,
          hintText: widget.hintText,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height / 100,
              horizontal: height / 70,
            ),
            child: Image.asset(
              widget.path!,
              height: height / 30,
            ),
          ),
          hintStyle: TextStyle(
            color: widget.notifire.getdarkgreycolor,
            fontSize: height / 60,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.notifire.getbluecolor,
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
      ),
    );
  }
}
