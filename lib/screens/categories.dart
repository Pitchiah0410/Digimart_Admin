import 'package:chownow/constants/colors.dart';
import 'package:chownow/controller/post/categoryController.dart';
import 'package:chownow/model/categorymodel.dart';
import 'package:chownow/screens/subcategory.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: size.width * 0.40,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 4.0),
                      labelText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primarycolor),
                ),
                onPressed: () {
                  addcategories();
                },
                icon: Icon(Icons.add),
                label: Text('Add New'),
              ),
            ],
          ),
          // Container(
          //   height: 75,
          // ),
          FutureBuilder<CategoryModel>(
              future: CategoryController.getCategory(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? snapshot.data!.data == null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text(snapshot.data!.message!)),
                          )
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        MediaQuery.of(context).size.width > 800
                                            ? 5
                                            : 3),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.data!.length,
                            itemBuilder: (context, index) {
                              var data = snapshot.data!.data![index];
                              return InkWell(
                                onTap: () {
                                  Get.to(
                                    () =>
                                        SubCategoryPage(catid: data.categoryId),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GridTile(
                                    footer: Center(child: Text(data.name!)),
                                    child: FadeInImage.assetNetwork(
                                      imageErrorBuilder:
                                          (context, o, stacktrace) {
                                        return Image.asset(
                                            'assets/loading.gif');
                                      },
                                      placeholder: 'assets/loading.gif',
                                      image: data.image!,
                                      // height: size.height * 0.30,
                                      // fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              );
                            })
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              })
        ],
      ),
    );
  }

  addcategories() {
    RxList<PlatformFile> file = RxList([]);
    TextEditingController name = TextEditingController();
    TextEditingController code = TextEditingController();
    bool isPicked = false;
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, state) {
            return AlertDialog(
              title: Text('Add Category'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      // child: isPicked == true
                      //     ? Image.memory(
                      //         file.first.bytes!,
                      //         height: 180,
                      //         width: 120,
                      //       )
                      //     :
                      child: TextFormField(
                        readOnly: true,
                        onTap: () async {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CircularProgressIndicator(),
                                          Text('Please Wait Loading...')
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                          FilePickerResult? picked = await FilePicker.platform
                              .pickFiles(
                                  allowMultiple: false, allowCompression: false)
                              .whenComplete(
                                () => Navigator.pop(context),
                              );
                          if (picked != null) {
                            file.value = picked.files;
                            state(() {
                              isPicked = true;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Upload Images',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                          hintText: 'Category Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: code,
                      decoration: InputDecoration(
                          hintText: 'Category Code',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            CircularProgressIndicator(),
                                            Text('Please Wait Loading...')
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                            CategoryController.addCategory(
                              categoryCode: code.text,
                              image: file.first,
                              name: name.text,
                            ).then(
                              (v) {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                setState(() {});
                              },
                              onError: (e) => Get.rawSnackbar(message: e),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Submit'),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          });
        });
  }
}
