import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideev_test/utils/app_colors.dart';

class AirportTripTab extends StatefulWidget {
  AirportTripTab({super.key});

  @override
  State<AirportTripTab> createState() => _AirportTripTabState();
}

class _AirportTripTabState extends State<AirportTripTab> {
  final TextEditingController pickupCityController = TextEditingController();

  final TextEditingController dropCityController = TextEditingController();

  final TextEditingController pickupDateController = TextEditingController();

  final TextEditingController pickupTimeController = TextEditingController();

  int _subTab = 0;

  void setSubTab(int index) {
    setState(() {
      _subTab = index;
    });
  }

  Widget _buildButton(int tabIndex, String label) {
    final isSelected = _subTab == tabIndex;
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setSubTab(tabIndex);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor:
              isSelected ? AppColors.white : AppColors.primaryGreen,
          backgroundColor:
              isSelected ? AppColors.primaryGreen : AppColors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
            side: const BorderSide(color: AppColors.primaryGreen, width: 1.5),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(fontSize: 13),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(21),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButton(
                      0,
                      'To The Airport',
                    ),
                    const SizedBox(width: 16),
                    _buildButton(
                      1,
                      'From The Airport',
                    ),
                  ],
                ),
              ),
              Form(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                  child: Column(
                    children: [
                      _buildTextField(
                        controller: pickupCityController,
                        title: _subTab == 0 ? 'Pick-up City' : 'Pickup Airport',
                        subtitle: 'Type City Name',
                        icon: "assets/icons/Location.png",
                        toClear: true,
                      ),
                      const SizedBox(height: 16.0),
                      _buildTextField(
                        controller: pickupDateController,
                        title: 'Pick-up Date',
                        subtitle: 'DD-MM-YYYY',
                        icon: "assets/icons/Pick-up-date.png",
                      ),
                      const SizedBox(height: 16.0),
                      _buildTextField(
                          controller: pickupTimeController,
                          title: 'Pick-up Time',
                          subtitle: 'HHMM',
                          icon: "assets/icons/Time.png"),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              Colors.white, // Use white for button text
                          backgroundColor: AppColors.primaryGreen,
                          elevation: 2, // Set elevation
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          minimumSize: const Size(230, 30), // Set minimum size
                        ),
                        onPressed: () {
                          // Action for the button to explore cabs
                        },
                        child: Text(
                          'Explore Cabs',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String title,
    required String subtitle,
    required String icon,
    bool toClear = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffd5f2c8),
        borderRadius: BorderRadius.circular(21),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
          ),
          const SizedBox(width: 28),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.primaryGreen,
                  ),
                ),
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: subtitle,
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                ),
              ],
            ),
          ),
          if (toClear)
            IconButton(
              icon: const Icon(
                Icons.clear,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                controller.clear();
              },
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
        ],
      ),
    );
  }
}
