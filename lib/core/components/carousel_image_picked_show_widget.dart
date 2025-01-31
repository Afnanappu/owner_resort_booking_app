import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_container.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/data/models/picked_file_model.dart';

class CarouselImagePickedShowWidget extends StatelessWidget {
  const CarouselImagePickedShowWidget({
    super.key,
    required this.pickedImages,
    this.onTap,
    this.onLongPressImage,
    this.onPageChanged,
    this.isError = false,
    this.hasBorder = false,
    this.horizontal = 8,
    this.isFileImage = false,
  });
  final bool isError;
  final bool isFileImage;
  final bool hasBorder;
  final double horizontal;
  final List<PickedFileModel> pickedImages;
  final void Function()? onTap;
  final void Function()? onLongPressImage;
  final dynamic Function(int index, CarouselPageChangedReason reason)?
      onPageChanged;

  final double height = 220;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: isError
          ? CustomAppContainer(
              height: height,
              thickness: 1,
              child: Center(
                child: Text(
                  'Failed to load images. Please try again.',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            )
          : pickedImages.isNotEmpty
              ? CustomAppContainer(
                  hasBorder: hasBorder,
                  // height: height,
                  thickness: 1,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CarouselSlider(
                        items: pickedImages.map(
                          (image) {
                            return GestureDetector(
                              onLongPress: onLongPressImage,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: horizontal),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: isFileImage
                                    ? Image.file(
                                        File(image.filePath),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      )
                                    : Image.memory(
                                        base64Decode(image.base64file),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          height: 220,
                          enlargeCenterPage: true,
                          viewportFraction: 0.85,
                          onPageChanged: onPageChanged,
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: pickedImages.asMap().entries.map((entry) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Icon(
                                Icons.circle,
                                size: 9,
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                )
              : CustomAppContainer(
                  height: height,
                  thickness: 1,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo_library_outlined,
                          size: 60,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No images selected',
                          style: TextStyle(fontSize: 16, color: MyColors.grey),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Tap to pick images',
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
