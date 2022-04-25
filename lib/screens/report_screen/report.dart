import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  final String report = 'Report';
  var categoryTitle = '';
  var categoryId = '';
  Report(this.categoryTitle, this.categoryId);
  @override
  Widget build(BuildContext context) {
    void addImage() {}

    void addLocation() {}

    // final routArgs =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    return Scaffold(

        appBar: AppBar(
            centerTitle: true,
            title: Text(categoryTitle.toString()),
            backgroundColor: Colors.brown),
        body: Stack(

          children: [
            Container(

                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/backg.png"),
                      fit: BoxFit.cover),
                ),
                ), SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(children: <Widget>[
                      SizedBox(
                        width: 20,
                        height: 140,
                      ),
                      TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            // border: InputBorder.none,
                            // focusedBorder: InputBorder.none,
                            // enabledBorder: InputBorder.none,
                            // errorBorder: InputBorder.none,
                            // disabledBorder: InputBorder.none,


                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 3, color: Colors.blue),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Report Title',
                          fillColor: Colors.white60, filled: true
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextField(
                        maxLines: 9,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 3, color: Colors.blue),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Report Discreption',
                            fillColor: Colors.white60, filled: true
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 3, color: Colors.blue),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Issue Location',
                            fillColor: Colors.white60, filled: true
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 40,
                            height: 20,
                          ),
                          ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.green),
                              onPressed: addImage,
                              child: Text("Add images")),
                          SizedBox(
                            width: 40,
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                              onPressed: addLocation,
                              child: Text("Add Location")),
                          SizedBox(
                            width: 40,
                            height: 20,
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
          ],
        ));
  }
}
