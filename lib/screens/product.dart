import 'package:ecom/components/custom_button.dart';
import 'package:ecom/utils/custom_theme.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool addButtonLoad = false;
  void onAddToCart()async{
    setState(() {
      addButtonLoad = true;
    });
    setState(() {
      addButtonLoad = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 500,
                        width: double.infinity,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, right: 6),
                            child: Image.asset('assets/img.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Positioned(
                      //     top: 35,
                      //     right: 20,
                      //     child: Container(
                      //       decoration: const ShapeDecoration(
                      //         color: CustomTheme.yellow,
                      //         shape: CircleBorder(),
                      //         shadows: [BoxShadow(color: CustomTheme.grey, blurRadius: 3, offset: Offset(1,3))],
                      //       ),
                      //       child: IconButton(
                      //         icon: const Icon(Icons.share),
                      //         color: Colors.black,
                      //         onPressed: (){},
                      //       ),
                      //     ),
                      // ),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.headlineLarge!,
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Padding(padding: EdgeInsets.only(top: 22),
                            child: Text("4 BHK, Vatika, sec-82, Gurugram | Home Interior"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: const [
                                Text("MRP: "),
                                Text("\₹ 399"),
                              ],
                            ),
                          ),
                          CustomButton(text: "Add to Cart", onPress: onAddToCart, loading: addButtonLoad,),
                          Padding(padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text("About the item",
                          style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(padding: const EdgeInsets.only(bottom: 20),
                          child: Text("Description",
                          style: Theme.of(context).textTheme.bodySmall,
                          ),
                          ),

                          DataTable(
                            columns: const [
                                DataColumn(label: Text('Name'),
                                numeric: false,
                                ),
                              DataColumn(label: Text('Ajay Singh'),
                                numeric: false,
                              ),
                            ],
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text('Location, City And Pin Code')),
                                DataCell(Text('Vatika, Sec-82, Gurugram')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Flat/House')),
                                DataCell(Text('Flat')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Service Type')),
                                DataCell(Text('Complete Interior')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Rooms to design')),
                                DataCell(Text('4bhk 1850 sqft super area')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Kitchen')),
                                DataCell(Text('Yes')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Furniture')),
                                DataCell(Text('Yes')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('False Ceiling')),
                                DataCell(Text('Yes')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Paint')),
                                DataCell(Text('Yes')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Flooring')),
                                DataCell(Text('No')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Washroom')),
                                DataCell(Text('No')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Budget')),
                                DataCell(Text('8-9 lakh')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Building Status')),
                                DataCell(Text('In Possession')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('When To Start Work')),
                                DataCell(Text('ASAP')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Preferred Time To Call')),
                                DataCell(Text('tomorrow morning after 10am')),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Positioned(
            //     top: 35,
            //     left: 30,
            //     child: Container(
            //       decoration: const BoxDecoration(color: Colors.white,
            //           borderRadius: BorderRadius.all(Radius.circular(5)),
            //           boxShadow: [BoxShadow(blurRadius: 3,offset: Offset(1,3),color: CustomTheme.grey)]
            //       ),
            //       child: IconButton(
            //         icon: const Icon(Icons.arrow_back),
            //         color: Colors.black,
            //         onPressed: (){
            //           Navigator.of(context).pop(true);
            //         },
            //       ),
            //     ),
            // ),
          ],
        ),
      ),
    );
  }
}

