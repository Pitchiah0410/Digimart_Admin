import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digimartadmin/constants/constants.dart';
import 'package:digimartadmin/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase/firebase.dart' as fb;
import '../../constants.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  String url = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: [
            Carousals(),
            Divider(),
            Row(
              children: [
                Text('Categories', style: Theme.of(context).textTheme.title),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setstate) {
                            TextEditingController title =
                                TextEditingController();
                            return Dialog(
                              backgroundColor: secondaryColor,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  url.isEmpty
                                      ? Container()
                                      : Image.network(
                                          url,
                                          height: 150,
                                          width: 100,
                                        ),
                                  Container(
                                    height: 100,
                                    child: Card(
                                        color: secondaryColor,
                                        child: Center(
                                          child: TextButton.icon(
                                              onPressed: () => uploadToStorage(
                                                  fileName: DateTime.now()
                                                      .millisecondsSinceEpoch,
                                                  state: setstate),
                                              icon: Icon(Icons.upload_file),
                                              label: Text('Upload Image')),
                                        )),
                                  ),
                                  Card(
                                    color: secondaryColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: title,
                                        decoration: InputDecoration(
                                            hintText: 'Enter Category Title'),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('Cancel'),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    primaryColor),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: Get.context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    content: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          CircularProgressIndicator(),
                                                          Text('Loading...')
                                                        ]),
                                                  );
                                                });
                                            firebaseFirestore
                                                .collection('category')
                                                .doc('categories')
                                                .update({
                                              'categories':
                                                  FieldValue.arrayUnion([
                                                {
                                                  "photo_url": url,
                                                  'title': title.text
                                                },
                                              ])
                                            }).whenComplete(() {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              setState(() {
                                                url = '';
                                              });
                                            });
                                          },
                                          child: Text('Save'),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    primaryColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    icon: Icon(Icons.add),
                    label: Text('Add New'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: productsController.categories.length,
                itemBuilder: (context, index) {
                  var element = productsController.categories[index];
                  return Card(
                    color: secondaryColor,
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            element.image,
                            width: 60,
                            height: 80,
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(element.title),
<<<<<<< HEAD
=======
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
<<<<<<< HEAD
                            child: Text(element.title),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton.icon(
                                  onPressed: () => showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Are you sure'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Do you want to delete ${element.title} ?',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('Cancel'),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  primaryColor),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      firebaseFirestore
                                                          .collection(
                                                              'category')
                                                          .doc(element.docid)
                                                          .update({
                                                        'categories': FieldValue
                                                            .arrayRemove([
                                                          {
                                                            "photo_url":
                                                                element.image,
                                                            "title":
                                                                element.title
                                                          }
                                                        ])
                                                      });
                                                    },
                                                    child: Text('Delete'),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  primaryColor),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  icon: Icon(Icons.delete),
                                  label: Text('Delete'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(primaryColor),
                                  ),
                                ),
=======
                            child: ElevatedButton.icon(
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Are you sure'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Do you want to delete ${element.title} ?',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Cancel'),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          primaryColor),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  firebaseFirestore
                                                      .collection('category')
                                                      .doc(element.docid)
                                                      .update({
                                                    'categories':
                                                        FieldValue.arrayRemove([
                                                      {
                                                        "photo_url":
                                                            element.image,
                                                        "title": element.title
                                                      }
                                                    ])
                                                  });
                                                },
                                                child: Text('Delete'),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          primaryColor),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                              icon: Icon(Icons.delete),
                              label: Text('Delete'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(primaryColor),
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton.icon(
                                  icon: Icon(Icons.edit),
                                  label: Text('Edit'),
                                  onPressed: () {
                                    TextEditingController edtitile =
                                        TextEditingController(
                                            text: element.title);
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                          builder: (context, setstate) {
                                            return Dialog(
                                              backgroundColor: secondaryColor,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  url.isEmpty
                                                      ? Container()
                                                      : Image.network(
                                                          url,
                                                          height: 150,
                                                          width: 100,
                                                        ),
                                                  Container(
                                                    height: 100,
                                                    child: Card(
                                                        color: secondaryColor,
                                                        child: Center(
                                                          child: TextButton.icon(
                                                              onPressed: () => uploadToStorage(
                                                                  fileName: DateTime
                                                                          .now()
                                                                      .millisecondsSinceEpoch,
                                                                  state:
                                                                      setstate),
                                                              icon: Icon(Icons
                                                                  .upload_file),
                                                              label: Text(
                                                                  'Upload Image')),
                                                        )),
                                                  ),
                                                  Card(
                                                    color: secondaryColor,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: TextField(
                                                        controller: edtitile,
                                                        decoration: InputDecoration(
                                                            hintText:
                                                                'Category Title'),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context),
                                                          child: Text('Cancel'),
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                                        primaryColor),
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                            child: Text('Save'),
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(
                                                                          primaryColor),
                                                            ),
                                                            onPressed: () {
                                                              showDialog(
                                                                  context: Get
                                                                      .context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                      content: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            CircularProgressIndicator(),
                                                                            Text('Loading...')
                                                                          ]),
                                                                    );
                                                                  });
                                                              firebaseFirestore
                                                                  .collection(
                                                                      'category')
                                                                  .doc(
                                                                      'categories')
                                                                  .update({
                                                                'categories':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  {
                                                                    "photo_url":
                                                                        element
                                                                            .image,
                                                                    "title":
                                                                        element
                                                                            .title
                                                                  },
                                                                ])
                                                              }).whenComplete(
                                                                () {
                                                                  print(
                                                                      edtitile);
                                                                  firebaseFirestore
                                                                      .collection(
                                                                          'category')
                                                                      .doc(
                                                                          'categories')
                                                                      .update({
                                                                    'categories':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      {
                                                                        "photo_url":
                                                                            url,
                                                                        'title':
                                                                            edtitile.text
                                                                      },
                                                                    ])
                                                                  }).whenComplete(
                                                                          () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    Navigator.pop(
                                                                        context);
                                                                    setState(
                                                                        () {
                                                                      url = '';
                                                                    });
                                                                  });
                                                                },
                                                              );
                                                            }),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  void uploadImage({@required Function(File file) onSelected}) {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
        showDialog(
            context: Get.context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircularProgressIndicator(),
                      Text('Loading...')
                    ]),
              );
            });
      });
    });
  }

  void uploadToStorage({fileName, state}) {
    final path = 'products/$fileName';
    uploadImage(onSelected: (file) {
      fb
          .storage()
<<<<<<< HEAD
          .refFromURL('gs://digimart-44fde.appspot.com/')
=======
<<<<<<< HEAD
          .refFromURL('gs://freshwheels-969bf.appspot.com/')
=======
          .refFromURL('gs://digimart-44fde.appspot.com/')
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
          .child(path)
          .put(file)
          .future
          .then((data) async {
        Uri uri = await data.ref.getDownloadURL();
        state(() {
          url = uri.toString();
        });
        Navigator.pop(Get.context);
      });
    });
  }
}

