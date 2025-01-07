import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.ontap, required this.title});

  final Function()? ontap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 60,
        width: MediaQuery.sizeOf(context).width * 0.4,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
