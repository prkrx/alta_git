import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tentang',
          style: TextStyle(),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(100, 6, 100, 255)),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Center(
              child: Container(
                child: const Text(
                  'Tentang Kami',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: const Text(
                    'Xfellz adalah sebuah wadah untuk saling berbagi cerita',
                    style: TextStyle(
                      fontSize: 15
                    ),
                    textAlign: TextAlign.justify,
                    ),
              ),
            ),
            buildCard(icon: Icons.info_outline, text: 'Xfellz Informasi'),
            buildCard(icon: Icons.people_alt_outlined, text: 'Xfellz Komunitas'),
          ],
        ),
      ),
    );
  }
  Card buildCard({IconData icon, String text}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 10,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Icon(icon),
          ),
          Text(text)
        ],
      ),
    );
  }
}
