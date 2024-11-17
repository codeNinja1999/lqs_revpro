import 'package:easy_localization/easy_localization.dart';

extension StringExtensions on String {
  String get value => this.tr();
}

extension InitialStringExtension on String {
  String getInitials() {
    List<String> nameParts = split(" ");

    if (nameParts.isNotEmpty) {
      if (nameParts.length >= 3) {
        // Ensure that nameParts[0] and nameParts[1] have elements before accessing indices
        if (nameParts[0].isNotEmpty && nameParts[1].isNotEmpty && nameParts[2].isNotEmpty) {
          return "${nameParts[0][0]}${nameParts[1][0]}${nameParts[2][0]}";
        } else if (nameParts[0].isNotEmpty && nameParts[2].isNotEmpty) {
          return "${nameParts[0][0]}${nameParts[2][0]}";
        } else if (nameParts[0].isNotEmpty && nameParts[1].isNotEmpty) {
          return "${nameParts[0][0]}${nameParts[1][0]}";
        } else if (nameParts[0].isNotEmpty) {
          return nameParts[0][0];
        }
      } else if (nameParts[0].isNotEmpty) {
        return nameParts[0][0];
      }
    }
    return "N/A";
  }
}
