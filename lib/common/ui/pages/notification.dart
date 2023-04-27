import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(87, 100, 241, 1.0),
      body: SafeArea(
        child: Column(
          children: [
            _top(),
            _body(),
          ],
        ),
      ),
    );
  }

//--top of the body--
  Widget _top() {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 30, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'COMPANION',
            style: TextStyle(
                fontSize: 28,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 10,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index) {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //--message list--
  Widget _body() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 30),
          physics: BouncingScrollPhysics(),
          children: [
            TextField(
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                hintText: "Search",
                suffixIcon: Icon(Icons.search),
                suffixIconColor: Color.fromRGBO(87, 100, 241, 1.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Notifications",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            _itemChats(
              avatar: 'assets/image/01.png',
              name: 'Maxwell',
              chat: '@somene Liked the post',
              time: 'Yesterday',
            ),
            _itemChats(
              avatar: 'assets/image/03.png',
              name: 'Julia',
              chat: '@somene Liked the post',
              time: '2023.02.01',
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemChats(
      {String avatar = '', name = '', chat = '', time = '00.00'}) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        elevation: 0,
        child: Row(
          children: [
            Avatar(
              margin: EdgeInsets.only(right: 20),
              size: 60,
              image: avatar,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('$name',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold)),
                      Text(
                        '$time',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$chat',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final double size;
  final image;
  final EdgeInsets margin;
  Avatar({this.image, this.size = 50, this.margin = const EdgeInsets.all(0)});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
