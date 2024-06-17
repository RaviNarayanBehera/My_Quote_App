
import 'package:flutter/material.dart';

import '../../QuoteModel.dart';
import '../../utils/quotes_lists.dart';


class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

QuoteModel? quoteModel;

class _ListScreenState extends State<ListScreen> {
  @override

  void initState() {
    quoteModel = QuoteModel.toList(quoteListLife);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop("/");
            },
            child: const Icon(Icons.arrow_back_rounded,color: Colors.white,size: 30,)),
        centerTitle: true,
        title: const Text('Quotes',style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            quoteModel!.quoteModelList.length,
                (index) => GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/final');
                selectedIndex = index;
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListTile(
                  title: Text(quoteModel!.quoteModelList[index].quote!),
                  subtitle: Text(quoteModel!.quoteModelList[index].author!),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

int selectedIndex = 0;
