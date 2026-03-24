import 'package:flutter/material.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мої завдання'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
// Пошук буде реалізовано пізніше
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: 10, // Тимчасово 10 елементів
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: ListTile(
              leading: Checkbox(
                value: index % 2 == 0, // Для прикладу:

                onChanged: (value) {
// Функціонал зміни статусу буде додано
                },
              ),
              title: Text('Завдання ${index + 1}'),
              subtitle: Text('Створено: 10.03.2026'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    index % 3 == 0
                        ? Icons.work
                        : index % 3 == 1
                            ? Icons.person
                            : Icons.school,
                    color: Colors.blue,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
// Перехід на екран додавання буде реалізовано
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
