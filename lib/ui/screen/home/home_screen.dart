import 'package:cat_facts_flutter/core/constant/constant.dart';
import 'package:cat_facts_flutter/core/controllers/cats_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.put(CatsController());

  @override
  void initState() {
    _controller.getFeedList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final catsFats = _controller.catdList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Facts'),
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.app),
          );
        } else {
          return ListView.builder(
            itemCount: catsFats.length,
            itemBuilder: (context, index) {
              final catFact = catsFats[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text(
                      catFact.text,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Source: ${catFact.source}\n'
                      'Created At: ${catFact.createdAt.toLocal()}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    isThreeLine: true,
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
