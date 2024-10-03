import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rideev_test/utils/app_colors.dart';
import 'package:rideev_test/widgets/image_slider.dart';
import 'package:rideev_test/widgets/tab_content.dart';
import 'package:rideev_test/widgets/trip_type.dart';

final selectedTabProvider = StateProvider<int>((ref) => 0);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(selectedTabProvider);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap with SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: height * 0.012),
                // Adjusted height for spacing
                _buildTitleText(context),
                const ImageSlider(),
                SizedBox(height: height * 0.0021),
                // Adjusted height for spacing
                _buildTripTypeSelector(),
                SizedBox(height: height * 0.012),
                // Adjusted height for spacing
                const TabContent(),
                SizedBox(height: height * 0.012),

                ClipRRect(
                  borderRadius: BorderRadius.circular(21),
                  child: Image.asset(
                    "assets/images/preview.png",
                    height: 190,
                    width:
                        double.infinity, // Use double.infinity for full width
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(selectedTab, ref),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Image.asset(
          "assets/images/yatri_cabs_title.png",
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_active_rounded,
            size: 38,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildTitleText(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.displayLarge,
        children: const [
          TextSpan(text: "India's Leading "),
          TextSpan(
            text: "Inter-City ",
            style: TextStyle(color: AppColors.primaryGreen),
          ),
          TextSpan(
            text: "One Way ",
            style: TextStyle(color: AppColors.primaryGreen),
          ),
          TextSpan(text: "Cab Service Provider"),
        ],
      ),
    );
  }

  Widget _buildTripTypeSelector() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TripTypeWidget(
          image: 'assets/icons/outstation.png',
          text: 'Outstation Trip',
          index: 0,
        ),
        TripTypeWidget(
          image: 'assets/icons/local.png',
          text: 'Local Trip',
          index: 1,
        ),
        TripTypeWidget(
          image: 'assets/icons/air.png',
          text: 'Airport Transfer',
          index: 2,
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(int selectedTab, WidgetRef ref) {
    return BottomNavigationBar(
      currentIndex: selectedTab,
      onTap: (index) => ref.read(selectedTabProvider.notifier).state = index,
      selectedItemColor: AppColors.black,
      unselectedItemColor: AppColors.white,
      backgroundColor: AppColors.primaryGreen,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      elevation: 3,
      selectedLabelStyle: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'My Trip'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: 'Account'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
      ],
    );
  }
}
