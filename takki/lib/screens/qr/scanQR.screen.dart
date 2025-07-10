import 'package:flutter/material.dart';
import 'package:takki/widgets/button.widget.dart';

class ScanQR extends StatelessWidget {
  const ScanQR({super.key});
  static const String routeName = '/scanQRScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 270,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ButtonWidget(
                text: 'Regresar',
                fontSize: 28,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
