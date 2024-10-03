import 'package:flutter_riverpod/flutter_riverpod.dart';

final tripTypeProvider = StateNotifierProvider<TripTypeNotifier, int>((ref) {
  return TripTypeNotifier();
});

class TripTypeNotifier extends StateNotifier<int> {
  TripTypeNotifier() : super(0);

  void selectTripType(int index) {
    state = index;
  }
}