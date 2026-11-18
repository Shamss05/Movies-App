import 'package:flutter/material.dart';

class SwitchLanguage extends StatelessWidget {
  static final ValueNotifier<Locale> localeNotifier = ValueNotifier<Locale>(
    const Locale('en'),
  );

  final Locale? currentLocale;
  final ValueChanged<Locale>? onLocaleChanged;

  const SwitchLanguage({
    super.key,
    this.currentLocale,
    this.onLocaleChanged,
  });

  void _toggleLocale(Locale activeLocale) {
    final nextLocale = Locale(activeLocale.languageCode == 'en' ? 'ar' : 'en');
    localeNotifier.value = nextLocale;
    onLocaleChanged?.call(nextLocale);
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return ValueListenableBuilder<Locale>(
      valueListenable: localeNotifier,
      builder: (context, notifiedLocale, _) {
        final activeLocale = currentLocale ?? notifiedLocale;
        final isEnglish = activeLocale.languageCode == 'en';
        return Semantics(
          button: true,
          label: isEnglish ? 'English' : 'العربيه',
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 92, minHeight: 48), //بحدد المساحةعلشان ال accessibility
              child: Center(
                child: InkWell(
                  onTap: () => _toggleLocale(activeLocale),
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 92, height: 38,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: primaryColor, width: 2),),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _FlagIcon(assetPath: 'assets/en_flag.png', isSelected: isEnglish, borderColor: primaryColor,),
                        _FlagIcon(assetPath: 'assets/ar_flag.png', isSelected: !isEnglish, borderColor: primaryColor,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FlagIcon extends StatelessWidget {
  final String assetPath;
  final bool isSelected;
  final Color borderColor;

  const _FlagIcon({
    required this.assetPath,
    required this.isSelected,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34, height: 34,
      decoration: BoxDecoration(shape: BoxShape.circle, border: isSelected ? Border.all(color: borderColor, width: 3) : null,),
      padding: EdgeInsetsDirectional.all(2),
      child: ClipOval(child: Image.asset(assetPath, fit: BoxFit.cover)), //for the oval shap
    );
  }
}
