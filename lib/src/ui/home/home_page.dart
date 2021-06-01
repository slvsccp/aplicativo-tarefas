import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Redux"),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          _BottomNavigationBar(
            currentIndex: currentIndex,
            onItemTap: (i) => setState(() => currentIndex = i),
            items: <Icon>[
              Icon(Icons.description),
              Icon(Icons.check_circle),
              Icon(Icons.search),
            ],
          ),
          _AddButton(
            icon: Icon(Icons.add),
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final Function(int) onItemTap;
  final List<Icon> items;
  final int currentIndex;

  const _BottomNavigationBar(
      {@required this.items,
      @required this.onItemTap,
      @required this.currentIndex})
      : assert(items != null),
        assert(onItemTap != null),
        assert(currentIndex != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items.map((icon) {
        final index = items.indexOf(icon);
        final isSelected = (index == currentIndex);

        return IconButton(
          icon: icon,
          color: isSelected ? Theme.of(context).accentColor : Colors.grey,
          onPressed: () => onItemTap(index),
        );
      }).toList(),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Icon icon;
  final GestureTapCallback onTap;

  const _AddButton({
    @required this.onTap,
    @required this.icon
    }) :  assert(onTap != null),
          assert(icon != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor, 
          shape: BoxShape.circle
      ),
      child: Center(child: icon,),
    );
  }
}
