import 'dart:core';

import 'package:flutter/material.dart';

Future<DateTime?> openDatePicker({required BuildContext context, int? minimumYear, DateTime? date}) async {
  final today = DateTime.now();
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: (date != null)
          ? date
          : minimumYear != null
              ? DateTime(today.year - minimumYear, today.month, today.day)
              : DateTime(today.year, today.month, today.day + 1),
      firstDate: minimumYear != null ? DateTime(1940) : today,
      lastDate: minimumYear != null ? DateTime(today.year - minimumYear, today.month, today.day) : DateTime(2200),
      cancelText: "CANCEL",
      confirmText: "OK",
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.primary),
            ),
          ),
          child: child!,
        );
      });

  return picked;
}
