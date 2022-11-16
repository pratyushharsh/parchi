import 'package:flutter/material.dart';

class TextFieldPlaceholderWidget<T> extends StatelessWidget {
  final T? value;
  final String label;
  final double minHeight;
  final GestureTapCallback? onTap;
  final FormFieldValidator<T>? validator;
  const TextFieldPlaceholderWidget(
      {Key? key,
      required this.value,
      required this.label,
      this.minHeight = 100,
      this.onTap,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? errorString;
    if (validator != null) {
      errorString = validator!(value);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontWeight: FontWeight.w400, color: Color(0xFF6B7281)),
        ),
        const SizedBox(
          height: 1,
        ),
        InkWell(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    //color: AppColor.background,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        width: 0.8,
                        color: errorString == null
                            ? const Color(0xFF6B7281)
                            : Colors.red.shade700)),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: minHeight,
                    minWidth: double.infinity,
                    maxWidth: double.infinity,
                  ),
                  child: Text(
                    value?.toString() ?? "",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              if (errorString != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 16),
                  child: Text(
                    errorString,
                    style: TextStyle(color: Colors.red.shade700, fontSize: 12),
                  ),
                )
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
