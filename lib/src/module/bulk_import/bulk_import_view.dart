import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/loading.dart';
import 'bloc/bulk_import_bloc.dart';

class BulkImportView extends StatelessWidget {
  const BulkImportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<BulkImportBloc, BulkImportState>(
      listener: (context, state) {
        if (state.status == BulkImportStatus.loading) {
          showLoadingDialog(context);
        } else if (state.status == BulkImportStatus.success) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("success".tr()),
            ),
          );
        }
      },
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 20,
                  left: 16,
                  child: AppBarLeading(
                    heading: "_bulkImport",
                    icon: Icons.arrow_back,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                // const Positioned(top: 60, child: WorkSheet()),
                Positioned(
                  top: 80,
                  left: 8,
                  right: 8,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            alignment: WrapAlignment.start,
                            children: [
                              UploadBulkFileButton(
                                type: "Tax",
                                extension: const ["json"],
                                onChoose: (path) {
                                  BlocProvider.of<BulkImportBloc>(context)
                                      .add(BulkTaxImportEventImport(filePath: path));
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UploadBulkFileButton extends StatelessWidget {
  final String type;
  final List<String> extension;
  final Function? onChoose;
  const UploadBulkFileButton(
      {Key? key, required this.type, required this.extension, this.onChoose})
      : super(key: key);

  onUpload(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: extension);

    if (result != null) {
      String? path = result.files.single.path;
      if (path != null && onChoose != null) {
        onChoose!(path);
      }
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onUpload(context);
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColor.color8,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColor.primary),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Container(
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.upload,
              size: 40,
              color: AppColor.primary,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              type,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ).tr()
          ],
        ),
      ),
    );
  }
}
