import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GlobalWidgets {
  static const Color primaryColor = Color(0xff5b449b);
  static Widget customAppBar(String title,
      {function, double? top, double? bottom, double? left, double? right}) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(left ?? 28, top ?? 28, right ?? 28, bottom ?? 28),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(title,
                style: const TextStyle(
                    color: Color(0xff302f31),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0),
                textAlign: TextAlign.left),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: function ?? () => Get.back(),
              child: const Icon(Icons.chevron_left),
            ),
          ),
        ],
      ),
    );
  }

  static Widget rowBar(String title,
      {Widget? widget,
      double? left,
      double? top,
      double? right,
      double? bottom}) {
    return Container(
      margin:
          EdgeInsets.fromLTRB(left ?? 28, top ?? 28, right ?? 28, bottom ?? 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.chevron_left,
                size: 32,
                color: Color(0xff302f31),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(title,
                style: const TextStyle(
                    color: Color(0xff302f31),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0),
                textAlign: TextAlign.left),
          ),
          // Rectangle 1242
          widget ??
              const SizedBox(
                height: 40,
                width: 40,
              )
        ],
      ),
    );
  }

  static Widget loader({double? top, double? bottom}) {
    return Center(
      child: Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.only(top: top ?? 00, bottom: bottom ?? 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10),
            ]),
        padding: const EdgeInsets.all(12),
        child: const CircularProgressIndicator(
          color: Colors.deepPurpleAccent,
          strokeWidth: 3,
        ),
      ),
    );
  }

  static Widget textButton(text,
      {function, double? bottom, double? height, double? right, Color? color}) {
    return GestureDetector(
      onTap: function ?? () {},
      child: Container(
        height: height ?? 52,
        margin: EdgeInsets.only(bottom: bottom ?? 0, right: right ?? 0),
        decoration: BoxDecoration(
          // color: const Color(0xff5b449b),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(text,
            style: TextStyle(
                color: color ?? const Color(0xff5b449b),
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 15.0),
            textAlign: TextAlign.center),
      ),
    );
  }

  static void pushScreen(Widget screen) {
    Get.to(
      () => screen,
      transition: Transition.zoom,
      duration: const Duration(milliseconds: 300),
    );
  }

  static Widget customField(
      {bool? enabled,
      TextEditingController? controller,
      bool? obscure,
      validator,
      String? text,
      Color? textColor,
      TextInputType? type,
      double? height,
      TextStyle? style,
      String? prefixText,
      bool? addpadding,
      int? maxLength,
      onChange,
      onEditingComplete}) {
    return SizedBox(
      height: height ?? 60,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: addpadding == true ? 28 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(text,
                        style: style ??
                            TextStyle(
                                color: textColor ?? const Color(0xff968ea1),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                        textAlign: TextAlign.left),
                  )
                : const SizedBox(),
            Expanded(
              child: TextFormField(
                enabled: enabled,
                controller: controller,
                obscureText: obscure ?? false,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                    ),
                    prefixText: prefixText),
                style: const TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w500,
                    fontFamily: "SFProText",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                onChanged: onChange ?? (val) {},
                onEditingComplete: onEditingComplete ?? () {},
                maxLength: maxLength,
                maxLengthEnforcement: maxLength != null
                    ? MaxLengthEnforcement.enforced
                    : MaxLengthEnforcement.none,
                validator: validator ??
                    (value) {
                      if (value!.trim().isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                keyboardType: type ?? TextInputType.text,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showDialog(
      {required String heading, required String content, onComplete}) {
    Get.dialog(Container(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 28),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        child: Material(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GlobalWidgets.headTextViewer(heading),
              GlobalWidgets.contentTextViewer(content,
                  alignment: Alignment.center, top: 20, bottom: 20),
              GlobalWidgets.bottomButton('OK',
                  function: onComplete ??
                      () {
                        Get.back();
                      })
            ],
          ),
        ),
      ),
    ));
  }

  static Widget bottomButton(String text,
      {function,
      double? bottom,
      double? top,
      double? left,
      double? right,
      double? height,
      bool? enabled,
      Color? color,
      Color? textColor}) {
    return GestureDetector(
      onTap: enabled == false ? () {} : (function ?? () {}),
      child: Container(
        height: height ?? 52,
        constraints: const BoxConstraints(maxWidth: 360),
        margin: EdgeInsets.fromLTRB(
            left ?? 28, top ?? 0, right ?? 28, bottom ?? 28),
        decoration: BoxDecoration(
          color: color ??
              (enabled == false
                  ? const Color(0xfff3f2f7)
                  : Colors.deepPurpleAccent),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(text,
            style: TextStyle(
                color: textColor ??
                    (enabled == false ? const Color(0xff968ea1) : Colors.white),
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 15.0),
            textAlign: TextAlign.center),
      ),
    );
  }

  static Widget settableButtom(
      {required variable,
      required value,
      required function,
      double? width,
      required String text,
      double? right}) {
    return GestureDetector(
      onTap: function ?? () {},
      child: Container(
        width: width ?? 108,
        height: 40,
        margin: EdgeInsets.only(right: right ?? 0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: value == variable
              ? Colors.deepPurpleAccent
              : const Color(0xfff3f2f7),
        ),
        alignment: Alignment.center,
        child: Text(text,
            style: TextStyle(
                color:
                    value == variable ? Colors.white : const Color(0xff968ea1),
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 12.0),
            textAlign: TextAlign.center),
      ),
    );
  }

  static Widget dropDown(
      {value, required List list, function, required String heading}) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 70,
      child: Column(
        children: [
          GlobalWidgets.headTextViewer(heading, top: 0, left: 0),
          Expanded(
            child: DropdownButton(
              underline: const Divider(
                color: Color(0xffddd9e2),
                thickness: 2,
              ),
              isExpanded: true,
              value: value,
              items: list.map((e) {
                return DropdownMenuItem(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(e,
                        style: dropDownItemTextstyle(),
                        textAlign: TextAlign.left),
                  ),
                  value: e,
                );
              }).toList(),
              onChanged: function,
            ),
          ),
        ],
      ),
    );
  }

  static TextStyle dropDownItemTextstyle({double? size}) {
    return TextStyle(
        color: const Color(0xff302f31),
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
        fontStyle: FontStyle.normal,
        fontSize: size ?? 15.0);
  }

  static Widget headTextViewer(String text,
      {double? top,
      double? left,
      double? right,
      double? bottom,
      Alignment? alignment,
      double? width,
      Color? color,
      double? size,
      TextAlign? textAlign}) {
    return Container(
      constraints: BoxConstraints(maxWidth: width ?? 360),
      margin: EdgeInsets.fromLTRB(
          alignment == Alignment.center ? 0 : left ?? 20,
          top ?? 15,
          right ?? 0,
          bottom ?? 0),
      alignment: alignment ?? Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
            color: color ?? const Color(0xff968ea1),
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
            fontStyle: FontStyle.normal,
            fontSize: size ?? 12.0),
        textAlign: textAlign ?? TextAlign.left,
      ),
    );
  }

  static Widget addButton(
      {onTap, customIcon, double? size, Widget? imageIcon, double? padding}) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: size ?? 40,
        height: size ?? 40,
        padding: EdgeInsets.all(padding ?? 0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xfff3f2f7),
        ),
        child: imageIcon ??
            Icon(
              customIcon ?? Icons.add,
              color: Colors.deepPurpleAccent,
              size: 30,
            ),
      ),
    );
  }

  dateSelector() {}

  static Widget contentTextViewer(String text,
      {double? top,
      double? bottom,
      double? right,
      double? left,
      double? size,
      double? width,
      Color? color,
      Alignment? alignment,
      bool? underline,
      TextAlign? textAlign}) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 360, minWidth: 0),
      margin: EdgeInsets.fromLTRB(
          alignment == Alignment.center ? 0 : left ?? 20,
          top ?? 0,
          right ?? 0,
          bottom ?? 0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: underline != true
                ? Colors.transparent
                : const Color(0xffddd9e2),
          ),
        ),
      ),
      alignment: alignment ?? Alignment.centerLeft,
      width: width,
      child: Text(text,
          style: TextStyle(
              color: color ?? const Color(0xff302f31),
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              fontStyle: FontStyle.normal,
              fontSize: size ?? 16.0),
          textAlign: textAlign ?? TextAlign.left),
    );
  }
}
