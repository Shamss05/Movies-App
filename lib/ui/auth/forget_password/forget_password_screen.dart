import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/core/shared_ui/button.dart';
import 'package:movie_app/core/shared_ui/custom_text_field.dart';
import 'package:movie_app/core/utils/validation.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = 'forget_password_screen';
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submitVerifyEmail() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.forgetPasswordTitle)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 20,),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 12),
                Center(
                  child: Image.asset('assets/forgot_password.png', width: 350, fit: BoxFit.contain,),
                ),
                SizedBox(height: 52),
                CustomTextField(
                  controller: _emailController,
                  hintText: l10n.email,
                  prefixIcon: Icon(Icons.email_rounded),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _submitVerifyEmail(),
                  validator: (value) =>
                      Validation.validateEmail(context, value),
                ),
                SizedBox(height: 24),
                Button(text: l10n.verifyEmail, onPressed: _submitVerifyEmail,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
