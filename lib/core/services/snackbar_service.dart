import 'package:flutter/material.dart';

class SnackBarService {
  final String message;
  final BuildContext context;
  final IconData? icon;
  final Color color;
  final String title;

  SnackBarService({
    required this.message,
    required this.context,
    this.icon,
    required this.color,
    required this.title,
  }){

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            Icon(icon ?? Icons.circle , size: 12,color: Colors.white),
            const SizedBox(width: 15,),
            Text(message,style: const TextStyle(fontFamily: 'Yekan')),
          ],
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: color));
  }

}

class SuccessSnackBar extends SnackBarService {
  SuccessSnackBar({required super.message, required super.context, super.icon}):super(color: Colors.green,title: "Success");
}

class ErrorSnackBar extends SnackBarService {
  ErrorSnackBar({required super.message, required super.context, super.icon}):super(color: Colors.redAccent,title: "Error");
}

class WarningSnackBar extends SnackBarService {
  WarningSnackBar({required super.message, required super.context, super.icon}):super(color: Colors.blue,title: "Warning");
}
