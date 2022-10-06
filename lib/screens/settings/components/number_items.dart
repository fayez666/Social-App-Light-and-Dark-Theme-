import 'package:flutter/material.dart';

class NumberItems extends StatelessWidget {
  const NumberItems({
    Key? key,
    required this.number,
    required this.text,
  }) : super(key: key);

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Text(
              "$number",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.8)),
            ),
          ],
        ),
      ),
    );
  }
}
