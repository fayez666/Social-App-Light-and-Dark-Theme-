import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../../models/ChatMessage.dart';


class VideoMessage extends StatelessWidget {
  const VideoMessage({Key? key, required this.message}) : super(key: key);
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/Video Place Here.png"),
            ),
            Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                  color: kPrimaryColor, shape: BoxShape.circle),
              child: const Icon(Icons.play_arrow,size: 20,color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
