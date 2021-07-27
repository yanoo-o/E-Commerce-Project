import 'package:farmbili_2/main.dart';
import 'package:flutter/material.dart';
import 'package:farmbili_2/market.dart';
import 'package:farmbili_2/Widgets/widget.dart';



void main() => runApp(new FarmBili());

class FarmBili extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Farm Bili Market',
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Market(),
    );
  }
}
class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome to FarmBili!"),
        backgroundColor: Colors.lightGreen,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,

            ),
            onPressed: (){
            },
          ),
          Align(
            alignment: Alignment.topLeft,
          ),
          ],
        ),
      drawer: NavDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeMarketItem("Promos and Vouchers", Icons.alarm),
            makeMarketItem("Farm 1", Icons.alarm),
            makeMarketItem("Farm 2", Icons.alarm),
            makeMarketItem("Farm 3", Icons.alarm),
            makeMarketItem("Farm 4", Icons.alarm),
            makeMarketItem("Farm 5", Icons.alarm),
          ],
        ),
      ),
    );
  }
}

Card makeMarketItem(String title, IconData icon) {
  return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
        child: new InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                    icon,
                    size: 40.0,
                    color: Colors.black,
                  )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                    style:
                    new TextStyle(fontSize: 18.0, color: Colors.black)),
              )
            ],
          ),
        ),
      ));
}
