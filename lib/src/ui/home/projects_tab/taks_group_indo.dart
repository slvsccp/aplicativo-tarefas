import 'package:flutter/material.dart';

class TaskGroupInfo extends StatelessWidget {
  final int index;

  const TaskGroupInfo({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      margin: const EdgeInsets.fromLTRB(24, 8, 0, 8),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Colors.primaries[index],
          borderRadius: BorderRadius.circular(13)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Título',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              Text('Descrição',
              style: TextStyle(color: Colors.black54),
              ),
              const Spacer(),
              Text(
                '25',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Active Tasks',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
