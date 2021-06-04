import 'package:employebloc/Employee.dart';
import 'package:employebloc/EmployeeBloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  void dispose() {
    _employeeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Printing");
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee App"),
        centerTitle: true,
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBloc.employeeListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                    child: Card(
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text('${snapshot.data![index].id}.', style: TextStyle(fontSize: 18.0),),
                            SizedBox(width: 2.0),
                            Column(
                              children: [
                                Text('${snapshot.data![index].name}',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                Text('₹${snapshot.data![index].salary}',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                              ],
                            ),
                            SizedBox(width: 2.0),
                            IconButton(
                              splashColor: Colors.deepOrange,
                              onPressed: () {
                                _employeeBloc.employeeSalaryIncrement.add(snapshot.data![index]);
                              },
                              icon: Icon(Icons.thumb_up_outlined),
                              color: Colors.green,
                            ),
                            SizedBox(width: 1.0),
                            IconButton(
                              splashColor: Colors.deepOrange,
                              onPressed: () {
                                _employeeBloc.employeeSalaryDecrement.add(snapshot.data![index]);
                              },
                              icon: Icon(Icons.thumb_down_outlined),
                              color: Colors.deepPurple,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
