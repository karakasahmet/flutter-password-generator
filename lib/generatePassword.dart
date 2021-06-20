import 'dart:math';

String generatePassword(
    {bool hasLetters = true, bool hasNumbers = true, bool hasSpecial = true}) {
  final length = 20;
  final lettersLowerCase = 'abcdefghijklmnopqrstuwxvyz';
  final lettersUpperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final numbers = '0123456789';
  final special = '@#=+!€/\$%&?(){}';

  String chars = '';
  if (hasLetters) chars += '$lettersLowerCase$lettersUpperCase';
  if (hasNumbers) chars += '$numbers';
  if (hasSpecial) chars += '$special';
  return List.generate(length, (index) {
    final indexRandom = Random.secure().nextInt(chars.length);
    return chars[indexRandom];
  }).join('');
}
