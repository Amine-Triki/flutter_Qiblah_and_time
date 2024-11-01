import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../generated/l10n.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({super.key});

  @override
  _QiblahScreenState createState() => _QiblahScreenState();
}

class _QiblahScreenState extends State<QiblahScreen> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  void initState() {
    super.initState();
    requestLocationPermission(); // طلب إذن الموقع عند بدء الشاشة
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isDenied) {
      // التعامل مع حالة الرفض
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("يجب منح إذن الموقع لاستخدام التطبيق")));
    }
    if (status.isPermanentlyDenied) {
      // فتح إعدادات الجهاز لتمكين الأذونات
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _deviceSupport,
      builder: (context, AsyncSnapshot<bool?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || !snapshot.data!) {
          return Center(child: Text("الجهاز لا يدعم مستشعر القبلة"));
        } else {
          return QiblahCompass();
        }
      },
    );
  }
}

class QiblahCompass extends StatelessWidget {
  const QiblahCompass({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QiblahDirection>(
      stream: FlutterQiblah.qiblahStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text(
            S.of(context).permision,
            maxLines: 3,
            softWrap: true,
          );
        } else {
          final qiblahDirection = snapshot.data!;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // الخط الأخضر الدال على اتجاه القبلة
                  Positioned(
                    top: 0, // تعديل المسافة لزيادة وضوح الخط
                    child: Container(
                      width: 2,
                      height: 10, // طول الخط
                      color: Colors.green,
                    ),
                  ),
                  // السهم الذي يشير لاتجاه القبلة
                  Transform.rotate(
                    angle: qiblahDirection.qiblah * (3.14159 / 180),
                    child: Icon(
                      Icons.navigation,
                      size: 100,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
