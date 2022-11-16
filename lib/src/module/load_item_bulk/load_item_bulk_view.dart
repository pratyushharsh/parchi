import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../config/theme_settings.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/loading.dart';
import 'bloc/load_item_bulk_bloc.dart';


class LoadItemInBulk extends StatelessWidget {
  const LoadItemInBulk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoadItemBulkBloc, LoadItemBulkState>(
      listener: (context, state) {
        if ( LoadItemBulkStatus.success == state.status ||
            LoadItemBulkStatus.failure == state.status) {
          Navigator.of(context).pop();
        } else if (LoadItemBulkStatus.loading == state.status) {
          showLoadingDialog(context);
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
                    heading: "Bulk Import",
                    icon: Icons.arrow_back,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          SizedBox(
                            height: 30,
                          ),
                          DownloadSampleFileButton(),
                          SizedBox(
                            height: 50,
                          ),
                          UploadFileButton(),
                          SizedBox(
                            height: 30,
                          ),
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

class UploadFileButton extends StatelessWidget {
  const UploadFileButton({Key? key}) : super(key: key);

  onUpload(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["csv"]);

    if (result != null) {
      String? path = result.files.single.path;
      if (path != null) {
        BlocProvider.of<LoadItemBulkBloc>(context).add(ProcessFile(path));
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
        elevation: 0, backgroundColor: AppColor.color8,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColor.primary),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: SizedBox(
        width: 150,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.upload,
              size: 40,
              color: AppColor.primary,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Upload Your Files",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class DownloadSampleFileButton extends StatelessWidget {
  const DownloadSampleFileButton({Key? key}) : super(key: key);

  generateSampleCsv() async {
    List<List<String>> data = [
      [
        "ProductId",
        "Display Name",
        "Description*",
        "List Price",
        "Sale Price",
        "Unit Of Measure",
        "Brand",
        "Sku Code",
        "HSN",
        "Tax Rate",
        "Image Url"
      ],
      [
        "700000001",
        "Apple 20W USB-C Power Adapter"
        "Apple 20W USB-C Power Adapter. 2O W, 768 12313",
        "1899.00",
        "899.00",
        "SQF",
        "Century",
        "FG546",
        "45647764",
        "18",
        ""
      ],
    ];
    String csvData = const ListToCsvConverter().convert(data);
    // final dir =
    // (await getExternalStorageDirectories(type: StorageDirectory.downloads));
    final ext = (await getTemporaryDirectory());
    // final Directory? down = (await getDownloadsDirectory());
    // final Directory? app = (await getApplicationSupportDirectory());
    // final String directory = down != null ? down.path : (await getApplicationSupportDirectory()).path;
    // const String directory = '/storage/emulated/0/Download/';
    final path = "${ext.path}/sample_product_data.csv";
    final File file = File(path);
    await file.writeAsString(csvData);
    Share.shareFiles([file.path]);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        generateSampleCsv();
      },
      child: SizedBox(
        width: 150,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.file_copy_outlined,
              size: 40,
              color: AppColor.color8,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Download Sample File",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColor.color8,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0, backgroundColor: AppColor.primary,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
