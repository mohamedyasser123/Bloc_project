import 'package:breakingapi/constans/colors.dart';
import 'package:breakingapi/data/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Result result;
  const CharacterItem({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,

          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          color: Colors.black87,
          alignment: Alignment.bottomCenter,
          child: Text(result.name,
          style: const TextStyle(
            height: 1.3,
            fontSize: 16,
            color: MyColors.white,
            fontWeight: FontWeight.bold
          ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: MyColors.grey,

          child:Image.network(result.image,fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
