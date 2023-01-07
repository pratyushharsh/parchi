import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextAlign? labelAlign;
  final String? helperText;
  final int minLines;
  final int maxLines;
  final Widget? icon;
  final Widget? suffixIcon;
  final String? initialValue;
  final ValueChanged<String>? onValueChange;
  final String? errorText;
  final TextInputType? textInputType;
  final BoxConstraints? prefixIconConstraint;
  final TextEditingController? controller;
  final bool obscureText;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final TextStyle style;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final GestureTapCallback? onTap;
  final bool? enabled;
  final CrossAxisAlignment crossAxisAlignment;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField(
      {Key? key,
      this.icon,
      this.suffixIcon,
      this.helperText,
      required this.label,
      this.labelAlign,
      this.maxLines = 1,
      this.minLines = 1,
      this.initialValue,
      this.onValueChange,
      this.textInputType,
      this.errorText,
      this.inputFormatters,
      this.controller,
      this.focusNode,
      this.onTap,
      this.validator,
      this.enabled,
      this.onFieldSubmitted,
      this.textCapitalization = TextCapitalization.none,
      this.obscureText = false,
      this.style = const TextStyle(
        fontWeight: FontWeight.w600,
      ),
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.textAlign = TextAlign.start,
      this.prefixIconConstraint =
          const BoxConstraints(minWidth: 40, minHeight: 40)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6B7281),
                ),
                textAlign: labelAlign,
              ).tr(),
            ),
          ],
        ),
        if (helperText != null && helperText!.isNotEmpty)
          Text(helperText!,
              style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black38,
                  fontSize: 12)).tr(),
        const SizedBox(
          height: 1,
        ),
        Container(
          decoration: BoxDecoration(
              //color: AppColor.background,
              borderRadius: BorderRadius.circular(5)),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            validator: validator,
            focusNode: focusNode,
            controller: controller,
            keyboardType: textInputType,
            initialValue: initialValue,
            minLines: minLines,
            maxLines: maxLines,
            onChanged: onValueChange,
            obscureText: obscureText,
            cursorColor: const Color(0xFFB1B4E6),
            textAlign: textAlign,
            inputFormatters: inputFormatters,
            style: style,
            onTap: onTap,
            onFieldSubmitted: onFieldSubmitted,
            enabled: enabled,
            textCapitalization: textCapitalization,
            decoration: InputDecoration(
              errorStyle:
                  const TextStyle(height: 1, overflow: TextOverflow.fade),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFB1B4E6), width: 2.0),
              ),
              prefixIconConstraints: prefixIconConstraint,
              prefixIcon: icon,
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.all(14.2),
              border: const OutlineInputBorder(),
              isDense: true,
              errorText: errorText,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
