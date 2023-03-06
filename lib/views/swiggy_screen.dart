import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/model/dummy_data_model.dart';
import 'package:my_app/views/widget/common_text_field.dart';
import '../model/test_model.dart';

class SwiggyScreen extends StatefulWidget {
  const SwiggyScreen({super.key});

  @override
  State<SwiggyScreen> createState() => _SwiggyScreenState();
}

class _SwiggyScreenState extends State<SwiggyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // BODY
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const CommonTextField(),
              customGridView(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
                child: PageView.builder(
                    // controller: PageController(viewportFraction: 1),
                    scrollDirection: Axis.horizontal,
                    itemCount: dummydataList.length,
                    itemBuilder: (context, index) {
                      DummyDataModel item = dummydataList[index];
                      return Container(
                        decoration: BoxDecoration(
                          // color: Colors.amber,
                          image: DecorationImage(
                            image: AssetImage(item.image),
                            fit: BoxFit.contain,
                          ),
                        ),
                        // child: Image.asset(
                        //   item.image ?? '',
                        //   // width: 100,
                        // ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

GridView customGridView() => GridView.count(
      // primary: false,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: kIsWeb ? 1.5 / 0.5 : 1,
      shrinkWrap: true,
      children: List.generate(testData.length, (index) {
        TestModel testItem = testData[index];
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                      )
                    ]),
                child: Image.asset(
                  testItem.image!,
                  // data[index]['image'],
                  width: 80,
                ),
              ),
              Text(
                testItem.title ?? "",
                //data[index]['name'],
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14, height: 1.5),
              ),
            ],
          ),
        );
      }),
    );
