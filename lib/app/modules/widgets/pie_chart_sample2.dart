
import 'package:loggi_app/app/data/models/index.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../theme/color_palette.dart';
import 'indicator.dart';
import 'package:flutter/material.dart';

class PieChartSample2 extends StatelessWidget {
  final List<CommdityVo> data;
  PieChartSample2({Key? key, required this.data}):super(key:key);
     final List<Color> color = [
    ColorPalette.contentColorBlue,
    ColorPalette.contentColorYellow,
    ColorPalette.contentColorOrange,
    ColorPalette.contentColorGreen,
    ColorPalette.contentColorPurple,
    ColorPalette.contentColorPink,
    ColorPalette.contentColorRed,
    ColorPalette.contentColorCyan,
  ];

  


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 5,
                    centerSpaceRadius: 0,
                    sections: List.generate(data.length, (index) {
                      return PieChartSectionData(
                        color: color[index % 8],
                        value: data[index].value!.toDouble(),
                        title: data[index].name,
                        titlePositionPercentageOffset: 1.1,
                        radius: 100,
                        titleStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color:  Colors.black,
                          shadows: [Shadow(color: color[index % 8],blurRadius: 4)],
                        ),
                      );
                    })),
              ),
            ),
          ),
       
        
        ],
      ),);
    
  }


}
