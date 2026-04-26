import 'package:loggi_app/app/modules/widgets/toast.dart';
import 'package:loggi_app/app/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/commodity.dart';
import '../../data/models/warehouse.dart';
import '../../data/network/api.dart';
import '../../routes/app_pages.dart';
import 'index.dart';

class ProducttableminpagePage extends GetView<ProducttableminpageController> {
  const ProducttableminpagePage({Key? key}) : super(key: key);

  List<DataRow> getRows(List<Product>? products) =>
      products!.map((Product product) {
        final cells = [product.name, product.price, product.count];
        return DataRow(
            onSelectChanged: (value) async {
              await Get.toNamed(Routes.PRODUCT_TABLE_DETAL,
                  arguments: {"product":product}, id: 4);
            },
            cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells){
    List<DataCell> data =[];
    data.add(DataCell(Text('${cells[0]}')));
    data.add(DataCell(
            Container(
                  
                  decoration: BoxDecoration(
                    color:  Color.fromRGBO(4, 173, 182, 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 2,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                    child: Text(
                      '${cells[1]}',
                      maxLines: 1,
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14,
                        color: ColorPalette.white,
                      ),
                    ),
                  )
                        ],
                      ),
                      SizedBox(width: 2,),
                    ],
                  )),
          ));
          data.add(DataCell(
            Container(
                  
                  decoration: BoxDecoration(
                    color:   Color.fromRGBO(32, 108, 190, 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    
                    mainAxisSize: MainAxisSize.min,
                    children: [SizedBox(width: 2,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                    child: Text(
                      '${cells[2]}',
                      maxLines: 1,
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14,
                        color: ColorPalette.white,
                      ),
                    ),
                  )
                        ],
                      ),SizedBox(width: 2,),
                    ],
                  )),
          ));
          return data;
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 0,
          right: 0,
        ),
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  var productNameController = TextEditingController();
                  var priceController = TextEditingController();
                  return AlertDialog(
                    scrollable: true,
                    title: const Text('添加商品'),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: productNameController,
                              decoration: const InputDecoration(
                                labelText: '商品名',
                                icon: Icon(Icons.add_circle_rounded),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: priceController,
                              decoration: const InputDecoration(
                                labelText: '单价',
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
                            NbRequest().saveProduct(Product.fromMap({
                              "name": productNameController.text,
                              "price": double.parse(priceController.text)
                            })).then((value) {
                              controller.updateData();
                              showTextToast("添加成功");
                              Navigator.pop(context);
                              
                            });
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
      body:  Container(
        color: ColorPalette.aquaHaze,
        child: Scrollbar(
      
              child: RefreshIndicator(
              onRefresh: () {
                return Future(() {
                  controller.updateData();
                });
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  buildDataTable(),
                  SizedBox(height: 1000,)
                ]),
              ),
            )),
      )
    );
  }

}