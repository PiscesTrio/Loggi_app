import 'package:flutter/material.dart';

import '../../utils/date_display.dart';
import '../../data/api/distribution_track_vo.dart';
import '../../data/api/distribution_vo.dart';

class DistributionStatusItem extends StatelessWidget {
  const DistributionStatusItem({
    super.key,
    required this.distributionStatus,
    required this.distribution,
    required this.isTop,
    required this.isBottom,
    required this.isStart,
  });
  final DistributionTrackVo distributionStatus;
  final DistributionVo distribution;
  final bool isTop;
  final bool isBottom;
  final bool isStart;

  LeftLineWidget _leftLineWidget() {
    if (isTop) {
      return const LeftLineWidget(false, true, true);
    } else if (isBottom) {
      return const LeftLineWidget(true, true, true);
    } else if (isStart) {
      return const LeftLineWidget(false, false, false);
    } else {
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
              // circle and line
              height: 32,
              child: _leftLineWidget(),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 4),
                child: IndexedStack(
                  index: _stepOf(distributionStatus.status),
                  children: [
                    const Text(
                      '配送指示済み',
                      style: TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '集荷完了・現在地：${distributionStatus.location}',
                      style: const TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '輸送中・現在地：${distributionStatus.location}',
                      style: const TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Text(
                      '配送完了',
                      style: TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(left: BorderSide(width: 2, color: Colors.grey)),
          ),
          margin: const EdgeInsets.only(left: 23),
          padding: const EdgeInsets.fromLTRB(22, 0, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'ドライバー：${distribution.driver?.name ?? '-'} / ${distribution.vehicle?.number ?? '-'}',
              ),
              Text('日時：${formatDateTime(distributionStatus.time)}'),
            ],
          ),
        ),
      ],
    );
  }
}

class LeftLineWidget extends StatelessWidget {
  final bool showTop;
  final bool showBottom;
  final bool isLight;

  const LeftLineWidget(
    this.showTop,
    this.showBottom,
    this.isLight, {
    super.key,
  });

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
      Offset(centerX, _topHeight),
      Offset(centerX, size.height),
      linePain,
    );
    canvas.drawCircle(Offset(centerX, _topHeight), centerX, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

/// The tracking row's stage as a stack index.
///
/// It was 0/1/2 on the wire and fed straight into the IndexedStack. It is the enum name the
/// database stores, so the mapping to a screen position is written down here rather than
/// implied by whichever child happened to sit at that index.
int _stepOf(DistributionTrackVoStatusEnum? status) => switch (status) {
  DistributionTrackVoStatusEnum.REVIEW_SUCCESS => 1,
  DistributionTrackVoStatusEnum.END => 2,
  _ => 0,
};
