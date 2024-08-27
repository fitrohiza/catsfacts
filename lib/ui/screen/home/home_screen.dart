import 'package:cat_facts_flutter/core/constant/constant.dart';
import 'package:cat_facts_flutter/core/constant/text_styles.dart';
import 'package:cat_facts_flutter/core/controllers/cats_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
      backgroundColor: AppColors.grayshade,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.app,
        leading: Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.all(8),
            child: Image.asset("assets/images/icon.png")),
        centerTitle: true,
        title: Text(
          'Cat Facts',
          style: KTextStyle.textWhiteStyle
              .copyWith(fontWeight: FontWeight.bold, fontSize: 11.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ))
        ],
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.app),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 6),
            child: ListView.builder(
              itemCount: catsFats.length,
              itemBuilder: (context, index) {
                final catFact = catsFats[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(catFact.text,
                          style: KTextStyle.standartTextStyle),
                      subtitle: Text(
                        'Source: ${catFact.source}\n'
                        'Created At: ${catFact.createdAt.toLocal()}',
                        style: KTextStyle.textFieldHintStyle,
                      ),
                      isThreeLine: true,
                    ),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
