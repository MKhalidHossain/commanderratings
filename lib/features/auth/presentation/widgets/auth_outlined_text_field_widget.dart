import 'package:flutter/material.dart';

class AuthOutlinedTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  final bool isLable;
  // final String? lebel;
  final TextInputType textInputType;
  final String textFieldHeaderName;
  final bool isObsecure;

  const AuthOutlinedTextFieldWidget({
    super.key,
    required this.controller,
    required this.name,
    this.isLable = false,
    // this.lebel,
    required this.textInputType,
    required this.textFieldHeaderName,
    this.isObsecure = false,
  });

  @override
  State<AuthOutlinedTextFieldWidget> createState() =>
      _AuthOutlinedTextFieldWidgetState();
}

class _AuthOutlinedTextFieldWidgetState
    extends State<AuthOutlinedTextFieldWidget> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textFieldHeaderName,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 7),
        SizedBox(
          height: 50,
          child: TextField(
            //keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.left,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            style: TextStyle(color: Colors.black),
            obscureText: widget.isObsecure ? !_obscureText : false,

            decoration: InputDecoration(
              // labelText: isLable && lebel != null ? lebel : null,

              //labelText: lebel,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
              suffixIcon:
                  widget.isObsecure
                      ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey.shade600,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                      : null,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade500, width: 2.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
