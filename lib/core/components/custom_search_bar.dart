import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({super.key, required this.searchController, this.trailing});

  final SearchController searchController;
  final Iterable<Widget>? trailing;
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (_, controller) {
        return SearchBar(
          focusNode: focusNode,
          onTapOutside: (event) => focusNode.unfocus(),
          backgroundColor: WidgetStateColor.resolveWith(
            (_) => MyColors.orangeBackground,
          ),
          elevation: WidgetStateProperty.resolveWith<double>(
            (_) => .5,
          ),

          //? Which controller should I give here custom or function.
          controller: searchController,
          hintText: 'Search...',
          leading: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Image.asset('assets/icons/search_1.png'),
          ),
          hintStyle: WidgetStateTextStyle.resolveWith(
            (_) {
              return TextStyle(
                color: MyColors.orange,
                fontSize: 15,
              );
            },
          ),
          trailing: trailing,
        );
      },

      //TODO: Give suggestions here.

      suggestionsBuilder: (context, controller) {
        return [];
      },
    );
  }
}
