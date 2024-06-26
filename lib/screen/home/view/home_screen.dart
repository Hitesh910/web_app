
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/screen/componets/provider/internet_provider.dart';
import 'package:web_app/screen/componets/view/internet_widget.dart';

import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ("Web_App"),
        ),
      ),
      body: context.watch<InternetProvider>().isInternet
          ? GridView.builder(
              itemCount: providerW!.dataList.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'web',arguments: providerR!.dataList[index].link);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [BoxShadow(blurRadius: 8, spreadRadius: -2)],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage("${providerR!.dataList[index].image}"),height: 100,width: 100,),
                        Text("${providerR!.dataList[index].title}",style: const TextStyle(fontSize: 18,color: Colors.blue,fontWeight: FontWeight.w600),)
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(child: InternetWidget()),
    );
  }
}
