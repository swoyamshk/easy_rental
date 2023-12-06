import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(height: 10),
                ContainerWithShadow(
                  height: 60,
                  width: 300,
                  color: Colors.white,
                  child: const Row(
                    children: [
                      Icon(Icons.mail, size: 30, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        'Email Us',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ContainerWithShadow(
                  height: 60,
                  width: 300,
                  color: Colors.white,
                  child: const Row(
                    children: [
                      Icon(Icons.cleaning_services,
                          size: 30, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        'Whatsapp',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ContainerWithShadow(
                  height: 60,
                  width: 300,
                  color: Colors.white,
                  child: const Row(
                    children: [
                      Icon(Icons.whatshot, size: 30, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        'Contact us',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ContainerWithShadow(
                  height: 60,
                  width: 300,
                  color: Colors.white,
                  child: const Row(
                    children: [
                      Icon(Icons.facebook, size: 30, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        'Facebook',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ContainerWithShadow(
                  height: 60,
                  width: 300,
                  color: Colors.white,
                  child: const Row(
                    children: [
                      Icon(Icons.earbuds_battery,
                          size: 30, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        'Support',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ContainerWithShadow(
                  height: 60,
                  width: 300,
                  color: Colors.white,
                  child: const Row(
                    children: [
                      Icon(Icons.tiktok, size: 30, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        'Tiktok',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerWithShadow extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;

  ContainerWithShadow(
      {required this.child, this.height, this.width, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(45.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
