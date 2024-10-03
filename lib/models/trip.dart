class Trip {
  final String pickUpCity;
  final String dropCity;
  final DateTime pickUpDate;
  final bool isRoundTrip;

  Trip({
    required this.pickUpCity,
    required this.dropCity,
    required this.pickUpDate,
    required this.isRoundTrip,
  });
}
