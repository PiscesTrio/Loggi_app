import 'package:loggi_app/app/data/network/api.dart';
import 'package:loggi_app/app/modules/widgets/warehouse_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggi_app/app/theme/color_palette.dart';
import '../../../data/models/commodity.dart';
import '../../../data/models/warehouse.dart';
import '../../../routes/app_pages.dart';
import '../controllers/product_table_page_controllers.dart';

class ProductTablePage extends GetView<ProductTablePageController> {
  final String? name = 'SB';

  const ProductTablePage({
    Key? key,
    /* this.name*/
  }) : super(key: key);
  List<DataRow> getRows(List<Product>? products) =>
      products!.map((Product product) {
        final cells = [product.name, product.price, product.count];
        return DataRow(
            onSelectChanged: (value) async {
              await Get.toNamed(Routes.PRODUCT_TABLE_DETAL,
                  arguments: product, id: 4);
            },
            cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  Widget buildDataTable() {
    return controller.obx((data) => Obx(() => DataTable(
        showCheckboxColumn: false,
        sortColumnIndex: controller.sortColumnIndex.value,
        sortAscending: controller.isAscending.value,
        columns: [
          DataColumn(label: const Text("名称"), onSort: onSort),
          DataColumn(label: const Text("价格"), onSort: onSort),
          DataColumn(label: const Text("库存"), onSort: onSort),
        ],
        rows: getRows(data))));
  }

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      controller.commo.sort((product1, product2) =>
          compareString(ascending, product1.name, product2.name));
    } else if (columnIndex == 1) {
      controller.commo.sort((product1, product2) =>
          compareNum(ascending, product1.price, product2.price));
    } else if (columnIndex == 2) {
      controller.commo.sort((product1, product2) =>
          compareNum(ascending, product1.count, product2.count));
    }
    controller.onSortList();
    controller.onSort(columnIndex, ascending);
  }

  int compareString(bool ascending, String? value1, String? value2) =>
      ascending ? value1!.compareTo(value2!) : value2!.compareTo(value1!);
  int compareNum(bool ascending, num? value1, num? value2) =>
      ascending ? value1!.compareTo(value2!) : value2!.compareTo(value1!);

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
                          const DefaultTabController(
                              length: 2,
                              child: TabBar(
                                tabs: [
                                  Tab(icon: Icon(Icons.desktop_mac,color: Colors.black,)),
                                  Tab(icon: Icon(Icons.laptop_mac,color: Colors.black)),
                                ],
                              )),
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
                              child: Scrollbar(
                                  child: RefreshIndicator(
                            onRefresh: () {
                              return Future(() {
                                controller.updateData();
                              });
                            },
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: buildDataTable(),
                            ),
                          ))),
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
