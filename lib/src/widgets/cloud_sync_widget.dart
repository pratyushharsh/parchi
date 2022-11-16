import 'package:flutter/material.dart';

class CloudSyncIcon extends StatelessWidget {
  final int syncState;
  const CloudSyncIcon({Key? key, required this.syncState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (syncState == 0) {
      return const Icon(Icons.cloud_off, color: Colors.grey, size: 15);
    } else if (syncState == 1000) {
      return const Icon(Icons.cloud_done, color: Colors.green, size: 15);
    } else if (syncState == 500) {
      return const Icon(Icons.cloud_upload, color: Colors.orange, size: 15);
    } else if (syncState == 3) {
      return const Icon(Icons.cloud_off, color: Colors.red, size: 15);
    }
    return const Icon(Icons.cloud_off, color: Colors.grey, size: 15);
  }
}
