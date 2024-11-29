import 'package:breakingapi/constans/colors.dart';
import 'package:breakingapi/data/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Result result;
  const CharacterDetailsScreen({super.key, required this.result});

  Widget sliverAppBarWidget(){
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.grey,
      flexibleSpace: FlexibleSpaceBar(
      title:Text(
          result.name,
          style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
        ),
        background: Hero(
          tag: result.id,
          child: Image.network(
            result.image,
            fit: BoxFit.cover,
          ),
        ),
      ),


    );
  }
  Widget characterInfo(String title,String value){
    return  RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: MyColors.white,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.white,
              fontSize: 16,
            ),
          ),
        ]
      ),

    );

  }
  Widget simpleDivider(double endIndent){
    return  Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.yellow,
      thickness: 2,
    );
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        sliverAppBarWidget(),
        SliverList(delegate: SliverChildListDelegate(
          [
            Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterInfo('job:',result.episode.join('/')),
                  simpleDivider(315),
                  characterInfo('Gender:',result.gender),
                  simpleDivider(315),
                  characterInfo('species:',result.species),
                  simpleDivider(315),
                  characterInfo('species:',result.species),
                  simpleDivider(315),

                ],
              ),
            ),
            const SizedBox(height: 700,)
          ]
        ))
      ],
    );
  }
}
