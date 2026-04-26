import 'package:loggi_app/app/data/models/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/distribution_status.dart';

class DistributionStatusItem extends StatelessWidget {
  const DistributionStatusItem(
      {Key? key,
      required this.distributionStatus,
      required this.distribution,
      required this.isTop,
      required this.isBottom,
      required this.isStart})
      : super(key: key);
  final DistributionStatus distributionStatus;
  final Distribution distribution;
  final bool isTop;
  final bool isBottom;
  final bool isStart;

  LeftLineWidget _leftLineWidget(){
   
                  if(isTop){
                    return const LeftLineWidget(false
                    , true, true);
                  }else if(isBottom){
                    return const LeftLineWidget(true, true, true);

                  }else if(isStart){
                    return const LeftLineWidget(false, false, false);
                  }else{
                    return const LeftLineWidget(true, true, false);
                  }
                
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                // 圆和线
                height: 32,
                child: _leftLineWidget()),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.only(top: 4),
                    child: IndexedStack(
                      index: distributionStatus.status,
                      children: [
                        const Text(
                          '已派遣任务',
                          style: TextStyle(fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '已取货，当前在${distributionStatus.location}',
                          style: const TextStyle(fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '正在运输，当前在${distributionStatus.location}',
                          style: const TextStyle(fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Text(
                          '已完成配送',
                          style: TextStyle(fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )))
          ],
        ),
        Container(
          decoration: const BoxDecoration(
              border: Border(left: BorderSide(width: 2, color: Colors.grey))),
          margin: const EdgeInsets.only(left: 23),
          padding: const EdgeInsets.fromLTRB(22, 0, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('驾驶员：${distribution.driver} , ${distribution.number}'),
              Text('时间：${distributionStatus.time}')
            ],
          ),
        )
      ],
    );
  }
}

class LeftLineWidget extends StatelessWidget {
  final bool showTop;
  final bool showBottom;
  final bool isLight;

  const LeftLineWidget(this.showTop, this.showBottom, this.isLight,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: 16,
      child: CustomPaint(
        painter: LeftLinePainter(showTop, showBottom, isLight),
      ),
    );
  }
}

class LeftLinePainter extends CustomPainter {
  static const double _topHeight = 16;
  static const Color _lightColor = Colors.deepPurpleAccent;
  static const Color _normalColor = Colors.grey;

  final bool showTop;
  final bool showBottom;
  final bool isLight;

  const LeftLinePainter(this.showTop, this.showBottom, this.isLight);

  @override
  void paint(Canvas canvas, Size size) {
    double lineWidth = 2;
    double centerX = size.width / 2;
    Paint linePain = Paint();
    linePain.color = showTop ? Colors.grey : Colors.transparent;
    linePain.strokeWidth = lineWidth;
    linePain.strokeCap = StrokeCap.square;
    canvas.drawLine(Offset(centerX, 0), Offset(centerX, _topHeight), linePain);
    Paint circlePaint = Paint();
    circlePaint.color = isLight ? _lightColor : _normalColor;
    circlePaint.style = PaintingStyle.fill;
    linePain.color = showBottom ? Colors.grey : Colors.transparent;
    canvas.drawLine(
        Offset(centerX, _topHeight), Offset(centerX, size.height), linePain);
    canvas.drawCircle(Offset(centerX, _topHeight), centerX, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
