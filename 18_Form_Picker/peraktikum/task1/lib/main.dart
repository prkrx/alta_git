import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

XFile? image;
final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
  }
TextEditingController dateinput = new TextEditingController();
var _caption = TextEditingController(); 


void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color mycolor = Colors.lightBlue;

  //text editing controller for text field
  
  
  //initialize image as XFile to access ImagePicker
  Future<void> _pickImage(ImageSource source) async {
    final _pickedFile = await picker.pickImage(source: source);
    //check if the image is not null
    if (_pickedFile != null) {
      setState(() {
        image = XFile(_pickedFile.path);
      });
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Example'),
      ),
      body:ListView(
          children: <Widget>[
            const Text("Cover",
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6, vertical: 20),
              child:
                ElevatedButton(
                  style: TextButton.styleFrom(

                    // Inside Padding 

                    // Width,Height
                    minimumSize: Size(400, 30), 
                  ),
                  child: Text('Pilih File'),
                  onPressed: () {
                    _pickImage(ImageSource.gallery);
                  },
                ),
            ),
            TextField(
                controller: dateinput, //editing controller of this TextField
                decoration: const InputDecoration(
                   label: Text("Publish At"), //label text of field
                ),
                readOnly: true,  //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );
                  
                  if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement
                      setState(() {
                         dateinput.text = formattedDate; //set output date to TextField value. 
                      });
                  }else{
                      print("Date is not selected");
                  }
                },
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text("Pick a Color")
                ),
                 onTap: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                      title: Text('Pick a color!'),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: mycolor, //default color
                                          onColorChanged: (Color color){ //on color picked
                                              setState(() {
                                                mycolor = color;
                                              });
                                          }, 
                                        ),
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: const Text('DONE'),
                                          onPressed: () {
                                            Navigator.of(context).pop(); //dismiss the color picker
                                          },
                                        ),
                                      ],
                                  );
                              }
                            ); 
                              
                        },
                    ),
              Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: TextFormField(
                  minLines: 2,
                  maxLines: 5,
                  controller: _caption,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'description',
                    hintStyle: TextStyle(
                      color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
            ),
              ),
              Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child:
                ElevatedButton(
                  style: TextButton.styleFrom(

                    // Inside Padding 

                    // Width,Height
                    minimumSize: Size(50, 30), 
                  ),
                  child: Text('Simpan'),
                  onPressed: () {
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => const SecondRoute()),);
                  },
                ),
            ),
          ],
        ),
    );
  }
}

class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          MaterialApp(
            title: "Preview Post",
          ),
          Container(
                height: 200,
                width: 200,
                child: image != null
                    ? (kIsWeb
                        ? (Image.network(image!.path))
                        : (Image.file(File(image!.path))))
                    : const Text('Pick an image'),
              ),
              Text("Published : " + dateinput.text),
              Center(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 35),
              child:
                Text(_caption.text)
                ),
              )
              
          
        ],
      ),
    );
  }
}