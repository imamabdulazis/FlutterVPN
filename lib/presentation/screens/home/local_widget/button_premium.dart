import 'package:VarxVPN/presentation/components/utility/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPremium extends StatelessWidget {
  const ButtonPremium({Key key, this.onTap}) : super(key: key);
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Palette.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white.withOpacity(0.6),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              const Icon(
                CupertinoIcons.money_dollar,
                color: Colors.amber,
                size: 25,
              ),
              Text(
                'Go Premium',
                style: Theme.of(context).primaryTextTheme.button.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
