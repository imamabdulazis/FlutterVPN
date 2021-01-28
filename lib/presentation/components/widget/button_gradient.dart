import 'package:VarxVPN/presentation/components/utility/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonGradient extends StatelessWidget {
  const ButtonGradient({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
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
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                const Icon(
                  CupertinoIcons.globe,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .button
                      .copyWith(color: Colors.white),
                ),
              ],
            )),
      ),
    );
  }
}
