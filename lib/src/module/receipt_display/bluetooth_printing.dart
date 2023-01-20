import 'dart:convert';
import 'dart:typed_data';

import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BluetoothPrinters extends StatefulWidget {
  final Uint8List data;
  const BluetoothPrinters({Key? key, required this.data}) : super(key: key);

  @override
  State<BluetoothPrinters> createState() => _BluetoothPrintersState();
}

class _BluetoothPrintersState extends State<BluetoothPrinters> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;

  bool _connected = false;
  BluetoothDevice? _device;
  String tips = 'no device connect';

  Future<void> initBluetooth() async {
    bluetoothPrint.startScan(timeout: const Duration(seconds: 4));

    bool isConnected = await bluetoothPrint.isConnected ?? false;

    bluetoothPrint.state.listen((state) {
      print('******************* cur device status: $state');
      switch (state) {
        case BluetoothPrint.CONNECTED:
          setState(() {
            _connected = true;
            tips = 'connect success';
          });
          break;
        case BluetoothPrint.DISCONNECTED:
          setState(() {
            _connected = false;
            tips = 'disconnect success';
          });
          break;
        default:
          break;
      }
    });

    if (!mounted) return;

    if (isConnected) {
      setState(() {
        _connected = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initBluetooth());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text('Bluetooth Printers'),
          StreamBuilder<List<BluetoothDevice>>(
            stream: bluetoothPrint.scanResults,
            initialData: [],
            builder: (c, snapshot) => Column(
              children: snapshot.data!.map((d) => ListTile(
                title: Text(d.name??''),
                subtitle: Text(d.address??''),
                onTap: () async {
                  setState(() {
                    _device = d;
                  });
                },
                trailing: _device!=null && _device!.address == d.address? const Icon(
                  Icons.check,
                  color: Colors.green,
                ):null,
              )).toList(),
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlinedButton(
                child: Text('connect'),
                onPressed:  _connected?null:() async {
                  if(_device!=null && _device!.address !=null){
                    setState(() {
                      tips = 'connecting...';
                    });
                    await bluetoothPrint.connect(_device!);
                  }else{
                    setState(() {
                      tips = 'please select device';
                    });
                    print('please select device');
                  }
                },
              ),
              SizedBox(width: 10.0),
              OutlinedButton(
                child: Text('disconnect'),
                onPressed:  _connected?() async {
                  setState(() {
                    tips = 'disconnecting...';
                  });
                  await bluetoothPrint.disconnect();
                }:null,
              ),
            ],
          ),
          const Divider(),
          OutlinedButton(
            child: Text('print receipt(esc)'),
            onPressed:  _connected?() async {
              Map<String, dynamic> config = Map();

              List<LineText> list = [];

              list.add(LineText(type: LineText.TYPE_TEXT, content: '**********************************************', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
              list.add(LineText(type: LineText.TYPE_TEXT, content: '₹ 100.00 细 प्रत्युष 细', weight: 1, align: LineText.ALIGN_CENTER, fontZoom: 2, linefeed: 1));
              list.add(LineText(linefeed: 1));

              list.add(LineText(type: LineText.TYPE_TEXT, content: '----------------------明细---------------------', weight: 1, align: LineText.ALIGN_CENTER, linefeed: 1));
              list.add(LineText(type: LineText.TYPE_TEXT, content: 'प्रत्युष', weight: 1, align: LineText.ALIGN_LEFT, x: 0,relativeX: 0, linefeed: 0));
              list.add(LineText(type: LineText.TYPE_TEXT, content: '单位', weight: 1, align: LineText.ALIGN_LEFT, x: 350, relativeX: 0, linefeed: 0));
              list.add(LineText(type: LineText.TYPE_TEXT, content: '数量', weight: 1, align: LineText.ALIGN_LEFT, x: 500, relativeX: 0, linefeed: 1));

              list.add(LineText(type: LineText.TYPE_TEXT, content: '混凝土C30', align: LineText.ALIGN_LEFT, x: 0,relativeX: 0, linefeed: 0));
              list.add(LineText(type: LineText.TYPE_TEXT, content: '吨', align: LineText.ALIGN_LEFT, x: 350, relativeX: 0, linefeed: 0));
              list.add(LineText(type: LineText.TYPE_TEXT, content: '12.0', align: LineText.ALIGN_LEFT, x: 500, relativeX: 0, linefeed: 1));

              list.add(LineText(type: LineText.TYPE_TEXT, content: '**********************************************', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
              list.add(LineText(linefeed: 1));

              // ByteData data = await rootBundle.load("assets/images/bluetooth_print.png");
              // List<int> imageBytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
              // String base64Image = base64Encode(imageBytes);
              // list.add(LineText(type: LineText.TYPE_IMAGE, content: base64Image, align: LineText.ALIGN_CENTER, linefeed: 1));

              await bluetoothPrint.printReceipt(config, list);
              // await bluetoothPrint.printLabel(config, list1);
            }:null,
          ),
          OutlinedButton(
            child: Text('print selftest'),
            onPressed:  _connected?() async {
              await bluetoothPrint.printTest();
            }:null,
          )
        ],
      ),
    );
  }
}
