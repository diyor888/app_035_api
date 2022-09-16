import 'package:app_035_api/model/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeePage extends StatefulWidget {
  final Employee employee;

  const EmployeePage({required this.employee, Key? key}) : super(key: key);

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("About the worker"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,top: 25),
          child: Text(
            "Employee name : ${widget.employee.employee_name}\n"
            "Employee age : ${widget.employee.employee_age} \n"
            "Employee salary : ${widget.employee.employee_salary} \$\n"
            "Employee image : ${widget.employee.profile_image}\n"
            "Employee id : ${widget.employee.id}",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
          ),

      ),
    );
  }
}
