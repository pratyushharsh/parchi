import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar_leading.dart';

class LocaleView extends StatefulWidget {
  const LocaleView({Key? key}) : super(key: key);

  @override
  State<LocaleView> createState() => _LocaleViewState();
}

class _LocaleViewState extends State<LocaleView> {
  Locale? _currentLocale;

  @override
  initState() {
    super.initState();
    // _currentLocale = EasyLocalization.of(context)?.locale;
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentLocale = EasyLocalization.of(context)?.locale;
  }

  Widget _buildLocaleItem(Locale locale) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentLocale = locale;
          EasyLocalization.of(context)?.setLocale(locale);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(locale.toString().tr()),
            const SizedBox(
              width: 10,
            ),
            Radio<Locale>(value: locale, groupValue: _currentLocale, onChanged: (val) {
              setState(() {
                _currentLocale = val;
                EasyLocalization.of(context)?.setLocale(locale);
              });
            }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Locale> locales = EasyLocalization.of(context)?.supportedLocales ?? [];

    return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          ...locales.map(_buildLocaleItem).toList()
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: AppBarLeading(
                    heading: "_locale",
                    icon: Icons.arrow_back,
                    onTap: () {
                      Navigator.of(context).pop(_currentLocale);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
