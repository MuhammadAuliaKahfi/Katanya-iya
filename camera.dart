import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late List<CameraDescription> cameras;
  late CameraDescription camera;
  Widget? cameraPreview;
  late Image image;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    setCamera().then((_) {
      _controller = CameraController(
        camera,
        ResolutionPreset.medium,
      );
      _controller.initialize().then((snapshot) {
        cameraPreview = Center(child: CameraPreview(_controller));
        setState(() {
          cameraPreview = cameraPreview;
        });
      });
    });
    super.initState();
  }

  Future setCamera() async {
  cameras = await availableCameras();
  camera = cameras.first;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Camera")),
      body: cameraPreview,
    );
  }
}
