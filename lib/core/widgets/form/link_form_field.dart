import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/category/domain/entities/category_entity.dart';

import '../../bloc/theme/theme_cubit.dart';

class LinkFormField<T> extends StatefulWidget {
  final String label;
  final Widget screen;
  final bool isRequired;
  final Function(T value) onResult;
  final TextEditingController controller ;

  const LinkFormField(
      {Key? key,
      required this.label,
      required this.screen,
      required this.onResult,
      required this.controller,
      this.isRequired = true})
      : super(key: key);

  @override
  State<LinkFormField<T>> createState() => _LinkFormFieldState<T>();
}

class _LinkFormFieldState<T> extends State<LinkFormField<T>> {
  String? value;

  @override
  void initState() {
    value = widget.controller.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: widget.isRequired
          ? (String? v) {
              if (v == null || v == "") {
                return "این فیلد الزامی است";
              }
              return null;
            }
          : null,
      initialValue: value,
      builder: (field) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                decoration: BoxDecoration(
                  border: field.hasError
                      ? Border.all(color: Colors.redAccent, width: 1)
                      : Border.all(color: context.read<ThemeCubit>().state.themeMode == ThemeMode.dark ? Colors.white38 : Colors.black45, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: ListTile(
                    title: widget.isRequired
                        ? Text(widget.label)
                        : Text("${widget.label} ( اختیاری )"),
                    subtitle: Text(value ?? "موردی انتخاب نشده است"),
                    trailing: ElevatedButton(
                        onPressed: () async {
                          var data = await Navigator.push(context, MaterialPageRoute(builder: (context) => widget.screen)) ;
                          if(data != null) {
                            if(data is CategoryEntity) {
                              setState(() {
                                value = data.title ;
                                widget.controller.text = data.title ;
                              });
                            }
                            field.didChange(value);
                            widget.onResult(data);
                          }

                        }, child: const Text("انتخاب")))),
            FormFieldErrorWidget(field: field)
          ],
        );
      },
    );
  }
}

class FormFieldErrorWidget extends StatelessWidget {
  const FormFieldErrorWidget({super.key, required this.field});

  final FormFieldState field;

  @override
  Widget build(BuildContext context) {
    return field.hasError && field.errorText != null
        ? Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              field.errorText!,
              style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
            ))
        : Container();
  }
}
