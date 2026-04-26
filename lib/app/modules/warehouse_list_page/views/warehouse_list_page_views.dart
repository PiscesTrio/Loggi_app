
import 'package:loggi_app/app/data/network/api.dart';
import 'package:loggi_app/app/modules/widgets/warehouse_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggi_app/app/theme/color_palette.dart';
import '../../../data/models/warehouse.dart';
import '../controllers/warehouse_list_page_controllers.dart';

class WarehouseListPage extends GetView<WarehouseListPageController> {
  final String? name = 'SB';
  const WarehouseListPage({
    Key? key,
    /* this.name*/
  }) : super(key: key);

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          right: 10,
        ),
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  var principleController = TextEditingController();
                  var warehouseNameController = TextEditingController();
                  return AlertDialog(
                    scrollable: true,
                    title: const Text('添加仓库'),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: warehouseNameController,
                              decoration: const InputDecoration(
                                labelText: '仓库名',
                                icon: Icon(Icons.warehouse),
                              ),
                            ),
                            TextFormField(
                              controller: principleController,
                              decoration: const InputDecoration(
                                labelText: '负责人',
                                icon: Icon(Icons.account_circle),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      OutlinedButton(
                          child: const Text("取消"),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      ElevatedButton(
                          child: const Text("确认"),
                          onPressed: () {
                            NbRequest().saveWarehouse(Warehouse.fromMap({
                              "name": warehouseNameController.text,
                              "principle": principleController.text
                            }));
                          })
                    ],
                  );
                });
          },
          splashColor: ColorPalette.bondyBlue,
          backgroundColor: ColorPalette.pacificBlue,
          child: const Icon(
            Icons.add,
            color: ColorPalette.white,
          ),
        ),
      ),
      body: Container(
        color: ColorPalette.pacificBlue,
        child: SafeArea(
          child: Container(
            color: ColorPalette.aquaHaze,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 15,
                  ),
                  width: double.infinity,
                  height: 90,
                  decoration: const BoxDecoration(
                    color: ColorPalette.pacificBlue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_left_rounded,
                              size: 35,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Text(
                            name!.length > 14
                                ? '${name!.substring(0, 12)}..'
                                : name!,
                            style: const TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 28,
                              color: ColorPalette.timberGreen,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            splashColor: ColorPalette.timberGreen,
                            icon: const Icon(
                              Icons.search,
                              color: ColorPalette.timberGreen,
                            ),
                            onPressed: () {
                              print("search");
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         SearchProductInGroupPage(
                              //       name: name,
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: ColorPalette.timberGreen,
                            ),
                            onPressed: () {
                              //TODO
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          const Text(
                            "Products",
                            style: TextStyle(
                              color: ColorPalette.timberGreen,
                              fontSize: 20,
                              fontFamily: "Nunito",
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: RefreshIndicator(
                            
                              onRefresh:() {
                                return Future((){controller.updateData();});
                              },
                                child: controller.obx(
                              (data) => ListView.builder(
                                  itemCount: data?.length,
                                  itemBuilder: (context, index) {
                                    return WarehouseCard(
                                      warehouse: data![index], iconIndex: index,
                                    );
                                  }),
                            )),
                            
                          ),
                        ],
                      ),
                    ),
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
