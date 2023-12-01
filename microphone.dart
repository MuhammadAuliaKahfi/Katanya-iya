import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class MicrophoneScreen extends StatefulWidget {
  const MicrophoneScreen({Key? key}) : super(key: key);

  @override
  _MicrophoneScreenState createState() => _MicrophoneScreenState();
}

class _MicrophoneScreenState extends State<MicrophoneScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Microphone"),
      ),
      body: Center(
        child: Text("Microphone Page Content"),
      ),
    );
  }
}
