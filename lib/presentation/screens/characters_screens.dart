import 'package:breakingapi/business_layer/cubit/characters_cubit.dart';
import 'package:breakingapi/constans/colors.dart';
import 'package:breakingapi/data/models/character_model.dart';
import 'package:breakingapi/presentation/widgets/character_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  //late List<CharacterModel>allCharacter;
  late List<Result>allResult;
  late List<Result>searchedResult;
  final _searchController=TextEditingController();

  @override
  void initState() {
    super.initState();
    allResult = [];
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }
  Widget searchField(){
    return Container(

      decoration: BoxDecoration(
        color: Colors.grey,
        
        borderRadius: BorderRadius.circular(20)
      ),

      child: TextField(

        controller: _searchController,
        cursorColor: MyColors.grey,

        decoration: InputDecoration(
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
           hintText: "search",
            hintStyle: TextStyle(fontSize: 16,color: Colors.black87),
        ),
        onChanged: (searchedForResult){
          addSearchedItem(searchedForResult);
        },
      ),
    );
  }
  void addSearchedItem(String searchedForResult){
    searchedResult=
        allResult.where((character) =>character.name.toLowerCase().startsWith(searchedForResult) ).toList();
    setState(() {


    });

  }
  Widget blocWidget(){
    return BlocBuilder<CharactersCubit,CharactersState>(builder: (context,state){
      if(state is CharactersLoaded){
        allResult=(state).characters.cast<Result>();
        return loadedCharactersWidget();
      }else{
        return const Center(
          child: CircularProgressIndicator(color: MyColors.yellow,),
        );
      }

    });
  }
  Widget loadedCharactersWidget(){
    return Container(
      color: MyColors.grey,
      child: Stack(
        children:[

          SingleChildScrollView(
            child: Column(
            children: [
              SizedBox(height: 20,),
              SizedBox(height: 40),
              characterList(),
            ],
                      ),
          ),
          searchField(),

        ]
      ),
    );
  }
  Widget characterList(){
    return GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 2/3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1
    ),shrinkWrap: true,
      itemCount:_searchController.text.isEmpty? allResult.length:searchedResult.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
      return  CharacterItem(result:_searchController.text.isEmpty? allResult[index]:searchedResult[index],);
    },

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:MyColors.yellow,
        title: const Text("Character",style: TextStyle(color: MyColors.grey),),
      ),
      body: blocWidget(),
    );
  }
}
