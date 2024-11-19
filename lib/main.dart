import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(TaskApp());

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List _tasks = [];
  List _filteredTasks = [];
  bool _isLoading = true;

  final Dio _dio = Dio();

  Future<void> _fetchTasks() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/todos');
      if (response.statusCode == 200) {
        setState(() {
          _tasks = response.data;
          _filteredTasks = _tasks;
          _isLoading = false;
        });
      }
    } catch (e) {
      throw Exception('Failed to load tasks: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  void _filterTasks(String query) {
    setState(() {
      _filteredTasks = _tasks
          .where((task) =>
              task['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search Tasks',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: _filterTasks,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _filteredTasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_filteredTasks[index]['title']),
                        leading: Icon(
                          _filteredTasks[index]['completed']
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: _filteredTasks[index]['completed']
                              ? Colors.green
                              : Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
