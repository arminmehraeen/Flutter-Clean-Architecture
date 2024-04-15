import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key, required this.controller, required this.label, this.maxLine, this.suffixText});
  final TextEditingController controller ;
  final String label ;
  final int? maxLine ;
  final String? suffixText ;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      maxLines: widget.maxLine,
      validator: (value) {
        if(value == "") {
          return "این فیلد الزامی است" ;
        }
        return null ;
      },
      controller: widget.controller,
      decoration:  InputDecoration(
      errorStyle: const TextStyle(color: Colors.red,fontSize: 14),
      suffixText: widget.suffixText,
        label: Text(widget.label),
        focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
