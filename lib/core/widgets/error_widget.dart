
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/utils/extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key,this.message, required this.onRefreshButton});
  final double size = 250 ;
  final String? message ;
  final Function() onRefreshButton ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/error.svg",width: size,height: size,),
          Text(message ?? "مشکل در خواندن اطلاعات"),
          10.height,
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => onRefreshButton(),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text("تلاش مجدد",style: TextStyle(color: Theme.of(context).primaryColor),),
            ),
          )
        ],
      )
    );
  }
}
