import 'package:flutter/material.dart';

import 'container_shadow.dart';

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
                  url: "https://www.gmail.com/",
                  child: const Row(
                    children: [
                      Icon(Icons.mail, size: 25, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        'Email Us',
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ContainerWithShadow(
                  height: 60,
                  width: 300,
                  color: Colors.white,
                  url: 'https://www.whatsapp.com/',
                  child: const Row(
                    children: [
                      Icon(Icons.phone,
                          size: 25, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        'Whatsapp',
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ContainerWithShadow(
                  height: 60,
                  width: 300,
                  color: Colors.white,
                  url: 'https://www.instagram.com/',
                  child: const Row(
                    children: [
                      Icon(Icons.camera_alt_rounded,
                          size: 25, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        'Instagram',
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ContainerWithShadow(
                  height: 60,
                  width: 300,
                  color: Colors.white,
                  url: 'https://www.facebook.com/',
                  child: const Row(
                    children: [
                      Icon(Icons.facebook, size: 25, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        'Facebook',
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
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
                      Icon(Icons.support_agent_outlined,
                          size: 25, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        'Support',
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ContainerWithShadow(
                  height: 60,
                  width: 300,
                  color: Colors.white,
                  url: 'tiktok.com',
                  child: const Row(
                    children: [
                      Icon(Icons.tiktok, size: 25, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        'Tiktok',
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
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
