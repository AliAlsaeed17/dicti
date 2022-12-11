extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? "${this[0].toUpperCase()}${substring(0).toLowerCase()}" : "";
}
