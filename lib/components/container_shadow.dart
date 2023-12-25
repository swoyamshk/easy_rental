import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContainerWithShadow extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final String? url;

  ContainerWithShadow({
    required this.child,
    this.height,
    this.width,
    this.color,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (url != null) {
          _launchURL(url!);
        }
      },
      child: Container(
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
      ),
    );
  }

  Future<void> _launchURL(String? url) async {
    if (url != null && url.isNotEmpty) {
      try {
        await launch(url, forceSafariVC: false);
      } catch (e) {
        throw 'Could not launch $url';
      }
    }
  }


}
