import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListPageState();
}

class _Action {
  String title;
  VoidCallback action;
  _Action(this.title, this.action);
}

class _ListPageState extends State<ListPage> {
  int itemCount = 0;
  static int Action4Count = 0;

  ScrollController _scrollController;

//  final List<String> actions = ['创建100', '滚动到中间', '滚动到顶', '添加 1', '添加 100', '删除 100', '更新 1', '更新 100'];
  List<_Action> actions = [];
  List<_Item> items = [];
  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _Action action_1 = _Action('创建100', () {
      itemCount = 100;
      List<_Item> temp = [];
      for (int i = 0; i < itemCount; i++) {
        items.add(_Item('AIR Restaurant - $i'));
      }
      setState(() {});
    });
    _Action action_2 = _Action('滚动到中间', () {
      double middle = itemCount / 2;
      _scrollController.animateTo(middle * 127, duration: new Duration(seconds: 1), curve: Curves.ease);
    });
    _Action action_3 = _Action('滚动到顶', () {
      _scrollController.animateTo(0.0, duration: new Duration(seconds: 1), curve: Curves.ease);
    });
    _Action action_4 = _Action('添加 1', () {
      items.insert(0, _Item('AIR Restaurant - ${Action4Count}.1'));
      itemCount++;
      setState(() {});
    });
    _Action action_5 = _Action('添加 100', () {
      int currentCount = items.length + 1;
      for (int i = 0; i < 100; i++) {
        items.add(_Item('AIR Restaurant - ${currentCount + i}'));
      }
      itemCount += 100;
      setState(() {});
    });
    _Action action_6 = _Action('删除 100', () {
      if (itemCount >= 100) {
        items.removeRange(0, 99);
      }
      itemCount -= 100;
      setState(() {});
    });
    _Action action_7 = _Action('更新 1', () {
      _Item first = items[0];
      first.title = 'Updated Title';
      items.removeAt(0);
      items.insert(0, first);
      setState(() {});
    });
    _Action action_8 = _Action('更新 100', () {
      if (itemCount < 100) return;
      _Item first = items[99];
      first.title = 'Updated Title';
      items.removeAt(99);
      items.insert(99, first);
      setState(() {});
    });
    actions = [action_1, action_2, action_3, action_4, action_5, action_6, action_7, action_8];
  }

  void tap(_Action action) {
    action.action();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4),
            child: Wrap(
              runSpacing: 4,
              spacing: 2,
              children: <Widget>[
                for (var action in actions)
                  Container(
                    child: GestureDetector(
                      onTap: () => tap(action),
                      child: Text(action.title),
                    ),
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                  )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              controller: _scrollController,
              itemCount: itemCount,
              cacheExtent: 127,
              itemBuilder: (context, index) => createListCell(items[index].title),
              separatorBuilder: (context, index) => Divider(
                height: 1.0,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createListCell(String title) {
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
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            style: titleStyle,
                          ),
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

class _Item {
  String title;
  _Item(this.title);
//  String desc;
  //...
}
