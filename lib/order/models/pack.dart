enum TypePack { Standard, fast }

class Pack {
  final double amount;
  final TypePack type;
  final String duration;
  const Pack(
      {required this.amount, required this.type, required this.duration});
}
