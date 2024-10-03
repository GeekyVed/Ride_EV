import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/trip.dart';

class TripNotifier extends StateNotifier<List<Trip>> {
  TripNotifier() : super([]);

  void addTrip(Trip trip) {
    state = [...state, trip];
  }
}

final tripProvider = StateNotifierProvider<TripNotifier, List<Trip>>((ref) {
  return TripNotifier();
});
