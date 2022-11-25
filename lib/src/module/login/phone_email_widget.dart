import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/cache_manager.dart';
import '../../config/theme_settings.dart';
import '../../entity/pos/country_entity.dart';
import 'bloc/login_bloc.dart';

class PhoneOrEmailWidget extends StatefulWidget {
  const PhoneOrEmailWidget({Key? key}) : super(key: key);

  @override
  State<PhoneOrEmailWidget> createState() => _PhoneOrEmailWidgetState();
}

class _PhoneOrEmailWidgetState extends State<PhoneOrEmailWidget> {
  late TextEditingController _phoneOrEmailController;
  bool _isPhone = false;

  @override
  void initState() {
    super.initState();
    _phoneOrEmailController = TextEditingController();
    _phoneOrEmailController.addListener(_controllerListener);
  }

  bool isNumeric(String str) {
    try {
      var value = int.parse(str);
      return true;
    } on Exception {
      return false;
    }
  }

  void _controllerListener() {
    if (_phoneOrEmailController.text.isNotEmpty &&
        _phoneOrEmailController.text.length > 2 &&
        isNumeric(_phoneOrEmailController.text)) {
      setState(() {
        _isPhone = true;
      });
    } else {
      setState(() {
        _isPhone = false;
      });
    }
  }

  @override
  void dispose() {
    _phoneOrEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {

        CountryEntity country = state.country ?? SettingsCacheManager().getDefaultElement(SettingsType.country);

        return LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // if (_isPhone)
                    AnimatedContainer(
                      clipBehavior: Clip.hardEdge,
                      width: _isPhone ? 60 : 0.000001,
                      duration: const Duration(milliseconds: 250),
                      decoration: const BoxDecoration(),
                      padding: const EdgeInsets.only(right: 8),
                      child: CountryCodeWidget(
                          width: constraints.maxWidth, country: country),
                    ),
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: _isPhone
                            ? constraints.maxWidth - 60
                            : constraints.maxWidth,
                        child: TextFormField(
                          controller: _phoneOrEmailController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 15),
                            filled: true,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: AppColor.primary, width: 1.6),
                            ),
                            fillColor: AppColor.primary.withOpacity(0.1),
                            hintText: "Enter phone number or email",
                            hintStyle: const TextStyle(
                                color: AppColor.subtitleColorPrimary),
                            prefixText:
                                _isPhone ? '+${country.phoneCode} ' : '',
                            prefixStyle: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          onChanged: (value) {
                            context.read<LoginBloc>().add(
                                  OnUsernameChange(value),
                                );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (state.validation.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    state.validation,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          );
        });
      },
    );
  }
}

class CountryCodeWidget extends StatelessWidget {
  final double width;
  final CountryEntity country;

  const CountryCodeWidget({Key? key, required this.width, required this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<CountryEntity>(
      position: PopupMenuPosition.under,
      tooltip: "Select country",
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      offset: const Offset(0, 15),
      onSelected: (CountryEntity country) {
        context.read<LoginBloc>().add(OnCountryChange(country));
      },
      constraints: BoxConstraints(
        maxHeight: 350,
        maxWidth: width,
        minWidth: width,
      ),
      itemBuilder: (context) => (SettingsCacheManager()
              .getElement(SettingsType.country) as List<CountryEntity>)
          .map(
            (e) => PopupMenuItem<CountryEntity>(
              height: 45,
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${e.name} (+${e.phoneCode})',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '${e.flag}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.primary.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Center(
          child: Text(country.flag ?? '',
              style: const TextStyle(
                fontSize: 20,
              )),
        ),
      ),
    );
  }
}
