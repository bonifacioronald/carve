import 'package:carve_app/widgets/category_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import '../navigation.dart';
import '../providers/user_provider.dart';
import '../screens/resource_detail_screen.dart';

class MainMenuCategorySection extends StatelessWidget {
  const MainMenuCategorySection({super.key});

  BottomNavigationBar get navigationBar {
    return NavigationState.globalKey.currentWidget as BottomNavigationBar;
  }

  @override
  Widget build(BuildContext context) {
    var _userDataProvider =
        Provider.of<UserProvider>(context, listen: false).userProviderData;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Resources',
              style: TextStyle(
                  fontSize: 20,
                  color: custom_colors.primaryDarkPurple,
                  fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: (() => navigationBar.onTap!(1)),
              child: Container(
                child: Text(
                  'See All',
                  style: TextStyle(
                      fontSize: 14,
                      color: custom_colors.secondaryLightPurple,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (() => Navigator.of(context).pushNamed(
                    ResourceDetailScreen.routeName,
                    arguments: _userDataProvider.isPregnant
                        ? 'Pregnancy Classes'
                        : 'Therapy')),
                child: CategoryButton(
                  custom_colors.primaryDarkPurple,
                  Colors.white,
                  _userDataProvider.isPregnant
                      ? Icons.baby_changing_station_rounded
                      : Icons.handshake_rounded,
                  _userDataProvider.isPregnant ? "Post-\npartum" : "Therapy",
                ),
              ),
              GestureDetector(
                onTap: (() => Navigator.of(context).pushNamed(
                    ResourceDetailScreen.routeName,
                    arguments: _userDataProvider.isPregnant
                        ? 'Adoption Agency'
                        : 'Marriage Counseling')),
                child: CategoryButton(
                  custom_colors.primaryDarkPurple.withOpacity(0.7),
                  Colors.white,
                  _userDataProvider.isPregnant
                      ? Icons.house_outlined
                      : Icons.phone_in_talk_sharp,
                  _userDataProvider.isPregnant
                      ? 'Adoption\nAgency'
                      : 'Marriage\nCounseling',
                ),
              ),
              GestureDetector(
                onTap: (() => Navigator.of(context).pushNamed(
                    ResourceDetailScreen.routeName,
                    arguments: _userDataProvider.isPregnant
                        ? 'Daycare'
                        : 'Food Bank')),
                child: CategoryButton(
                  custom_colors.secondaryLightPurple.withOpacity(0.6),
                  Colors.white,
                  _userDataProvider.isPregnant
                      ? Icons.school_outlined
                      : Icons.food_bank_outlined,
                  _userDataProvider.isPregnant ? 'Daycare' : 'Food Bank',
                ),
              ),
              GestureDetector(
                onTap: (() => Navigator.of(context).pushNamed(
                    ResourceDetailScreen.routeName,
                    arguments: _userDataProvider.isPregnant
                        ? 'Daycare'
                        : 'Charities')),
                child: CategoryButton(
                  custom_colors.secondaryLightPurple,
                  Colors.white,
                  _userDataProvider.isPregnant
                      ? Icons.stroller_outlined
                      : Icons.payments_outlined,
                  _userDataProvider.isPregnant ? 'Babysitter' : 'Charities',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
