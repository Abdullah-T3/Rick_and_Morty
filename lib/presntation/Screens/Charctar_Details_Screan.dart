import 'package:flutter/material.dart';
import 'package:rick_morty/Constants/Colors.dart';
import '../../data/Models/characters.dart';
import '../../widgets/CharacterInfo.dart';

class CharctarDetailsScrean extends StatelessWidget {
  final Result result;
  const CharctarDetailsScrean({Key? key, required this.result})
      : super(key: key);
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGray,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          result.name!,
          style: TextStyle(color: Colors.black),
        ),
        background: Hero(
          tag: result.id!,
          child: Image.network(
            result.image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
  Widget buildDivider(double endIndent) {
    return Divider(
      height: 20,
      color: MyColors.myteal,
      endIndent: endIndent,
       thickness: 3,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGray,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CharacterInfo( "status : ", result.status!),
                      buildDivider(280),
                      CharacterInfo( "species : ", result.gender!),
                      buildDivider(280),

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
