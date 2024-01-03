import 'dart:io';

import 'package:amazon_clone_app/constants/utils.dart';
import 'package:amazon_clone_app/features/admin/services/admin_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:amazon_clone_app/common/widgets/custom_button.dart';
import 'package:amazon_clone_app/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_app/constants/global_variable.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  final AdminServices adminServices = AdminServices();
  String category = 'Drone';
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();
  FileType _pickingType = FileType.any;

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  final List<String> productImage = [
    "https://www.robosapi.com/assets/images/robot_sensor/sensor1.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXhFF4yNOBaowQ1BGSY-4NK1oeubVpOSELxZKtmDVZGCdqSYNR-bbj1UbNlq_xUX5xzi8&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf_koZzRMLDLpcpixxyupvY2hEUJzJ_d82zw&usqp=CAU",
];

  List<String> productCategories = [
    'Drone',
    'Robotics',
    'Motor',
    'Amplifier',
    'Tools'
  ];
 // when need to pick file from gallery, replace all product image variable to images which takes files.
  void sellProduct() {
   // if (_addProductFormKey.currentState!.validate() && productImage.isNotEmpty) {
      if ( productImage.isNotEmpty) {
      adminServices.sellProduct(
        context: context,
        name: productNameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(quantityController.text),
        category: category,
        images: productImage,
      );
    }
      print("Sell product clicked");
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
      print(images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariable.appBarGradient,
            ),
          ),
          title: const Text(
            'Add Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                productImage.isNotEmpty
                    ? CarouselSlider(
                  items: productImage.map(
                        (i) {
                      return Builder(
                        builder: (BuildContext context) => Image.network(
                          i,
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                      );
                    },
                  ).toList(),
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 200,
                  ),
                )
                    :  GestureDetector(
                  onTap: selectImages,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 4],
                    strokeCap: StrokeCap.round,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.folder_open,
                            size: 40,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Select Product Images',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: productNameController,
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: descriptionController,
                  hintText: 'Description',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: priceController,
                  hintText: 'Price',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: quantityController,
                  hintText: 'Quantity',
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Sell',
                  onTap: sellProduct,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}