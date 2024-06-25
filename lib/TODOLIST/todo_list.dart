import 'package:flutter/material.dart';
class TodoListApp extends StatefulWidget {
  const TodoListApp({super.key});

  @override
  State<TodoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {

  final TextEditingController _controller = TextEditingController();
  final List<String> _tasks = [];

  void _addTask(String task)
  {
    setState(() {
      _tasks.add(task);
    });
    _controller.clear();
  }

  void _deleteTask(int index)
  {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void  _toggleTaskCompletion(int index)
  {
    setState(() {
      _tasks[index] = "☑ ${_tasks[index]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.lightBlueAccent,Colors.pinkAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
            )
          ),
        ),
        title: const Text('TODO LIST APP'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent,Colors.pinkAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add a new task',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height:10,),
              TextFormField(
                controller: _controller,
                onFieldSubmitted: (value)
                {
                  if(value.isNotEmpty){
                    _addTask(value);
                  }
                },
              ),
              const SizedBox(height:20,),
              const Text(
                'Tasks:',
                style: TextStyle(fontSize: 19.0,fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index)
                      {
                        return ListTile(
                          title: Text(_tasks[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.check),
                            onPressed: (){
                              _toggleTaskCompletion(index);
                            },
                          ),
                          onLongPress: ()
                          {
                            _deleteTask(index);
                          },
                        );
                      }
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
