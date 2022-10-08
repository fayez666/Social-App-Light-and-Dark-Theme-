import 'package:flutter/material.dart';

import '../../../shared/constants.dart';

class HashTag extends StatelessWidget {
  const HashTag({
    Key? key, required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        end: 6.0,
      ),
      child: SizedBox(
        height: 20,
        child: MaterialButton(
            padding: EdgeInsets.zero,
            minWidth: 1,
            onPressed: () {},
            child: Text(
              "#$text",
              style: const TextStyle(color: kPrimaryColor),
            )),
      ),
    );
  }
}
