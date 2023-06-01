import '../widgets/map_screen_widgets.dart';
import '../widgets/resource_card.dart';
import '../widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import '../models/resources_model.dart';
import '../providers/resource_provider.dart';

class ResourceDetailScreen extends StatefulWidget {
  static const routeName = '/resources-categories';

  @override
  State<ResourceDetailScreen> createState() => _ResourceDetailScreenState();
}

class _ResourceDetailScreenState extends State<ResourceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<ResourceProvider>(context, listen: false);
    String recievedCategoryArgs =
        ModalRoute.of(context)!.settings.arguments as String;

    _provider.selectDisplayedResourcesBasedOnCategory(recievedCategoryArgs);
    List<ResourcesModel> resourceList = _provider.displayedResourceForACategory;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: custom_colors.backgroundPurple,
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/daily_bg.png'),
                  fit: BoxFit.cover)),
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: MediaQuery.of(context).padding.top + 20,
              bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left_rounded,
                      size: 40,
                      color: custom_colors.primaryDarkPurple,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      recievedCategoryArgs,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: custom_colors.primaryDarkPurple),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //search bar
              GestureDetector(
                onTap: (() => Navigator.of(context).pop()),
                child: CustomSearchBar('Search for other resourcess..',
                    Colors.white, custom_colors.primaryDarkPurple),
              ),

              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 360,
                color: Colors.white,
                padding: const EdgeInsets.all(4),
                child: const CurrentLocationScreen(),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Nearest ${recievedCategoryArgs}",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 16,
              ),
              ResourceCard(resourceList[0].title, resourceList[0].URLDirection),
              const SizedBox(
                height: 16,
              ),
              ResourceCard(resourceList[1].title, resourceList[1].URLDirection),
              const SizedBox(
                height: 16,
              ),
              ResourceCard(resourceList[2].title, resourceList[2].URLDirection)
            ],
          ),
        ),
      ),
    );
  }
}
