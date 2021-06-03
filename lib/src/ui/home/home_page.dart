import 'package:apptarefas/src/ui/home/projects_tab/projects_tab.dart';
import 'package:apptarefas/src/ui/home/search_tab/search_tab.dart';
import 'package:apptarefas/src/ui/home/tasks_tab/tasks_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  TabController _tabController;

  @override
  initState() {
    super.initState();

    _tabController = TabController(
      vsync: this,
      length: 3,
      initialIndex: currentIndex,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            ProjectsTab(), 
            TasksTab(), 
            SearchTab()
            ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 32, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _BottomNavigationBar(
              currentIndex: currentIndex,
              onItemTap: (i) {
                _tabController.index = i;
                currentIndex = i;
                setState(() {
                  
                });
              },
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
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((icon) {
          final index = items.indexOf(icon);
          final isSelected = (index == currentIndex);

          return IconButton(
            icon: icon,
            color: isSelected ? Theme.of(context).accentColor : Colors.grey,
            onPressed: () => onItemTap(index),
          );
        }).toList(),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Icon icon;
  final GestureTapCallback onTap;

  const _AddButton({@required this.onTap, @required this.icon})
      : assert(onTap != null),
        assert(icon != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor, shape: BoxShape.circle),
      child: Center(
        child: icon,
      ),
    );
  }
}
