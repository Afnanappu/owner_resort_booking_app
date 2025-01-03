import 'dart:io';

import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/features/add_property/model/add_room_model.dart';
import 'package:owner_resort_booking_app/features/add_property/views/components/amenity_container_widget.dart';

class RoomDetailsCard extends StatelessWidget {
  final AddRoomModel room;

  const RoomDetailsCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Room Type and Room ID
            Text(
              room.roomType,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),

            // Room Price
            Row(
              children: [
                const Icon(Icons.monetization_on, size: 20),
                const SizedBox(width: 8),
                Text(
                  "Price: ${room.price}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Room Area and Bed Type
            Wrap(
              spacing: 16,
              direction: Axis.horizontal,
              children: [
                Row(
                  children: [
                    const Icon(Icons.square_foot, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      "Area: ${room.roomArea} sq.ft",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.bed, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      "Bed: ${room.bedType}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Max Guests
            Row(
              children: [
                const Icon(Icons.group, size: 20),
                const SizedBox(width: 8),
                Text(
                  "Max Guests: ${room.maxGustCount}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Description
            if (room.description.isNotEmpty) ...[
              const Text(
                "Description:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                room.description,
                style: TextStyle(color: Colors.grey[800]),
              ),
            ],

            const SizedBox(height: 12),

            // Amenities
            const Text(
              "Amenities:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Wrap(
              spacing: 8,
              children: room.amenities.map(
                (amenity) {
                  return AmenityContainerWidget(
                    amenity: amenity,
                  );
                },
              ).toList(),
            ),

            const SizedBox(height: 12),

            // Images (if available)
            if (room.images.isNotEmpty) ...[
              const Text(
                "Images:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: room.images.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(room.images[index].filePath),
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}