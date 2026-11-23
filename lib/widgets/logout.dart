import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah kamu yakin ingin logout'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
            },
            child: const Text("Cancel"),
          ),

          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              SystemNavigator.pop();
            },
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      );
    }
  );
}