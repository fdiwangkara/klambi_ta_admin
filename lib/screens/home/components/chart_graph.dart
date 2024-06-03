import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/models/bar_data.dart';

class ChartGraph extends StatelessWidget {
  ChartGraph({super.key});

  final List<double> weeklySummary = [
    4.40,
    2.50,
    42.42,
    10.50,
    100.20,
    88.99,
    90.10,
  ];

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sunAmount: weeklySummary[0],
      monAmount: weeklySummary[1],
      tueAmount: weeklySummary[2],
      wedAmount: weeklySummary[3],
      thuAmount: weeklySummary[4],
      friAmount: weeklySummary[5],
      satAmount: weeklySummary[6],
    );
    myBarData.initializeBarData();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rincian Pendapatan (Minggu Ini)",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: kBlackColor,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              border: Border.all(color: kLightGreyColor),
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
            ),
            child: SizedBox(
              height: 125,
              child: BarChart(
                BarChartData(
                  maxY: 200,
                  minY: 0,
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: getLeftTitles,
                      ),
                    ),
                    rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: getBottomTitles,
                      ),
                    ),
                  ),
                  barGroups: myBarData.barData
                      .map((data) => BarChartGroupData(
                    x: data.x,
                    barRods: [
                      BarChartRodData(
                        toY: data.y,
                        color: kPrimaryColor,
                        width: 20,
                        borderRadius: BorderRadius.circular(10),
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 200,
                          color: kPrimaryColor.withOpacity(0.25),
                        ),
                      ),
                    ],
                  ))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: kBlackColor,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Min', style: style);
      break;
    case 1:
      text = const Text('Sen', style: style);
      break;
    case 2:
      text = const Text('Sel', style: style);
      break;
    case 3:
      text = const Text('Rab', style: style);
      break;
    case 4:
      text = const Text('Kam', style: style);
      break;
    case 5:
      text = const Text('Jum', style: style);
      break;
    case 6:
      text = const Text('Sab', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}

Widget getLeftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 8,
    color: kDarkGreyColor,
  );

  String text;
  switch (value.toInt()) {
    case 0:
      text = 'Rp. 0';
      break;
    case 50:
      text = '50';
      break;
    case 75:
      text = '75';
      break;
    case 100:
      text = '100';
      break;
    case 200:
      text = '200';
      break;
    default:
      return Container();
  }

  return SideTitleWidget(
    child: Text(text, style: style),
    axisSide: meta.axisSide,
    space: 1, // margin between the text and the axis line
  );
}
