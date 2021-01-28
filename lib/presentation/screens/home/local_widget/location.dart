import 'package:VarxVPN/presentation/components/utility/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationWidget extends StatefulWidget {
  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: Get.width - 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Select Location',
            style: Theme.of(context).primaryTextTheme.button.copyWith(
                  color: Palette.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/img/us.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 10),
                Text('USA'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
