import 'package:dlovera_app/constants/box.styles.dart';
import 'package:dlovera_app/constants/text.styles.dart';
import 'package:dlovera_app/models/today_summary.model.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/widgets/buttons/custom_button.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/latest_transaction.datarow.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class TableLatestTransaction extends StatefulWidget {
  const TableLatestTransaction({Key? key, required this.todaySummaryData, this.onPressed})
      : super(key: key);
  final TodaySummaryData? todaySummaryData;
  final Function()? onPressed;

  @override
  State<TableLatestTransaction> createState() => _TableLatestTransactionState();
}

class _TableLatestTransactionState extends State<TableLatestTransaction> {
  late LatestTransactionsDataSource _latestTransactionsDataSource;

  @override
  void initState() {
    super.initState();
    _latestTransactionsDataSource = LatestTransactionsDataSource(
        latestTransactions: widget.todaySummaryData?.latestTransaction ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxStyles.boxContent(),
      child: VStack(
        [
          UiSpacer.verticalSpace(space: Vx.dp5),
          TextStyles.labelBoxText(label: "Latest Transactions").centered(),
          UiSpacer.divider().centered(),
          UiSpacer.verticalSpace(space: Vx.dp5),
          SfDataGrid(
            source: _latestTransactionsDataSource,
            shrinkWrapRows: true,
            columnWidthMode: ColumnWidthMode.fill,
            verticalScrollPhysics: const NeverScrollableScrollPhysics(),
            columns: [
              CustomGridColumn().gridColumn('no_faktur', 'No Faktur'),
              CustomGridColumn().gridColumn('nama_customer', 'Nama Customer', alignment: Alignment.centerLeft),
              CustomGridColumn().gridColumn('total', 'Total'),
            ],
          ),
          // UiSpacer.verticalSpace(space: Vx.dp5),
          CustomButton(
            height: 40,
            title: "See all transactions",
            onPressed: widget.onPressed,
          ).w(210).centered().pOnly(top: Vx.dp12, bottom: Vx.dp16),
          // UiSpacer.verticalSpace(space: Vx.dp8),
        ],
      ),
    );
  }
}
