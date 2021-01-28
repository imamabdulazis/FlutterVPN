import 'package:VarxVPN/presentation/components/utility/palette.dart';
import 'package:VarxVPN/presentation/components/utility/screen_aware.dart';
import 'package:VarxVPN/presentation/components/widget/button_gradient.dart';
import 'package:VarxVPN/presentation/screens/home/local_widget/button_premium.dart';
import 'package:VarxVPN/presentation/screens/home/local_widget/location.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: screenAwareSize(300, context) + 100,
              child: Stack(
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      height: screenAwareSize(300, context),
                      padding: const EdgeInsets.only(
                        top: 40,
                      ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Ink(
                                  decoration: BoxDecoration(
                                    color: Palette.primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        EvaIcons.gridOutline,
                                        size: 35,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                ButtonPremium(
                                  onTap: () {
                                    print("IMAM");
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
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
                            ],
                          ),
                        ],
                      )),
                  buildCenterButton(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 0),
              child: Column(
                children: [
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

                  /// location
                  LocationWidget(),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text('or'),
                  ),
                  const ButtonGradient(
                    title: 'Select The Fastest Server',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildIndicator({
    final Size size,
    final String title,
    final String position,
  }) {
    return Column(
      children: <Widget>[
        Container(
          width: size.width / 2.8,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(15),
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
    );
  }

  Widget buildCenterButton() {
    return Positioned(
      top: screenAwareSize(200, context),
      left: (Get.width - 210) / 2,
      child: Container(
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
                                .copyWith(color: Colors.black, fontSize: 20)),
                        Text('00:06:00',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .button
                                .copyWith(color: Colors.grey, fontSize: 14)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
