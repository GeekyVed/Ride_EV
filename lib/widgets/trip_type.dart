import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideev_test/providers/trip_type_provider.dart';
import 'package:rideev_test/utils/app_colors.dart';

class TripTypeWidget extends ConsumerWidget {
  final String image;
  final String text;
  final int index;

  const TripTypeWidget({
    Key? key,
    required this.image,
    required this.text,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(tripTypeProvider);
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        ref.read(tripTypeProvider.notifier).selectTripType(index);
      },
      child: Container(
        width: 130,
        height: 83,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryGreen : AppColors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              height: 32,
              color: isSelected ? AppColors.white : AppColors.black,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 12.75,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
