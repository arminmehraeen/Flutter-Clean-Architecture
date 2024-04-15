
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/utils/extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.message, required this.onAddButton});
  final double size = 250 ;
  final String message ;
  final Function() onAddButton ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/empty.svg",width: size,height: size,),
          Text(message),
          10.height,
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => onAddButton(),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text("اضافه کردن",style: TextStyle(color: Theme.of(context).primaryColor),),
            ),
          )
        ],
      )
    );
  }
}
