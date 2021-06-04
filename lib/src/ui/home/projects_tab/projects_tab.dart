import 'package:apptarefas/src/ui/home/projects_tab/taks_group_indo.dart';
import 'package:flutter/material.dart';

class ProjectsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32, left: 24),
            child: Text(
              'Projetos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
            ),
          ),
          Container(
            height: 330,
            width: double.infinity,
            child: GridView.builder(
              itemCount: 8,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return TaskGroupInfo(index: index);
              },
            ),
          )
        ],
      ),
    );
  }
}
