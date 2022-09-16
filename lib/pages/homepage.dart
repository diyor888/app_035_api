import 'package:app_035_api/model/employeeList_model.dart';
import 'package:app_035_api/model/employee_model.dart';
import 'package:app_035_api/pages/employee_page.dart';
import 'package:flutter/material.dart';
import '../services/http_service.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";
  List<Employee> item = [];
  late int count;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpList();
  }

  void _apiEmpList() {
    Network.GET(Network.Api_Emp_List, Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  // void _apiEmpOne(int id) {
  //   Network.GET(Network.Api_Emp_One + id.toString(), Network.paramsEmpty())
  //       .then((response) => {
  //             print(response),
  //             _showResponse(response!),
  //           });
  // }

  void _showResponse(String response) {
    EmpList emplist = Network.parseEmpList(response);
    setState(() {
      item.addAll(emplist.data);
    });
    print("Length: ${item.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title:const Text(
          'All Employee',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:const EdgeInsets.all(12),
        child: ListView.builder(
            itemCount: item.length,
            itemBuilder: (ctx, i) {
              return _employees(item[i]);
            }),
      ),
    );
  }

  Widget _employees(Employee emp) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EmployeePage(
              employee: emp,
            ),
          ),
        );
      },
      child: Container(
        width: 500,
        padding:const EdgeInsets.all(20),
        margin:const EdgeInsets.only(bottom: 7),
        decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${emp.id}) ${emp.employee_name}",
              style:const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
