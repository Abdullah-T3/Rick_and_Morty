import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/Constants/Colors.dart';
import 'package:rick_morty/Logic/cubit/charcters_cubit.dart';
import 'package:rick_morty/data/Models/characters.dart';
import 'package:rick_morty/widgets/Characters_item.dart';

class HomeScrean extends StatefulWidget {
  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  late List<Result>? allcharacters;

  @override
  void initState() {
    super.initState();

    allcharacters = BlocProvider.of<CharctersCubit>(context).getCharacters();
  }

  Widget buildBloc() {
    return BlocBuilder<CharctersCubit, CharctersState>(
      builder: (context, state) {
        if (state is CharctersLoded) {
          allcharacters = (state).characters;
          return buildLodedList();
        } else {
          return showloading();
        }
      },
    );
  }

  Widget showloading() {
    return Center(
        child: CircularProgressIndicator(
      color: MyColors.myteal,
    ));
  }

  Widget buildLodedList() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGray,
        child: BuildCharactersList(),
      ),
    );
  }

  Widget BuildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: allcharacters!.length,
      itemBuilder: (context, index) {
        return CharactersItem(result: allcharacters![index],);

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myteal,
        title: Text(
          "Rick and Morty",
          style: TextStyle(color: MyColors.myGray),
        ),
        
      ),
      body:  buildBloc(),
    );
  }
}
