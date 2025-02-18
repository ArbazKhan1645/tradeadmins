import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineCharts extends StatelessWidget {
  const LineCharts({super.key, required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 34,
        maxY: 4,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => const LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
        lineChartBarData1_3,
      ];

  LineTouchData get lineTouchData2 => const LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData2 => [
        lineChartBarData2_1,
        lineChartBarData2_2,
        lineChartBarData2_3,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '';
        break;
      case 2:
        text = '';
        break;
      case 3:
        text = '';
        break;
      case 4:
        text = '';
        break;
      case 5:
        text = '';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey.shade400);
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text('Sun', style: style);
        break;
      case 7:
        text = Text('Mon', style: style);
        break;
      case 12:
        text = Text('Tue', style: style);
        break;
      case 17:
        text = Text('Wed', style: style);
        break;
      case 22:
        text = Text('Thu', style: style);
        break;
      case 27:
        text = Text('Fri', style: style);
        break;
      case 32:
        text = Text('Sat', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.transparent),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Colors.grey.shade300,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3.4),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
          FlSpot(14, 1.8),
          FlSpot(15, 1.8),
          FlSpot(16, 1.8),
          FlSpot(17, 5.8),
          FlSpot(18, 1.8),
          FlSpot(19, 1.8),
          FlSpot(20, 4.8),
          FlSpot(21, 1.8),
          FlSpot(22, 1.8),
          FlSpot(23, 2.8),
          FlSpot(24, 1.8),
          FlSpot(25, 1.8),
          FlSpot(26, 4.8),
          FlSpot(27, 1.8),
          FlSpot(28, 3.8),
          FlSpot(29, 1.8),
          FlSpot(30, 1.8),
          FlSpot(31, 2.8),
          FlSpot(31, 1.8),
          FlSpot(33, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: Colors.green,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.green.withOpacity(0),
        ),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 6.8),
          FlSpot(14, 5.8),
          FlSpot(15, 4.8),
          FlSpot(16, 3.8),
          FlSpot(17, 2.8),
          FlSpot(18, 1.8),
          FlSpot(19, 2.8),
          FlSpot(20, 3.8),
          FlSpot(21, 4.8),
          FlSpot(22, 5.8),
          FlSpot(23, 6.8),
          FlSpot(24, 7.8),
          FlSpot(25, 8.8),
          FlSpot(26, 7.8),
          FlSpot(27, 5.8),
          FlSpot(28, 4.8),
          FlSpot(29, 1.8),
          FlSpot(30, 1.8),
          FlSpot(31, 3.8),
          FlSpot(31, 1.8),
          FlSpot(33, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        color: Colors.red,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 2.8),
          FlSpot(3, 1.9),
          FlSpot(6, 3),
          FlSpot(10, 1.3),
          FlSpot(13, 2.5),
          FlSpot(14, 3.8),
          FlSpot(15, 4.8),
          FlSpot(16, 1.8),
          FlSpot(17, 3.8),
          FlSpot(18, 2.8),
          FlSpot(19, 1.8),
          FlSpot(20, 1.8),
          FlSpot(21, 2.8),
          FlSpot(22, 3.8),
          FlSpot(23, 4.8),
          FlSpot(24, 3.8),
          FlSpot(25, 2.8),
          FlSpot(26, 1.8),
          FlSpot(27, 2.8),
          FlSpot(28, 3.8),
          FlSpot(29, 1.8),
          FlSpot(30, 1.8),
          FlSpot(31, 2.8),
          FlSpot(31, 1.8),
          FlSpot(33, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: Colors.green.withOpacity(0.5),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 4),
          FlSpot(5, 1.8),
          FlSpot(7, 5),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(33, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData2_2 => LineChartBarData(
        isCurved: true,
        color: Colors.pink.withOpacity(0.5),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          color: Colors.pink.withOpacity(0.2),
        ),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(33, 3.9),
        ],
      );

  LineChartBarData get lineChartBarData2_3 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: Colors.cyan.withOpacity(0.5),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 3.8),
          FlSpot(3, 1.9),
          FlSpot(6, 5),
          FlSpot(10, 3.3),
          FlSpot(33, 4.5),
        ],
      );
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: LineCharts(isShowingMainData: isShowingMainData),
    );
  }
}
