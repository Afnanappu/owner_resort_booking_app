import 'dart:async';

import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({
    super.key,
    required this.searchController,
    this.trailing,
    this.onTap,
    required this.suggestionsBuilder,
    this.onChanged,
  });

  final SearchController searchController;
  final Iterable<Widget>? trailing;
  final focusNode = FocusNode();
  final void Function()? onTap;
  final void Function(String value)? onChanged;
  final FutureOr<Iterable<Widget>> Function(
      BuildContext context, SearchController controller) suggestionsBuilder;
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (_, controller) {
        return SearchBar(
          focusNode: focusNode,
          onTap: onTap, onChanged: onChanged,
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

      suggestionsBuilder: suggestionsBuilder,
    );
  }
}
