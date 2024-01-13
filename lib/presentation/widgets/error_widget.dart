import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final String errorMesage;
  const CustomError({
    super.key,
    required this.errorMesage,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

void showErrorSnackbar(BuildContext context, String message) {
  final colors = Theme.of(context).colorScheme;
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
      ),
      backgroundColor: colors.error,
    ),
  );
}
