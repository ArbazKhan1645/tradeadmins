// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/modules/orders_history/controllers/orders_history_controller.dart';
import 'package:partner_hub/app/modules/orders_history/models/price_level_model.dart';
import 'package:partner_hub/app/modules/orders_history/models/products_model.dart';

class DataTableExample extends StatefulWidget {
  const DataTableExample({super.key});

  @override
  _DataTableExampleState createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersHistoryController>(builder: (controller) {
      return Scrollbar(
        controller: controller.scrollController,
        child: SingleChildScrollView(
          controller: controller.scrollController,
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor:
                WidgetStateProperty.all<Color>(const Color(0xff00b075)),
            dataRowColor: WidgetStateProperty.all<Color>(Colors.white),
            key: const Key('datatable'),
            columns: _buildColumns(controller.pricelevelList),
            rows: _buildRows(
              controller.returnProductList() as List<ProductModel>,
              controller.startingIndex,
            ),
          ),
        ),
      );
    });
  }

  List<DataColumn> _buildColumns(List<PricelevelModel> pricelevelLists) {
    List<DataColumn> columns = [];
    columns.add(buildDataColumnWidget('Order ID'));
    columns.add(buildDataColumnWidget('Order Date'));
    columns.add(buildDataColumnWidget('Customer Name'));
    columns.add(buildDataColumnWidget('Location'));
    columns.add(buildDataColumnWidget('Amount'));
    columns.add(buildDataColumnWidget('Order Status'));
    columns.add(buildDataIconcolumWidgets('Action'));

    return columns;
  }

  List<DataRow> _buildRows(List<ProductModel> products, int startingindex) {
    List<DataRow> rows = [];
    for (int i = 0; i < products.length; i++) {
      var product = products[i];
      List<DataCell> cells = [];
      cells.add(buildRowWidget('#Ord1863806'));
      cells.add(buildRowWidget(DateTime.now().toString()));
      cells.add(buildRowWidget('Arbaz Mashwani'));
      cells.add(buildRowWidget('Corner Street 5th London'));
      cells.add(buildRowWidget('\$237.89'));
      cells.add(buildOrderStatusWidget(i));
      cells.add(buildIconRowWidget('\$237.89'));

      rows.add(DataRow(cells: cells));
    }
    return rows;
  }

  DataColumn buildDataColumnWidget(String text) {
    return DataColumn(
      tooltip: text,

      label: SizedBox(
        width: MediaQuery.of(context).size.width * 0.20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.5,
                  color: Colors.white),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ],
        ),
      ),
      // Set custom styles for the header cell
    );
  }

  buildDataIconcolumWidgets(String text) {
    return DataColumn(
      label: SizedBox(
          width: MediaQuery.of(context).size.width * 0.20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.5),
              )),
            ],
          )),
    );
  }

  buildRowWidget(String cell) {
    return DataCell(
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.20,
          child: Center(child: Text(cell))),
    );
  }

  buildIconRowWidget(String cell) {
    return DataCell(
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.20,
          child: Center(
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_horiz)))),
    );
  }

  buildOrderStatusWidget(int cell) {
    return DataCell(
      Builder(builder: (context) {
        bool isSelected = cell.isEven;

        return SizedBox(
            width: MediaQuery.of(context).size.width * 0.20,
            child: Container(
              height: 35,
              width: 150,
              decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xffffefeb)
                      : const Color(0xffdff1f9),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                  child: Text(isSelected ? 'New Order' : "Accepted Order",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? const Color(0xffe0a097)
                              : const Color(0xff7fc0db)))),
            ));
      }),
    );
  }
}
