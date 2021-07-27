import 'package:flutter/material.dart';
import 'package:farmbili_2/Widgets/CheckOut.dart';
import 'package:farmbili_2/constants.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}
class _CartPageState extends State<CartPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Cart", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("123 Magsaysay Ave.,", style: TextStyle(fontSize: 10)),
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade100,
      ),
      body: Builder(
        builder: (context){
          return ListView(
            children: <Widget>[
              createCartList(),
              footer(context)
            ],
          );
        }
      ),
    );
  }
}

footer(BuildContext context) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Text(
                "SubTotal",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Text(
                "Php 50.00",
                style: TextStyle(
                    color: Colors.greenAccent.shade700, fontSize: 14),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Text(
                "Discount",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Text(
                "Php 0.00",
                style: TextStyle(
                    color: Colors.greenAccent.shade700, fontSize: 14),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Text(
                "Delivery Fee",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Text(
                "Php 29.00",
                style: TextStyle(
                    color: Colors.greenAccent.shade700, fontSize: 14),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        ListTile(
          leading: Icon(Icons.confirmation_num),
          title: Text('Apply Vouchers',
          style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
          onTap: () => {},
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Text(
                "Total",
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Text(
                "Php 79.00",
                style: TextStyle(
                    color: Colors.greenAccent.shade700, fontSize: 14),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => CheckOutPage()));
          },
          style: ButtonStyle(
              padding:
              MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
              foregroundColor:
              MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
              MaterialStateProperty.all<Color>(kPrimaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: kPrimaryColor),
                  ))),
          child: Text(
            "Checkout",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 12),
      ],
    ),
    margin: EdgeInsets.only(top: 16),
  );
}

createCartList() {
  return ListView.builder(
    shrinkWrap: true,
    primary: false,
    itemBuilder: (context, position) {
      return createCartListItem();
    },
    itemCount: 1,
  );
}

createCartListItem() {
  return Stack(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  color: Colors.blue.shade200,
                  image: DecorationImage(
                      image: AssetImage("assets/images/eggplant.png"),
                      fit: BoxFit.fill,
                  ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 8, top: 4),
                      child: Text(
                        "Eggplant",
                        maxLines: 2,
                        softWrap: true,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "1 kg",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Php 50.00",
                            style: TextStyle(color: Colors.green),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Icon(
                                  Icons.remove,
                                  size: 24,
                                  color: Colors.grey.shade700,
                                ),
                                Container(
                                  color: Colors.grey.shade200,
                                  padding: const EdgeInsets.only(
                                      bottom: 2, right: 12, left: 12),
                                  child: Text(
                                    "1",
                                    style: TextStyle(fontWeight: FontWeight.w200),
                                  ),
                                ),
                                Icon(
                                  Icons.add,
                                  size: 24,
                                  color: Colors.grey.shade700,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              flex: 100,
            )
          ],
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 10, top: 8),
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: 20,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.green),
        ),
      )
    ],
  );
}

