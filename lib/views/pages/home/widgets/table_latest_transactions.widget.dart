import 'package:dlovera_app/constants/box.styles.dart';
import 'package:dlovera_app/constants/text.styles.dart';
import 'package:dlovera_app/models/today_summary.model.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/latest_transaction.datarow.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class TableLatestTransaction extends StatefulWidget {
  const TableLatestTransaction({Key? key, required this.todaySummaryData})
      : super(key: key);
  final TodaySummaryData? todaySummaryData;

  @override
  State<TableLatestTransaction> createState() => _TableLatestTransactionState();
}

class _TableLatestTransactionState extends State<TableLatestTransaction> {
  late LatestTransactionsDataSource _employeeDataSource;

  @override
  void initState() {
    super.initState();
    _employeeDataSource = LatestTransactionsDataSource(
        totalTransactions: widget.todaySummaryData?.latestTransaction ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxStyles.boxContent(),
      child: VStack(
        [
          UiSpacer.verticalSpace(space: Vx.dp3),
          TextStyles.labelBoxText(label: "Latest Transactions").centered(),
          UiSpacer.divider().centered(),
          UiSpacer.verticalSpace(space: Vx.dp5),
          SfDataGrid(
            source: _employeeDataSource,
            shrinkWrapRows: true,
            columnWidthMode: ColumnWidthMode.fill,
            verticalScrollPhysics: const NeverScrollableScrollPhysics(),
            columns: [
              CustomGridColumn().gridColumn('no_faktur', 'No Faktur'),
              CustomGridColumn().gridColumn('nama_customer', 'Nama Customer', alignment: Alignment.centerLeft),
              CustomGridColumn().gridColumn('total', 'Total'),
            ],
          )
        ],
      ),
    );
  }
}
