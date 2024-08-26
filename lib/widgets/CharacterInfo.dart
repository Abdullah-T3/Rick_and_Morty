import 'package:flutter/material.dart';

import '../Constants/Colors.dart';

Widget CharacterInfo( String title,  value) {
  return RichText(
    maxLines:  1,
    overflow: TextOverflow.ellipsis,
    text:
    TextSpan(
      children: [
        TextSpan(
          text: title,
          style: TextStyle(
            color: MyColors.myWhite,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: value ,
          style: TextStyle(
            color: MyColors.myWhite,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}