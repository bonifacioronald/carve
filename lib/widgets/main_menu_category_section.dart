import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import '../navigation.dart';
import '../providers/user_provider.dart';
import '../screens/resource_detail_screen.dart';
import '../widgets/category_button.dart';

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
                  arguments:
                      _userDataProvider.isPregnant ? 'Daycare' : 'Charities')),
              child: CategoryButton(
                custom_colors.secondaryLightPurple,
                Colors.white,
                _userDataProvider.isPregnant
                    ? Icons.stroller_outlined
                    : Icons.payments_outlined,
                _userDataProvider.isPregnant ? 'Babysitter' : 'Charities',
              ),
            ),
            GestureDetector(
              onTap: (() => Navigator.of(context).pushNamed(
                  ResourceDetailScreen.routeName,
                  arguments:
                      _userDataProvider.isPregnant ? 'Daycare' : 'Food Bank')),
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
                      ? 'Adoption Agency'
                      : 'Marriage Counselling')),
              child: CategoryButton(
                custom_colors.primaryDarkPurple.withOpacity(0.7),
                Colors.white,
                _userDataProvider.isPregnant
                    ? Icons.house_outlined
                    : Icons.phone_in_talk_sharp,
                _userDataProvider.isPregnant
                    ? 'Adoption\nAgency'
                    : 'Marriage\nCounselling',
              ),
            ),
          ],
        )
      ],
    );
  }
}
