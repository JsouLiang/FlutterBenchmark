import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => createListCell(),
        itemCount: 100,
        separatorBuilder: (context, index) => Divider(
          height: 1.0,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget createListCell() {
    List<String> tags = ["距离近", "味道赞", "回头客超多", "回头客超多", "回头客超多", "回头客超多"];
    TextStyle style = TextStyle(fontSize: 15, height: 1.2);
    TextStyle titleStyle = style.copyWith(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w600);
    TextStyle descStyle = style.copyWith(fontSize: 11, color: Colors.black54, fontWeight: FontWeight.w500);
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image(
                width: 75,
                height: 75,
                image: NetworkImage(
                    "http://p0.meituan.net/deal/aa5dc7dede835470b48429f5ab9caad6134871.jpg@267h_267w_2e_90q|200w_200h_1e_1c"),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /// Title Line
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "AIR Restaurant",
                          style: titleStyle,
                        ),
                        Text("3.3km", style: descStyle)
                      ],
                    ),
                  ),

                  /// Desc Line
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Text('描述描述描述描述描述描述描述描述描述描述描述描述描述描述', style: descStyle),
                  ),

                  /// Info Line
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                            text: '￥500',
                            style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 18, fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(text: '   ', style: descStyle),
                              TextSpan(text: '门市价: ￥1304', style: descStyle)
                            ]),
                      ),
                      Text('已售 135', style: descStyle),
                    ],
                  ),

                  /// Wrap
                  Wrap(
                    spacing: 4.0,
                    runSpacing: 2.0,
                    children: <Widget>[for (var str in tags) createTag(str)],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createTag(String title) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 254, 240, 214),
          border: Border.all(color: const Color.fromARGB(255, 247, 177, 82), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(3.0))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 1, 4, 2),
        child: Text(
          '$title',
          style: TextStyle(color: const Color.fromARGB(255, 247, 177, 82), fontSize: 10),
        ),
      ),
    );
  }
}
