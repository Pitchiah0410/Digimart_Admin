import 'package:digimartadmin/controller/authcontroller.dart';
import 'package:digimartadmin/controller/usercntroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'constants/constants.dart';
import 'controller/ordercontroller.dart';
import 'controller/productcontroller.dart';
import 'screens/dashboard/dashboard.dart';
import 'screens/login/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(UserController());
    Get.put(OrderController());
    Get.put(ProducsController());
    Get.put(AuthController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Groso Admin Panel',
        theme: ThemeData.dark().copyWith(
          cardTheme: CardTheme(color:bgColor),
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.copyWith(caption:TextStyle(color: Colors.white)))
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        home: MyHomePage());
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
//   int _rowsPerPage1 = PaginatedDataTable.defaultRowsPerPage;
//   List<RowData> source = [
//     RowData(1, 'Hi'),
//     RowData(2, 'I'),
//     RowData(3, 'am'),
//     RowData(4, 'Austin'),
//     RowData(5, 'Emmanuel'),
//     RowData(6, 'R'),
//     RowData(7, 'a'),
//     RowData(8, 'Flutter'),
//     RowData(9, 'Developer'),
//     RowData(10, 'from'),
//     RowData(12, 'Digisailor'),
//     RowData(13, 'Tuticorin'),
//     RowData(14, 'Tamil Nadu'),
//     RowData(14, 'India'),
//     RowData(15, 'Earth')
//   ];
//   TextEditingController controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 60,
//               width: 300,
//               child: Card(
//                 child: new ListTile(
//                   leading: new Icon(Icons.search),
//                   title: new TextField(
//                       controller: controller,
//                       decoration: new InputDecoration(
//                           hintText: 'Search', border: InputBorder.none),
//                       onChanged: (value) {
//                         setState(() {
//                           source = source.where((element) => element.value.contains(value)).toList();
//                         });
//                       }),
//                 ),
//               ),
//             ),
//             PaginatedDataTable(
//               // addEmptyRows: false,
//               source: DataTableSourceExpedition(
//                 expeditions: source,
//               ),
//               showFirstLastButtons: true,
//               rowsPerPage: rowsPerPage,
//               availableRowsPerPage: [1, 5, 10, 50],
//               onRowsPerPageChanged: (newRowsPerPage) {
//                 if (newRowsPerPage != null) {
//                   setState(() {
//                     rowsPerPage = newRowsPerPage;
//                   });
//                 }
//               },
//               columns: [
//                 DataColumn(label: Text('Row no')),
//                 DataColumn(label: Text('Value'))
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RowData {
//   final int index;
//   final String value;

//   RowData(this.index, this.value);
// }

// class DataTableSourceExpedition extends DataTableSource {
//   List<RowData> expeditions = [];
//   Function onRowClicked;
//   Function onDeleteIconClick;

//   DataTableSourceExpedition(
//       {this.expeditions, this.onRowClicked, this.onDeleteIconClick});
//   DataRow getRow(int index) {
//     final _expedition = expeditions[index];

//     return DataRow.byIndex(
//         index: index,
//         cells: <DataCell>[
//           DataCell(Text("${_expedition.index}")),
//           DataCell(Text("${_expedition.value}"))
//         ],
//         onSelectChanged: (b) => onRowClicked(index));
//   }

//   bool get isRowCountApproximate => false;

//   int get rowCount => expeditions.length;

//   int get selectedRowCount => 0;
// }
