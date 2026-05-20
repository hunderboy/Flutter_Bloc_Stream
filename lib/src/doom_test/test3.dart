
import 'package:flutter/material.dart';


// Using a dart code, make the code below into a reactive UI code

class ProductDatails extends StatefulWidget {
  final String detailsText;
  final bool visible;
  
  const ProductDatails({Key? key, required this.detailsText, required this.visible}) : super(key: key);

  @override
  State<ProductDatails> createState() => _ProductDatailsState();
}

class _ProductDatailsState extends State<ProductDatails> {
  bool _visible = false;

  dynamic enumType() {
    List<int> demend = enumType();
    print("df");
  }
  
  @override
  void initState() {
    _visible = widget.visible;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
              title: const Text("Test3")
          ),
          body: 
          Column(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    setState(() {
                      // _visible = !_visible;
                      _visible = !widget.visible;
                    });
                  },
                  child: Container(color: Colors.redAccent, child: const Text("Show/Hide"),),
                ),
                if(_visible) Text(widget.detailsText)
              ]
          )
      );
  }
}