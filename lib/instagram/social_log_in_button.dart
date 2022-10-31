// ignore_for_file: deprecated_member_use, prefer_equal_for_default_values, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String? butonText;
  final Color? butonColor;
  final Color? textColor;
  final double? radius;
  final Widget? butonIcon;
  final double? yukseklik;
  final VoidCallback? onPressed;

  const SocialLoginButton(
      {Key? key,
      @required this.butonText,
      this.butonColor: Colors.purple,
      this.textColor: Colors.white,
      this.radius: 16,
      this.butonIcon,
      this.yukseklik: 40,
      @required this.onPressed})
      : assert(butonText != null, onPressed != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: yukseklik,
        child: RaisedButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius!),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              butonIcon != null ? butonIcon! : Container(),
              Text(
                butonText!,
                style: TextStyle(color: textColor),
              ),
              //opacirty görünürlük için kullanıyoruz 3. elemaların görünürlüğünü sıfır yaptık
              butonIcon != null
                  ? Opacity(
                      opacity: 0,
                      child: butonIcon,
                    )
                  : Container(),
            ],
          ),
          color: butonColor,
        ),
      ),
    );
  }
}
