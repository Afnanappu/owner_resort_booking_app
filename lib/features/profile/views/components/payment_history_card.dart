import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/utils/custom_date_formats.dart';

class PaymentHistoryCard extends StatelessWidget {
  final String userName;
  final String? profile;
  final double amount;
  final String transactionDate;
  final String status;

  const PaymentHistoryCard({
    super.key,
    required this.userName,
    required this.profile,
    required this.amount,
    required this.transactionDate,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar with the first letter of the user's name
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFB6E34), Color(0xFFFBAE34)],
              ),
              borderRadius: BorderRadius.circular(25),
              image: profile == null
                  ? null
                  : DecorationImage(
                      image: MemoryImage(
                        base64Decode(profile!),
                      ),
                    ),
            ),
            child: Center(
              child: Text(
                userName[0].toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          // Column with the user's name, amount, and transaction date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User's name and transaction amount
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${switch (status.toLowerCase()) {
                        'credited' => '+',
                        'debited' => '-',
                        'failed' => '',
                        String() => '',
                      }} ${customCurrencyFormat(amount)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: switch (status.toLowerCase()) {
                          'credited' => Colors.green,
                          'debited' => Colors.red,
                          'failed' => Colors.grey,
                          String() => Colors.blue,
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Transaction date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      transactionDate,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: switch (status.toLowerCase()) {
                          'credited' => Colors.green.withValues(alpha: 0.1),
                          'debited' => Colors.red.withValues(alpha: 0.1),
                          'failed' => Colors.grey.withValues(alpha: 0.1),
                          String() => Colors.blue.withValues(alpha: 0.1),
                        },
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        status.toUpperCase(),
                        style: TextStyle(
                          color: switch (status.toLowerCase()) {
                            'credited' => Colors.green,
                            'debited' => Colors.red,
                            'failed' => Colors.grey,
                            String() => Colors.blue,
                          },
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
