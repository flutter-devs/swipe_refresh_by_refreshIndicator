import 'package:flutter/material.dart';

class RefreshIndicatorView extends StatefulWidget {
  const RefreshIndicatorView({Key? key}) : super(key: key);

  @override
  _RefreshIndicatorViewState createState() => _RefreshIndicatorViewState();
}

class _RefreshIndicatorViewState extends State<RefreshIndicatorView> {
  int itemCount = 2;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 250,
      backgroundColor: Colors.yellow,
      color: Colors.red,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 1500));
        setState(() {
          itemCount = itemCount + 1;
        });
      },
      child: Scaffold(
        backgroundColor: Color(0xff246df8),
        appBar: AppBar(
          title: Text('Refresh Indicator'),
          backgroundColor: Color(0xff246df8),
        ),
        body: _buildCardDesign(),
      ),
    );
  }

  Widget _buildCardDesign() {
    return Container(
      margin: EdgeInsets.all(5),
      child: ListView.builder(
          itemCount: itemCount,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return _buildCardView();
          }),
    );
  }

  Widget _buildCardView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
          //color: Colors.pinkAccent,
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  "https://s1.1zoom.me/big0/716/Brunette_girl_Hair_Glance_Model_Colored_background_593058_1365x1024.jpg",
                  height: 60.0,
                  width: 60.0,
                  fit: BoxFit.cover,
                ),
              ),
              //SizedBox(width: 20,),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Neelu Modanwal",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Your opinion matters!",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Dev, do you have a moment?We'd love",
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    "4:15 AM",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    // height: 20,
                    // width: 20,
                    margin: EdgeInsets.only(left: 10),
                    //color: Colors.pinkAccent,
                    child: Icon(
                      Icons.star,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
