import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Quotes',
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.w500),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.search_outlined,
                          size: 25,
                          weight: 20,
                        ),
                        SizedBox(
                          width: 130,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/life");
                    },
                    child: containBox(img: 'assets/images/life.jpg')),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/life");
                    },
                    child: containBox(img: 'assets/images/goal.jpg')),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/life");
                    },
                    child: containBox(img: 'assets/images/learn.jpg')),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("/life");
                  },
                  child: containBox(img: 'assets/images/inspire.jpg'),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/life");
                    },
                    child: containBox(img: 'assets/images/love.jpg')),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/life");
                    },
                    child: containBox(img: 'assets/images/success.jpeg')),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/life");
                    },
                    child: containBox(img: 'assets/images/positivity.jpg')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container containBox({required String img}) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
      ),
    );
  }
}
