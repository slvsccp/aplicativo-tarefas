import 'package:flutter/material.dart';

class ProjectsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32, left: 16),
            child: Text('Projetos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36
            ),
            ),
          ),
        ],
      ),
    );
  }
}