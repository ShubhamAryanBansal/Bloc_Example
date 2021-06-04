//TODO: imports

//TODO: List of Employees
//TODO: Stream Controllers

//TODO: Stream Sink getter

//TODO: Constructor - add data; Listen to changes

//TODO: Core Functions

//TODO: Dispose

import 'dart:async';

import 'package:employebloc/Employee.dart';

class EmployeeBloc {
  //sink to add in pipe
  //stream to get data from pipe
  //By pipe means data flow

  List<Employee> _employeeList = [
    Employee(1, 'Employee One', 10000.0),
    Employee(2, 'Employee Two', 20000.0),
    Employee(3, 'Employee Three', 30000.0),
    Employee(4, 'Employee Four', 40000.0),
    Employee(5, 'Employee Five', 50000.0),
  ];

  final _employeeListStreamController = StreamController<List<Employee>>();

  //for inc and dec
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  //getters

  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink {
    return _employeeListStreamController.sink;
  }

  StreamSink<Employee> get employeeSalaryIncrement{
    return _employeeSalaryIncrementStreamController.sink;
  }


  StreamSink<Employee> get employeeSalaryDecrement =>
      _employeeSalaryDecrementStreamController.sink;

  EmployeeBloc() {
    _employeeListStreamController.add(_employeeList);
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

  _incrementSalary(Employee employee) {
    double Salary = employee.salary;
    double incrementedSalary = Salary * 20 / 100;
    _employeeList[employee.id - 1].salary = Salary + incrementedSalary; //salary  += salary * (20/100)
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double Salary = employee.salary;
    double decrementedSalary = Salary * 20 / 100;
    _employeeList[employee.id - 1].salary = Salary - decrementedSalary;
    employeeListSink.add(_employeeList);
  }

  void dispose() {
    _employeeListStreamController.close();
    _employeeSalaryDecrementStreamController.close();
    _employeeSalaryIncrementStreamController.close();
  }
}
