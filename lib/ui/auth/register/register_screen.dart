import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/core/shared_ui/button.dart';
import 'package:movie_app/core/shared_ui/custom_text_field.dart';
import 'package:movie_app/core/shared_ui/switch_language.dart';
import 'package:movie_app/core/utils/validation.dart';
import 'package:movie_app/l10n/app_localizations.dart';
import 'package:movie_app/ui/auth/register/widgets/avatar_selector.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submitRegister() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
    }
  }

  void _navigateToLogin() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.register)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 12,),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 AvatarSelector(),
                 SizedBox(height: 16),
                _RegisterFieldsSection(
                  nameController: _nameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                  phoneController: _phoneController,
                  onSubmitted: _submitRegister,
                ),
                SizedBox(height: 22),
                Button(text: l10n.createAccount, onPressed: _submitRegister,),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        l10n.alreadyHaveAccount,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
                      ),
                    ),
                    TextButton(
                      onPressed: _navigateToLogin,
                      style: TextButton.styleFrom(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 6,),
                        minimumSize: Size(48, 48),
                      ),
                      child: Text(
                        l10n.login,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 12),
                 SwitchLanguage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterFieldsSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final VoidCallback onSubmitted;

  const _RegisterFieldsSection({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomTextField(
          controller: nameController,
          hintText: l10n.name,
          prefixIcon: Icon(Icons.badge_outlined),
          textInputAction: TextInputAction.next,
          validator: (value) => Validation.validateName(context, value),
        ),
        SizedBox(height: 18),
        CustomTextField(
          controller: emailController,
          hintText: l10n.email,
          prefixIcon: Icon(Icons.email_rounded),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) => Validation.validateEmail(context, value),
        ),
        SizedBox(height: 18),
        CustomTextField(
          controller: passwordController,
          hintText: l10n.password,
          prefixIcon: Icon(Icons.lock_rounded),
          isPassword: true,
          textInputAction: TextInputAction.next,
          validator: (value) => Validation.validatePassword(context, value),
        ),
        SizedBox(height: 18),
        CustomTextField(
          controller: confirmPasswordController,
          hintText: l10n.confirmPassword,
          prefixIcon: Icon(Icons.lock_rounded),
          isPassword: true,
          textInputAction: TextInputAction.next,
          validator: (value) => Validation.validateConfirmPassword(
            context,
            value,
            passwordController.text,
          ),
        ),
        SizedBox(height: 18),
        CustomTextField(
          controller: phoneController,
          hintText: l10n.phoneNumber,
          prefixIcon: Icon(Icons.phone_rounded),
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
          ],
          onFieldSubmitted: (_) => onSubmitted(),
          validator: (value) => Validation.validatePhone(context, value),
        ),
      ],
    );
  }
}
