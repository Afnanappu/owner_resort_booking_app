import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/data/models/location_model.dart';

class PropertySimpleCardComponent extends StatelessWidget {
  final String image;
  final String propertyName;
  final LocationModel location;
  final double rating;
  final List<String> reviews;
  final double price;
  final void Function()? onTap;
  final bool havePlaceholder;

  const PropertySimpleCardComponent({
    super.key,
    required this.image,
    required this.propertyName,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.price,
    this.onTap,
    this.havePlaceholder = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.2, color: Color(0xFF8A8989)),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Image Section
              Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Color(0xFF8A8989), width: 0.2),
                  image: DecorationImage(
                    image: havePlaceholder
                        ? NetworkImage(image)
                        : MemoryImage(
                            base64Decode(image),
                          ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16.0), // Space between image and text
              // Right Text Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      propertyName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            size: 12, color: Color(0xFF8A8989)),
                        const SizedBox(width: 4.0),
                        Expanded(
                          child: Text(
                            location.address,
                            style: TextStyle(
                              color: Color(0xFF8A8989),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(Icons.star, size: 12, color: Colors.amber),
                        const SizedBox(width: 4.0),
                        Text(
                          '$rating (${reviews.length} Reviews)',
                          style: TextStyle(
                            color: Color(0xFF8A8989),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'from ₹$price',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: ' /night',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
