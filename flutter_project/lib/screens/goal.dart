import 'package:flutter/material.dart';

class GoalWidget extends StatefulWidget {
  const GoalWidget({key}) : super(key: key);

  @override
  State<GoalWidget> createState() => _GoalWidgetState();
}

class Goal {
  String name;
  bool isChecked;

  Goal(this.name, this.isChecked);
}

class _GoalWidgetState extends State<GoalWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //widget que vai adicionar 5 objetivos para marcar como favoritos do tipo goal
  List<Goal> goals = [
    Goal('Fazer exercícios', false),
    Goal('Ser saudável', false),
    Goal('Ganhar massa', false),
    Goal('Perder peso', false),
    Goal('Competir professionalmente', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 39, 39, 39),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Objetivos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: goals.length,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                            title: Text(
                              goals[index].name,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            checkColor: Colors.white,
                            value: goals[index].isChecked,
                            onChanged: (bool value) {
                              setState(() {
                                goals[index].isChecked = value;
                              });
                            },
                          );
                        },
                      ),
                      ElevatedButton(
                        child: const Text('Cadastrar'),
                        onPressed: () {
                          // if (_formKey.currentState.validate()) {
                          //   Navigator.pop(context);
                          // }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
