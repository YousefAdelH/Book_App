import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomFailureError extends StatelessWidget {
  const CustomFailureError({super.key, required this.errormssage});
  final  String  errormssage;
  @override
  Widget build(BuildContext context) {
    return  Text( errormssage,style: Styles.textStyle16 ,);
  }
}
