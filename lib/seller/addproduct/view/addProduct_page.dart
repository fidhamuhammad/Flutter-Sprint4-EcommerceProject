import 'package:e_commerce_app/seller/addproduct/repository/addproductrepo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _pronameController = TextEditingController();
  final TextEditingController _procodeController = TextEditingController();
  final TextEditingController _prodescriptionController = TextEditingController();
  final TextEditingController _prostockController = TextEditingController();
  final TextEditingController _propriceController = TextEditingController();

  List<XFile> imageList = [];
  Future<dynamic> getImage()async{
    final imagePicker = ImagePicker();
    imageList = await imagePicker.pickMultiImage();
  }

  final _formkey = GlobalKey<FormState>();

   void dispose() {
    _pronameController.dispose();
    _procodeController.dispose();
    _prodescriptionController.dispose();
    _prostockController.dispose();
    _propriceController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 206, 224),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 48, 80),
        centerTitle: true,
        title: Text(
          "LakeStore",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic),
        ),
        leading: Icon(
          Icons.shopping_basket_rounded,
          color: Colors.white,
        ),
      ),
      body: 
      SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _pronameController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please fill this field';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Product Name'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _procodeController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please fill this field';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Product Code'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _prodescriptionController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please fill this field';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Product Description'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _prostockController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please fill this field';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Product Stock'),
              ),
              SizedBox(
                height: 10,
              ),
               TextFormField(
                controller: _propriceController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please fill this field';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Product price'),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromARGB(255, 119, 172, 237)),
                ),
                onPressed: () {
                  getImage();
                },
                child: Column(
                  children: [
                    Text(
                      'upload product image',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 119, 172, 237)),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      await AddProductRepo().createProductImage(
                        _pronameController.text, 
                        _procodeController.text, 
                        _prodescriptionController.text, 
                        _prostockController.text, 
                        _propriceController.text, 
                        imageList!, 
                        context);
                        _pronameController.clear();
                         _procodeController.clear();
                        _prodescriptionController.clear(); 
                        _prostockController.clear(); 
                        _propriceController.clear();
                        
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('your image uploaded')));
                    }
                  },
                  child: Text(
                    'Add Product',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 247, 244, 244),
                        fontWeight: FontWeight.bold),
                  )),
                  
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class AddProductPage extends StatefulWidget {
//   const AddProductPage({super.key});

//   @override
//   State<AddProductPage> createState() => _AddProductPageState();
// }

// class _AddProductPageState extends State<AddProductPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 191, 206, 224),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 5, 48, 80),
//         centerTitle: true,
//         title: Text(
//           "LakeStore",
//           style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.w400,
//               fontStyle: FontStyle.italic),
//         ),
//         leading: Icon(
//           Icons.shopping_basket_rounded,
//           color: Colors.white,
//         ),
//       ),
//       body: 
//       SingleChildScrollView(
//         child: Form(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     hintText: 'Product Name'),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     hintText: 'Product Code'),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     hintText: 'Product Description'),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     hintText: 'Product Stock'),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextButton(
//                 style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStatePropertyAll(Color.fromARGB(255, 119, 172, 237)),
//                 ),
//                 onPressed: () {},
//                 child: Text(
//                   'upload product image',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromARGB(255, 119, 172, 237)),
//                   onPressed: () {},
//                   child: Text(
//                     'ADD PRODUCT',
//                     style: TextStyle(
//                         color: const Color.fromARGB(255, 247, 244, 244),
//                         fontWeight: FontWeight.bold),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

