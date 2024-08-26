import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../Constants/Colors.dart';
import '../../data/Models/characters.dart';
import '../../widgets/CharacterInfo.dart';

class CharctarDetailsScrean extends StatelessWidget {
  final Result result;
  const CharctarDetailsScrean({super.key, required this.result});
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 700,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGray,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          result.name!,
          style: const TextStyle(color: Colors.white),
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
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CharacterInfo("Status : ", result.status!),
                      buildDivider(MediaQuery.of(context).size.width * 0.75),
                      CharacterInfo("Species : ", result.species!),
                      buildDivider(MediaQuery.of(context).size.width * 0.72),
                      CharacterInfo("Gender : ", result.gender!),
                      buildDivider(MediaQuery.of(context).size.width * 0.74),
                      SizedBox(
                        height: 35,
                      ),
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: MyColors.myteal,
                        ),
                        child: Center(
                          child: AnimatedTextKit(
                            animatedTexts: [
                              WavyAnimatedText('Created by T3MIA'),
                              WavyAnimatedText('Look at the waves'),
                            ],
                            isRepeatingAnimation: true,
                            onTap: () {
                              print("Tap Event");
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 600,
                      )
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
