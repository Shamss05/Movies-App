import 'package:flutter/material.dart';
import 'package:movie_app/l10n/app_localizations.dart';

abstract final class Validation {
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*[!@#\$&*~%^()_+\-=\[\]{};:"\\|,.<>\/?]).{8,}$',
  );
  static final RegExp _nameRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]{3,15}$');
  static final RegExp _egyptPhoneRegex = RegExp(r'^(\+20|0)?1[0125][0-9]{8}$');

  static String? validateEmail(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return l10n.emailRequired;
    }
    if (!_emailRegex.hasMatch(trimmed)) {
      return l10n.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    final current = value ?? '';
    if (current.isEmpty) {
      return l10n.passwordRequired;
    }
    if (!_passwordRegex.hasMatch(current)) {
      return l10n.invalidPassword;
    }
    return null;
  }

  static String? validateConfirmPassword(
    BuildContext context,
    String? value,
    String password,
  ) {
    final l10n = AppLocalizations.of(context)!;
    final current = value ?? '';
    if (current.isEmpty) {
      return l10n.confirmPasswordRequired;
    }
    if (current != password) {
      return l10n.passwordsDoNotMatch;
    }
    return null;
  }

  static String? validateName(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return l10n.nameRequired;
    }
    if (!_nameRegex.hasMatch(trimmed)) {
      return l10n.invalidName;
    }
    return null;
  }

  static String? validatePhone(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return l10n.phoneRequired;
    }
    if (!_egyptPhoneRegex.hasMatch(trimmed)) {
      return l10n.invalidPhone;
    }
    return null;
  }
}
