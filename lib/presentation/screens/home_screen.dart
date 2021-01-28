import 'package:VarxVPN/presentation/components/utility/palette.dart';
import 'package:VarxVPN/presentation/components/utility/screen_aware.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<bool> isConnecting = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: screenAwareSize(300, context),
              decoration: BoxDecoration(
                  color: Palette.primaryColor.withOpacity(0.9),
                  image: const DecorationImage(
                    image: AssetImage('assets/img/map.png'),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  )),
            ),
            buildIndicator(
              size: size,
              position: 'left',
              title: 'Upload',
            ),
            buildIndicator(
              size: size,
              position: 'right',
              title: 'Download',
            ),
            buildCenterButton(),
          ],
        ));
  }

  Widget buildIndicator({
    final Size size,
    final String title,
    final String position,
  }) {
    return Positioned(
      top: 100,
      left: position == 'left' ? 20 : null,
      right: position == 'right' ? 20 : null,
      child: Column(
        children: <Widget>[
          Container(
            width: size.width / 2.8,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: position == 'left'
                        ? Palette.primaryColor
                        : Palette.pinkColor,
                  ),
                  child: const Icon(
                    CupertinoIcons.antenna_radiowaves_left_right,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  position == 'left' ? 'Upload' : 'Download',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .button
                      .copyWith(color: Palette.primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCenterButton() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 210.0,
            height: 210.0,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: CupertinoColors.extraLightBackgroundGray,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: <double>[0.1, 0.5, 0.9],
                    colors: <Color>[
                      Palette.primaryColor,
                      Palette.accentColor,
                      Palette.pinkColor,
                    ],
                  ),
                ),
                // child: Align(
                //   alignment: Alignment.center,
                //   child: SpinKitRipple(
                //     color: Colors.white,
                //     size: 190.0,
                //   ),
                // ),
                child: Align(
                  alignment: Alignment.center,
                  child: Material(
                    borderRadius: BorderRadius.circular(150),
                    color: Colors.white,
                    child: Ink(
                      width: 140.0,
                      height: 140.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(150),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(150),
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              CupertinoIcons.power,
                              size: 30,
                              color: Palette.pinkColor,
                            ),
                            const SizedBox(height: 10),
                            Text('STOP',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .button
                                    .copyWith(
                                        color: Colors.black, fontSize: 20)),
                            Text('00:06:00',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .button
                                    .copyWith(
                                        color: Colors.grey, fontSize: 14)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          ///other [Content]
          RichText(
            text: const TextSpan(
              text: 'Status : ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 20,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Connected',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.pinkColor,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
