import 'package:breakingapi/business_layer/cubit/characters_cubit.dart';
import 'package:breakingapi/constans/colors.dart';
import 'package:breakingapi/data/models/character_model.dart';
import 'package:breakingapi/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  //late List<CharacterModel>allCharacter;
  late List<Result>allResult;

  @override
  void initState() {
    super.initState();
    allResult = [];
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
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
    return SingleChildScrollView(
      child: Container(
        color: MyColors.grey,
        child: Column(
          children: [
            characterList(),
          ],
        ),
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
      itemCount: allResult.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
      return  CharacterItem(result: allResult[index],);
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
