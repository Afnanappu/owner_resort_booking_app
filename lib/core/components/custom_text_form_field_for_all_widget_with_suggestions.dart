import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_add_property.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';

class CustomTextFormFieldForAllWidgetWithSuggestion extends StatefulWidget {
  final double width;
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final List<String> suggestions;
  // final void Function()? iconOnPressed;
  final String? Function(String? value)? validator;

  const CustomTextFormFieldForAllWidgetWithSuggestion({
    super.key,
    required this.width,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    required this.suggestions,
    this.validator,
    // this.iconOnPressed,
  });

  @override
  State<CustomTextFormFieldForAllWidgetWithSuggestion> createState() =>
      _CustomTextFormFieldForState();
}

class _CustomTextFormFieldForState
    extends State<CustomTextFormFieldForAllWidgetWithSuggestion> {
  List<String> filteredSuggestions = [];

  bool isSuggestionVisible = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_filterSuggestions);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_filterSuggestions);
    super.dispose();
  }

  void _filterSuggestions() {
    final query = widget.controller.text.toLowerCase();
    if (query.isNotEmpty) {
      filteredSuggestions = widget.suggestions
          .where((suggestion) => suggestion.toLowerCase().contains(query))
          .toList();
      isSuggestionVisible = filteredSuggestions.isNotEmpty;
    } else {
      filteredSuggestions = widget.suggestions;
      isSuggestionVisible = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Container(
        //   width: widget.width,
        //   child: TextFormField(
        //     controller: widget.controller,
        //     decoration: InputDecoration(
        //       hintText: widget.hintText,
        //       suffixIcon: widget.suffixIcon,
        //       border: OutlineInputBorder(),
        //     ),
        //   ),
        // ),

        CustomTextFormFieldForAddProperty(
          width: widget.width,
          hintText: widget.hintText,
          controller: widget.controller,
          suffixIcon: IconButton(
            onPressed: () {
              filteredSuggestions = widget.suggestions;
              isSuggestionVisible = true;
              setState(() {});
            },
            icon: Icon(
              Icons.arrow_drop_down,
            ),
          ),
          validator: widget.validator,
        ),

        if (isSuggestionVisible)
          Container(
            width: widget.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.greyLight,
              ),
              borderRadius: BorderRadius.circular(borderRad10),
            ),
            // constraints: BoxConstraints(maxHeight: 150),
            height: 150,
            child: ListView.builder(
              itemCount: filteredSuggestions.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  // tileColor: index.isEven
                  //     ? const Color.fromARGB(255, 218, 218, 218)
                  //     : MyColors.greyLight,
                  title: Text(filteredSuggestions[index]),
                  onTap: () {
                    widget.controller.text = filteredSuggestions[index];
                    isSuggestionVisible = false;
                    setState(() {});
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
