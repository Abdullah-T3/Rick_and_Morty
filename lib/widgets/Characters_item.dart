import 'package:flutter/material.dart';
import 'package:rick_morty/Constants/Colors.dart';
import 'package:rick_morty/data/Models/characters.dart';

class CharactersItem extends StatelessWidget {
  final Result result;
  const CharactersItem({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: MyColors.myteal,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: GridTile(
        child: Container(
          color: MyColors.myGray,
          child: result.image == null
              ? Image.asset("assets/images/error.gif")
              : FadeInImage.assetNetwork(
                  placeholder: "assets/images/loading.gif",
                  image: result.image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            result.name!,
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
