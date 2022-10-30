import 'package:flutter/material.dart';
import 'package:online_shopping_ui_app/constant/data_json.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class MyIcons {
  MyIcons._();
  static const IconData star_outline_rounded = IconData(0xf01d1, fontFamily: 'MaterialIcons');
}
class _HomePageState extends State<HomePage> {
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }
  Widget getBody(){
    var size = MediaQuery.of(context).size;
    return SafeArea(
          child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Categories",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ),),
                Row(
                  children: <Widget>[
                    SizedBox(width: 15,),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
                      child: Padding(
              padding: const EdgeInsets.only(right: 20,left: 20),
              child: Row(children: List.generate(menuItems.length, (index){
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: (){
                    setState(() {
                       activeMenu = index;
                    });
                    },
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                    child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        children: <Widget> [
                          new Container(
                              padding: new EdgeInsets.only(right: 5),
                               child: CircleAvatar(
                                 child: new Tab(icon: new Image.network(menuItems[index]['icon'],height: 30,width: 38,)),
                                backgroundColor: new Color(0xFFF5F5F5),
                                radius: 35.0,
                              ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                            child: Text(menuItems[index]['title'].toString()),
                        ),
                        ],
                      ),
                    ),
                  ),
                  ),
                  ),
                );
              })
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 30,
                left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Best Selling",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                ),),
                Row(
                  children: <Widget>[
                    SizedBox(width: 15,),
                  ],
                ),
                new Text("See all", style: new TextStyle(fontSize: 20, fontWeight: FontWeight.w400),  textAlign: TextAlign.right,),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Wrap(
            children: List.generate(dataItems.length, (index){
              return InkWell(
                onTap: (){
                },
                child: Card(
            elevation: 2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: dataItems[index]['id'].toString(),
                    child: Container(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all( 4.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.star_outline_rounded, color: Colors.black),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(13),
                              backgroundColor: Colors.white, // <-- Button color
                              foregroundColor: Colors.grey, // <-- Splash color
                            ),
                          ),
                        ),
                      ),
                      width: (size.width-16)/2,
                      height: (size.width-16)/2,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(dataItems[index]['img']),fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(dataItems[index]['code'],style: TextStyle(
                        fontWeight: FontWeight.w600,
                      fontSize: 16
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2,left: 15),
                    child: Text(dataItems[index]['subtitle'],style: TextStyle(
                        fontSize: 13,
                      color: Colors.grey
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(dataItems[index]['currency'].toString()+" "+dataItems[index]['price'].toString(),style: TextStyle(
                      color: Colors.green,
                      fontSize: 16
                    ),),
                  ),
                  SizedBox(height: 10,),
                ],
            )
          ),
              );
            }),
          )
        ],
      ),
    );
  }
}