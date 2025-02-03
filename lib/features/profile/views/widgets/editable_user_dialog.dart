import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_add_property.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/utils/app_file_picker.dart';

class EditableUserDialog extends StatelessWidget {
  final String name;
  // final String email;
  final String? phone;
  final String? profilePicture;
  final Function(String name, String? phone, String? profilePicture) onSave;

  const EditableUserDialog({
    super.key,
    required this.name,
    // required this.email,
    this.phone,
    this.profilePicture,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: name);
    // final emailController = TextEditingController(text: email);
    final phoneController = TextEditingController(text: phone ?? '');
    String? updatedProfilePicture = profilePicture;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Profile Picture
            StatefulBuilder(builder: (context, setState) {
              return GestureDetector(
                onTap: () async {
                  final pickedFile = await pickFileFromDevice();
                  setState(
                    () {
                      if (pickedFile != null) {
                        updatedProfilePicture = pickedFile.base64file;
                      }
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: MyColors.scaffoldDefaultColor,
                  backgroundImage: updatedProfilePicture != null
                      ? MemoryImage(
                          base64Decode(
                            updatedProfilePicture!,
                          ),
                        )
                      : const AssetImage('assets/icons/person.png')
                          as ImageProvider,
                  child: updatedProfilePicture == null
                      ? const Icon(
                          Icons.camera_alt,
                          size: 20,
                          color: Colors.white,
                        )
                      : null,
                ),
              );
            }),
            const SizedBox(height: 10),

            CustomTextFormFieldForAddProperty(
              hintText: 'Full Name',
              controller: nameController,
              prefix: Icon(Icons.person),
            ),

            // Email Field
            // CustomTextFormFieldForAddProperty(
            //   hintText: 'Email',
            //   controller: emailController,
            //   prefix: Icon(Icons.email),
            // ),

            // Phone Field
            CustomTextFormFieldForAddProperty(
              hintText: 'Phone (Optional)',
              controller: phoneController,
              prefix: Icon(Icons.phone),
            ),

            const SizedBox(height: 15),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    onSave(
                      nameController.text.trim(),
                      // emailController.text.trim(),
                      phoneController.text.trim().isEmpty
                          ? null
                          : phoneController.text.trim(),
                      updatedProfilePicture,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.orange),
                  child: const Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildTextField({
  //   required TextEditingController controller,
  //   required String label,
  //   required IconData icon,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 5),
  //     child: TextField(
  //       controller: controller,
  //       decoration: InputDecoration(
  //         contentPadding: EdgeInsets.all(15),
  //         hintText: label,
  //         prefixIcon: Icon(icon, color: Colors.orange),
  //         // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  //         filled: true,
  //         fillColor: Colors.grey.shade100,
  //       ),
  //     ),
  //   );
  // }
}