class Carousals extends StatefulWidget {
  const Carousals({
    Key key,
  }) : super(key: key);

  @override
  _CarousalsState createState() => _CarousalsState();
}

class _CarousalsState extends State<Carousals> {
  String url = '';

  void uploadImage({@required Function(File file) onSelected}) {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
        showDialog(
            context: Get.context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircularProgressIndicator(),
                      Text('Loading...')
                    ]),
              );
            });
      });
    });
  }

  void uploadToStorage({fileName, state}) {
    final path = 'Carousals/$fileName';
    uploadImage(onSelected: (file) {
      fb
          .storage()
<<<<<<< HEAD
          .refFromURL('gs://digimart-44fde.appspot.com/')
=======
<<<<<<< HEAD
          .refFromURL('gs://freshwheels-969bf.appspot.com/')
=======
          .refFromURL('gs://digimart-44fde.appspot.com/')
>>>>>>> d4fbe0a49caf64c7430b81dc31717f998ef81aa4
>>>>>>> 55969c811a5c067a1f2add0aea00ccdd68303b3d
          .child(path)
          .put(file)
          .future
          .then((data) async {
        Uri uri = await data.ref.getDownloadURL();
        setState(() {
          url = uri.toString();
        });
        Navigator.pop(Get.context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Carousal', style: Theme.of(context).textTheme.title),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setstate) {
                        return Dialog(
                          backgroundColor: secondaryColor,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              url.isEmpty
                                  ? Container()
                                  : Image.network(
                                      url,
                                      height: 150,
                                      width: 100,
                                    ),
                              Container(
                                height: 100,
                                child: Card(
                                    color: secondaryColor,
                                    child: Center(
                                      child: TextButton.icon(
                                          onPressed: () => uploadToStorage(
                                              fileName: DateTime.now()
                                                  .millisecondsSinceEpoch,
                                              state: setstate),
                                          icon: Icon(Icons.upload_file),
                                          label: Text('Upload Image')),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Cancel'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                primaryColor),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                            context: Get.context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      CircularProgressIndicator(),
                                                      Text('Loading...')
                                                    ]),
                                              );
                                            });
                                        firebaseFirestore
                                            .collection('category')
                                            .doc('carousel')
                                            .update({
                                          'photourl': FieldValue.arrayUnion([
                                            url,
                                          ])
                                        }).whenComplete(() {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          setState(() {
                                            url = '';
                                          });
                                        });
                                      },
                                      child: Text('Save'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                icon: Icon(Icons.add),
                label: Text('Add New'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          // height: 400,
          child: Obx(
            () => ListView.builder(
                shrinkWrap: true,
                itemCount: productsController.carousel.length,
                itemBuilder: (context, index) {
                  var element = productsController.carousel[index];
                  return Card(
                    color: secondaryColor,
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            element,
                            height: 150,
                            width: MediaQuery.of(context).size.width > 650
                                ? 250
                                : 170,
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton.icon(
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Are you sure'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Do you want to delete ${element.title} ?',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Cancel'),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          primaryColor),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  firebaseFirestore
                                                      .collection('category')
                                                      .doc('carousel')
                                                      .update({
                                                    'photourl':
                                                        FieldValue.arrayRemove([
                                                      element,
                                                    ])
                                                  });
                                                },
                                                child: Text('Delete'),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          primaryColor),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                              icon: Icon(Icons.delete),
                              label: Text('Delete'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
