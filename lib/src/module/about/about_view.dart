import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

import '../../config/theme_settings.dart';
import '../../database/db_provider.dart';
import '../../widgets/appbar_leading.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AboutView();
  }
}

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.background,
          body: Stack(
            fit: StackFit.expand,
            children: [
              const AboutScreenComponentList(),
              Positioned(
                top: 20,
                left: 16,
                child: AppBarLeading(
                  heading: 'About',
                  icon: Icons.arrow_back,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutScreenComponentList extends StatelessWidget with DatabaseProvider {
  const AboutScreenComponentList({Key? key}) : super(key: key);

  Future<String> calculateSizeOfDirectory(BuildContext context) async {
    final appDoc = await getApplicationSupportDirectory();
    final temDir = await getTemporaryDirectory();
    String dirPath = appDoc.path;
    int fileNum = 0;
    int totalSize = 0;
    var dir = Directory(dirPath);
    try {
      if (dir.existsSync()) {
        dir
            .listSync(recursive: true, followLinks: false)
            .forEach((FileSystemEntity entity) {
          if (entity is File) {
            fileNum++;
            totalSize += entity.lengthSync();
          }
        });
      }
    } catch (e) {
      // print(e.toString());
    }

    var tmpDiPath = Directory(temDir.path);
    try {
      if (tmpDiPath.existsSync()) {
        tmpDiPath
            .listSync(recursive: true, followLinks: false)
            .forEach((FileSystemEntity entity) {
          if (entity is File) {
            fileNum++;
            totalSize += entity.lengthSync();
          }
        });
      }
    } catch (e) {
      // print(e.toString());
    }

    // return {'fileNum': fileNum, 'size': totalSize};
    return '${(totalSize / (1024 * 1024)).toStringAsFixed(2)} MB | $fileNum files';
  }

  Future<String> calculateDatabaseSize(BuildContext context) async {
    final size = await db.getSize(includeIndexes: true, includeLinks: true);
    return "${(size / (1024 * 1024)).toStringAsFixed(2)} MB";
  }

  Future<String> getApplicationVersion(BuildContext context) async {
    final info = await PackageInfo.fromPlatform();
    return '${info.version} (${info.buildNumber})';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            AboutScreenCard(
              child: InfoWidget(
                label: 'Version',
                future: getApplicationVersion,
              ),
            ),
            AboutScreenCard(
              child: InfoWidget(
                label: 'Database Size',
                future: calculateDatabaseSize,
              ),
            ),
            AboutScreenCard(
              child: InfoWidget(
                label: 'Size',
                future: calculateSizeOfDirectory,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  final String label;
  final Future<String> Function(BuildContext context) future;
  const InfoWidget({Key? key, required this.label, required this.future})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColor.primary),
        ),
        const SizedBox(
          height: 6,
        ),
        FutureBuilder(
          future: future(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data.toString(),
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary),
              );
            } else {
              return const Text(
                "Calculating......",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary),
              );
            }
          },
        ),
      ],
    );
  }
}

class AboutScreenCard extends StatelessWidget {
  final Widget child;
  const AboutScreenCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: AppColor.color8,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
