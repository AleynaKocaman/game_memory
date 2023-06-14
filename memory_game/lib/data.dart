import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

List<String> fillsourceArray(){
  return [
    'assets/images/cat.png',
    'assets/images/cat.png',
    'assets/images/chameleon.png',
    'assets/images/chameleon.png',
    'assets/images/chick.png',
    'assets/images/chick.png',
    'assets/images/cow.png',
    'assets/images/cow.png',
    'assets/images/dog.png',
    'assets/images/dog.png',
    'assets/images/fox.png',
    'assets/images/fox.png',
    'assets/images/koala.png',
    'assets/images/koala.png',
    'assets/images/lion.png',
    'assets/images/lion.png',
    'assets/images/rat.png',
    'assets/images/rat.png',
  ];
}

enum Level{Hard,Medium,Easy}
List<String> getSourceArray(Level level){

  List<String> levellist=[];
  List sourceArray=fillsourceArray();
  if(level==Level.Hard){
    sourceArray.forEach((element) {
      levellist.add(element);
    });
  }else if(level==Level.Medium){
    for(int i=0;i<12;i++){
      levellist.add(sourceArray[i]);
    }
  }else if(level==Level.Easy){
    for(int i=0;i<6;i++){
      levellist.add(sourceArray[i]);
    }
  }
  levellist.shuffle();
  return levellist;
}


List<bool> getInitialitemState(Level level){
  List<bool> initialitemstate=[];
  if(level==Level.Hard){
    for(int i=0; i<18;i++){
      initialitemstate.add(true);
    }
  }else if(level==Level.Medium){
    for(int i=0; i<18;i++){
      initialitemstate.add(true);
    }
  }else if(level==Level.Easy){
    for(int i=0; i<18;i++){
      initialitemstate.add(true);
    }
  }return initialitemstate;
}
List<GlobalKey<FlipCardState>> getCardStateKeys(Level level){
  List<GlobalKey<FlipCardState>> cardstateKeys=[];
  if(level==Level.Hard){
    for(int i=0;i<18;i++){
      cardstateKeys.add(GlobalKey<FlipCardState>());
    }
  }else   if(level==Level.Medium){
    for(int i=0;i<12;i++){
      cardstateKeys.add(GlobalKey<FlipCardState>());
    }
  }else   if(level==Level.Easy){
    for(int i=0;i<6;i++){
      cardstateKeys.add(GlobalKey<FlipCardState>());
    }
  }return cardstateKeys;}