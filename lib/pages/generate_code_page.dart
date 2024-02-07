import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class GenerateCodePage extends StatefulWidget {
  const GenerateCodePage({super.key});

  @override
  State<GenerateCodePage> createState() => _GenerateCodePageState();
}

class _GenerateCodePageState extends State<GenerateCodePage> {
  String? qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Generate QR Code',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/scan");
            },
            icon: const Icon(
              Icons.qr_code_scanner,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          // children: [
          //   TextField(

          //   ),
          //   if (qrData != null) PrettyQrView.data(data: qrData!),
          // ],
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "https://",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.web),
              ),
              onFieldSubmitted: (value) {
                setState(() {
                  qrData = value;
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your link";
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            if (qrData != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  children: [
                    PrettyQrView.data(data: qrData!),
                    const SizedBox(height: 64),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(MdiIcons.link),
                              const SizedBox(width: 8),
                              const Text("Copy"),
                              const SizedBox(width: 4),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              const SizedBox(width: 4),
                              const Text("Share"),
                              const SizedBox(width: 8),
                              Icon(MdiIcons.share),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
