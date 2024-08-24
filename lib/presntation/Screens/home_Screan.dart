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
  late List<Result> allcharacters;
  late List<Result> searchedForCharacters;
  bool isSearching = false;
  final searchingTextController = TextEditingController();
//search logic
  Widget BuildSearchField() {
    return TextField(
      controller: searchingTextController,
      cursorColor: MyColors.myGray,
      onChanged: (searchedCharacter) {
        addSearchedForItemToSearchedList(searchedCharacter);
      },
      style: const TextStyle(color: MyColors.myGray, fontSize: 18),
      decoration: const InputDecoration(
        hintText: "find a character",
        hintStyle: TextStyle(
          color: MyColors.myGray,
          fontSize: 18,
        ),
      ),
    );
  }
  void addSearchedForItemToSearchedList(String searchedCharacter) {
    searchedForCharacters = allcharacters.where((character) {
      return character.name!.toLowerCase().startsWith(searchedCharacter);
    }).toList();
    setState(() {
      isSearching = true;
    });
  }
  List<Widget> buildSearchedActions() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              clearSearch();
              Navigator.pop(context);

            },
            icon: Icon(
              Icons.clear_rounded,
              color: MyColors.myGray,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: startSearch,
            icon: Icon(
              Icons.search,
              color: MyColors.myGray,
            ))
      ];
    }
  }
  void  startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    setState(() {
      isSearching = true;
    });
  }
  void stopSearch() {
    setState(() {
      clearSearch();
      isSearching = false;

    });
  }
  void clearSearch() {
    searchingTextController.clear();
  }
  Widget buildappBarTitle() {
    return Text(
      "Rick and Morty",
      style: TextStyle(color: MyColors.myGray),
    );
  }

  // build the UI .............................................................
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharctersCubit>(context).getCharacters();
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
    return const Center(
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: searchingTextController.text.isEmpty? allcharacters!.length:searchedForCharacters.length,
      itemBuilder: (context, index) {
        return CharactersItem(
          result: searchingTextController.text.isEmpty? allcharacters![index]:searchedForCharacters[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myteal,
        leading: isSearching ? BackButton(color: MyColors.myGray,) : Container(),
        title: isSearching ? BuildSearchField() : buildappBarTitle(),
        actions:buildSearchedActions(),
      ),
      body: buildBloc(),
    );
  }
}
