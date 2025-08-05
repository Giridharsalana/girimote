
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:girimote/core/constants/app_constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:girimote/features/dashboard/data/models/widget_model.dart';
import 'package:girimote/features/dashboard/presentation/widgets/plot_widget.dart';
import 'package:girimote/features/dashboard/presentation/widgets/gauge_widget.dart';
import 'package:girimote/features/dashboard/presentation/widgets/switch_widget.dart';
import 'package:girimote/features/dashboard/presentation/widgets/button_widget.dart';
import 'package:girimote/features/dashboard/presentation/view_models/dashboard_view_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardViewModel(),
      child: Consumer<DashboardViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Dashboard'),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              foregroundColor: kPrimaryColor,
              actions: [
                IconButton(
                  icon: Icon(
                    viewModel.isEditMode ? Icons.check_circle : Icons.edit,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    viewModel.toggleEditMode();
                  },
                ),
              ],
            ),
            body: StaggeredGrid.count(
              crossAxisCount: 6,
              children: viewModel.widgets.map((widget) {
                return StaggeredGridTile.count(
                  crossAxisCellCount: widget.width,
                  mainAxisCellCount: widget.height,
                  child: _buildWidget(widget, viewModel),
                );
              }).toList(),
            ),
            floatingActionButton: viewModel.isEditMode
                ? FloatingActionButton.extended(
                    onPressed: () {
                      _showAddWidgetDialog(context, viewModel);
                    },
                    label: const Text('Add Widget'),
                    icon: const Icon(Icons.add),
                    backgroundColor: kPrimaryColor,
                  )
                : null,
          );
        },
      ),
    );
  }

  Widget _buildWidget(DashboardWidgetModel widget, DashboardViewModel viewModel) {
    switch (widget.type) {
      case WidgetType.gauge:
        return GaugeWidget(widget: widget, viewModel: viewModel);
      case WidgetType.switchWidget:
        return SwitchWidget(widget: widget, viewModel: viewModel);
      case WidgetType.button:
        return ButtonWidget(widget: widget, viewModel: viewModel);
      case WidgetType.plot:
        return PlotWidget(widget: widget, viewModel: viewModel);
    }
  }

  void _showAddWidgetDialog(BuildContext context, DashboardViewModel viewModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Widget'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Gauge'),
                onTap: () {
                  viewModel.addWidget(WidgetType.gauge);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Switch'),
                onTap: () {
                  viewModel.addWidget(WidgetType.switchWidget);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Button'),
                onTap: () {
                  viewModel.addWidget(WidgetType.button);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Plot'),
                onTap: () {
                                    viewModel.addWidget(WidgetType.plot);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
