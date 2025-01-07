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
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final void Function()? onTap;
  final void Function()? onPressedIcon;
  const CustomTextFormFieldForAllWidgetWithSuggestion({
    super.key,
    required this.width,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    required this.suggestions,
    this.validator,
    this.onChanged,
    this.onTap,
    this.onPressedIcon,
  });

  @override
  State<CustomTextFormFieldForAllWidgetWithSuggestion> createState() =>
      _CustomTextFormFieldForAllWidgetWithSuggestion();
}

class _CustomTextFormFieldForAllWidgetWithSuggestion
    extends State<CustomTextFormFieldForAllWidgetWithSuggestion> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  List<String> filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_filterSuggestions);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_filterSuggestions);
    _hideOverlay();
    super.dispose();
  }

  void _filterSuggestions() {
    if (widget.suggestions.isEmpty) return;
    final query = widget.controller.text.toLowerCase();
    if (query.isNotEmpty) {
      filteredSuggestions = widget.suggestions
          .where((suggestion) => suggestion.toLowerCase().contains(query))
          .toList();
      if (filteredSuggestions.isNotEmpty) {
        _showOverlay();
      } else {
        _hideOverlay();
      }
    } else {
      _hideOverlay();
    }
  }

  void _showOverlay() {
    _hideOverlay(); // Remove existing overlay if any
    _overlayEntry = _createOverlay();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlay() {
    return OverlayEntry(
      builder: (context) {
        final height = 60.0;

        return Positioned(
          width: widget.width,
          child: CompositedTransformFollower(
            link: _layerLink,
            offset: Offset(0, height),
            child: Material(
              elevation: 6,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRad10),
                side: BorderSide(
                  color: MyColors.greyLight,
                ),
              ),
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: 200,
                ),
                child: ListView.builder(
                  itemCount: filteredSuggestions.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(filteredSuggestions[index]),
                      onTap: () {
                        widget.controller.text = filteredSuggestions[index];
                        _hideOverlay();
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: CustomTextFormFieldForAddProperty(
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        width: widget.width,
        hintText: widget.hintText,
        controller: widget.controller,
        suffixIcon: IconButton(
          onPressed: () {
            widget.onPressedIcon ?? ();
            filteredSuggestions = widget.suggestions;
            if (filteredSuggestions.isEmpty) return;
            _showOverlay();
          },
          icon: const Icon(Icons.arrow_drop_down),
        ),
        validator: widget.validator,
      ),
    );
  }
}
