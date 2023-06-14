import 'package:flutter/material.dart';
import 'package:slide_puzzle/flipcardgame.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title: Text(
            "HAFIZA OYUNU",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        flexibleSpace: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 125,
              ),
              SizedBox(
                height: 1000,
                child: ListView.builder(
                   physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                itemCount: _list.length,
                itemBuilder: (context, index) {

                    return GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => _list[index].goto!,
                        ));
                  },//ontap
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color:_list[index].secomdaryColor,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    color: Colors.black45,
                                    spreadRadius: 0.5,
                                    offset: Offset(3, 4))
                              ]),
                        ),

                        Container(
                          height: 90,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color:_list[index].primaryColor,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    color: Colors.black12,
                                    spreadRadius: 0.3,
                                    offset: Offset(5,3))
                              ]),
                          child: Column(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  _list[index].name,
                                  style:TextStyle(
                                      color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black26,
                                        blurRadius: 2,
                                        offset: Offset(1,2)
                                      ),
                                      Shadow(
                                        color: Colors.green,
                                        blurRadius: 2,
                                        offset: Offset(0.5,2)
                                      ),
                                    ]

                                  ) ,

                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:genratestar(_list[index].noOfstar),//_list[index].noOfstar
                              )],
                          ),
                        ),],
                    ),
                  ),
                );},
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }


  List<Widget> genratestar(int no){
    List<Widget> _icons=[];
    for(int i=0;i<no;i++){
      _icons.insert(
          i, 
          Icon(
            Icons.star,
            color: Colors.yellow,
          ));
    }
    return _icons;
  }
}

class Details{
  String name;
  Color? primaryColor;
  Color? secomdaryColor;
  Widget? goto;
  int noOfstar;
  Details({this.name="",this.primaryColor,this.secomdaryColor,this.noOfstar=0,this.goto});
}

List<Details> _list=[
  Details(name:"Kolay Seviye",primaryColor:Colors.green,secomdaryColor:Colors.green[200],noOfstar: 1,goto: FlipCardGame(Level.Easy)),
  Details(name:"Orta Seviye",primaryColor:Colors.orange[300],secomdaryColor:Colors.orange,noOfstar:2,goto: FlipCardGame(Level.Medium)),
  Details(name:"Zor Seviye",primaryColor:Colors.red,secomdaryColor:Colors.red[300],noOfstar:3,goto: FlipCardGame(Level.Hard)),
];
