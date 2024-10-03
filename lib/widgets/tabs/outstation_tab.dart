import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideev_test/utils/app_colors.dart';
import 'package:rideev_test/widgets/date_picker.dart';

class OutstationTripTab extends StatefulWidget {
  OutstationTripTab({super.key});

  @override
  State<OutstationTripTab> createState() => _OutstationTripTabState();
}

class _OutstationTripTabState extends State<OutstationTripTab> {
  final TextEditingController pickupCityController = TextEditingController();

  final TextEditingController dropCityController = TextEditingController();

  final TextEditingController pickupDateController = TextEditingController();

  final TextEditingController pickupTimeController = TextEditingController();

  int _subTab = 0;

  void setSubTab0() {
    setState(() {
      _subTab = 0;
    });
  }

  void setSubTab1() {
    setState(() {
      _subTab = 1;
    });
  }

  Widget _buildButton(int tabIndex, String label, VoidCallback onPressed) {
    final isSelected = _subTab != tabIndex;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? AppColors.primaryGreen : AppColors.white,
        backgroundColor: isSelected ? AppColors.white : AppColors.primaryGreen,
        elevation: 2,
        minimumSize: const Size(140, 28),
        maximumSize: const Size(140, 28),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 12.75,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildButton(0, 'One Way', setSubTab0),
              const SizedBox(width: 16),
              _buildButton(1, 'Round Trip', setSubTab1),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(21),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Column(
                children: [
                  _buildTextField(
                    controller: pickupCityController,
                    title: _subTab == 0 ? 'Pick-up City' : 'Pickup City',
                    subtitle: 'Type City Name',
                    icon: "assets/icons/Location.png",
                    toClear: true,
                  ),
                  const SizedBox(height: 16.0),
                  _buildTextField(
                    controller: dropCityController,
                    title: _subTab == 0 ? 'Drop City' : 'Destination',
                    subtitle: 'Type City Name',
                    icon:  "assets/icons/Destination.png",
                    toClear: true,
                  ),
                  if (_subTab == 0) const SizedBox(height: 16.0),
                  if (_subTab == 0)
                    _buildTextField(
                      controller: pickupDateController,
                      title: 'Pick-up Date',
                      subtitle: 'DD-MM-YYYY',
                      icon:  "assets/icons/Pick-up-date.png",
                    ),
                  const SizedBox(height: 16.0),
                  _buildTextField(
                    controller: pickupTimeController,
                    title: 'Pick-up Time',
                    subtitle: 'HHMM',
                    icon: _subTab == 0 ? "assets/icons/Time.png" : "assets/icons/Time2.png",
                  ),
                  if (_subTab == 1)
                  DateRangeSelector(),
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
          Image.asset(icon,),
          SizedBox(width: 28),
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
              constraints: BoxConstraints(),
            ),
        ],
      ),
    );
  }
}
