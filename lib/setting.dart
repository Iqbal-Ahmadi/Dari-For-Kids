// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:preschool_flutter/widgets/appbar.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _ison = false;
  void _toggleSwitch(bool value) {
    setState(() {
      _ison = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: 'Setting', onpress: () => Navigator.pop(context)),
      body: ListView(
        children: [
          ListTile(
            leading: Image.asset('assets/icons/ic_sound.png'),
            title: Text('Sound'),
            trailing: Switch(
              value: _ison,
              onChanged: _toggleSwitch,
              activeColor: Colors.green,
              inactiveThumbColor: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}