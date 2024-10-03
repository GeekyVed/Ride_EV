import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rideev_test/providers/trip_type_provider.dart';
import 'package:rideev_test/widgets/tabs/airport_tab.dart';
import 'package:rideev_test/widgets/tabs/local_tab.dart';
import 'package:rideev_test/widgets/tabs/outstation_tab.dart';

// Assuming tripTypeProvider is already defined as before

class TabContent extends ConsumerWidget {
  const TabContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the current value of tripTypeProvider
    final selectedTab = ref.watch(tripTypeProvider);

    // Use the selectedTab value to determine which content to display
    switch (selectedTab) {
      case 0:
        return OutstationTripTab();
      case 1:
        return LocalTripTab();
      case 2:
        return AirportTripTab();
      default:
        return const Center(child: Text('Invalid tab'));
    }
  }
}
