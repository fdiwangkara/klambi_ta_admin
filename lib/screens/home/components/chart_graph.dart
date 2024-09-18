import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/helper/constants.dart';

import '../../orders/orders_controller.dart';

class ChartGraph extends StatelessWidget {
  final OrdersController ordersController = Get.find<OrdersController>();

  ChartGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Map<int, double> weeklySummary = ordersController.getWeeklySummary();

      return Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Grafik Pendapatan (Minggu Ini)',
              style: TextStyle(
                fontSize: 14,
                color: kBlackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 500000,
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const days = [
                            'Min',
                            'Sen',
                            'Sel',
                            'Rab',
                            'Kam',
                            'Jum',
                            'Sab'
                          ];
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              days[value.toInt()],
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          );
                        },
                        reservedSize: 32,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 100000,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return Text(
                            '${value ~/ 1000}',
                            style: const TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          );
                        },
                        reservedSize: 42,
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.2),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                  barGroups: List.generate(7, (index) {
                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: weeklySummary[index] ?? 0.0,
                          gradient: LinearGradient(
                            colors: [
                              kPrimaryColor.withOpacity(0.7),
                              kPrimaryColor,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          width: 22,
                          borderRadius: BorderRadius.circular(12),
                          backDrawRodData: BackgroundBarChartRodData(
                            show: true,
                            toY: 500000,
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                swapAnimationDuration: const Duration(milliseconds: 300),
                swapAnimationCurve: Curves.easeInOut,
              ),
            ),
          ],
        ),
      );
    });
  }
}
