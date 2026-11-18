import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? leadingIcon;
  final bool isLoading;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.leadingIcon,
    this.isLoading = false,
    this.isEnabled = true,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveOnPressed = (isEnabled && !isLoading) ? onPressed : null;
    return FilledButton(
      onPressed: effectiveOnPressed,
      style: (backgroundColor != null || foregroundColor != null)
          ? FilledButton.styleFrom(backgroundColor: backgroundColor, foregroundColor: foregroundColor,) : null,
      child: isLoading ? SizedBox(
              width: 24, height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: foregroundColor ?? colorScheme.onPrimary,
              ),
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (leadingIcon != null) ...[
                  leadingIcon!,
                   SizedBox(width: 12),
                ],
                Flexible(
                  child: Text(text, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,),),
                ),
              ],
            ),
    );
  }
}
