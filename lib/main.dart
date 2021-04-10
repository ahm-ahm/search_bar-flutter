import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class SearchBar {
  var employeeList = [
    Employee(
        name: 'John',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
    Employee(
        name: 'Johni',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
    Employee(
        name: 'Jim',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
    Employee(
        name: 'Haider',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
    Employee(
        name: 'Usman',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
    Employee(
        name: 'Ali',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
    Employee(
        name: 'August',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
    Employee(
        name: 'Dell',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
  ];
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var employeeList = [
    Employee(
        name: 'John',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
    Employee(
        name: 'Johni',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
    Employee(
        name: 'Jim',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
    Employee(
        name: 'Haider',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
    Employee(
        name: 'Usman',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
    Employee(
        name: 'Ali',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
    Employee(
        name: 'August',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
    Employee(
        name: 'Dell',
        description: 'this is about des',
        image: 'assets/images/man.jpg'),
  ];

  TextEditingController editingController = TextEditingController();

  var itemsList = List<Employee>();
  var employee;
  @override
  void initState() {
    itemsList.addAll(employeeList);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Employee> dummySearchList = List<Employee>();
    if (query.isNotEmpty) {
      employeeList.forEach((item) {
        if (item.name.toLowerCase().startsWith(query)) {
          dummySearchList.add(item);
        }
      });
      setState(() {
        itemsList.clear();
        itemsList.addAll(dummySearchList);
      });
      return;
    } else {
      setState(() {
        itemsList.clear();
        itemsList.addAll(employeeList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: itemsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      print('----------------------${itemsList[index].name}');
                    },
                    child: ListTile(
                      title: Text('${itemsList[index].name}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Employee {
  final String name;
  final String description;
  final String image;

  Employee({this.name, this.description, this.image});
}
