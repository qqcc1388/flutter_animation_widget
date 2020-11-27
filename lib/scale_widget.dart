
import 'package:flutter/material.dart';

typedef StatusFunction = void Function(AnimationStatus status);

/// 动画按钮
class ScaleWidget extends StatefulWidget {
  /// 内容区
  final child;

  final StatusFunction onStatus;

  /// 重复动画
  final repeat;

  /// 执行完正向在反向动画  只有设置了repeat才有效
  final reverse;

  /// 动画时长  milliseconds
  final int duration;

  /// 动画最小值
  final double begin;

  /// 动画最大值
  final double end;

  ScaleWidget({
    @required this.child,
    this.duration: 1000,
    this.begin: 0.95,
    this.end: 1.05,
    this.repeat: true,
    this.reverse: true,
    this.onStatus,
  });
  @override
  _ScaleWidgetState createState() => _ScaleWidgetState();
}

class _ScaleWidgetState extends State<ScaleWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    // 1.创建动画
    // AnimationController是一个特殊的Animation对象，在屏幕刷新的每一帧，就会生成一个新的值。默认情况下，AnimationController在给定的时间段内会线性的生成从0.0到1.0的数字。 例如，下面代码创建一个Animation对象，但不会启动它运行：
    // 当创建一个AnimationController时，需要传递一个vsync参数，存在vsync时会防止屏幕外动画
    controller = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      value: widget.begin,
      vsync: this,
    );

    //2.创建动画线性
    //CurvedAnimation 将动画过程定义为一个非线性曲线.
    final Animation curve =
        CurvedAnimation(parent: controller, curve: Curves.linear);

    //3.配置动画生成不同范围值
    //默认情况下，AnimationController对象的范围从0.0到1.0。如果您需要不同的范围或不同的数据类型，则可以使用Tween来配置动画以生成不同的范围或数据类型的值。例如，以下示例，Tween生成从-200.0到0.0的值：
    //final Tween doubleTween = new Tween<double>(begin: -200.0, end: 0.0);
    animation = Tween(
      begin: widget.begin,
      end: widget.end,
    ).animate(curve)
      ..addStatusListener((status) {
        //返回status的状态
        if (widget.onStatus != null) {
          widget.onStatus(status);
        }
      });

    //开启动画，并设置重复
    if (widget.repeat) {
      controller.repeat(reverse: widget.reverse);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return ScaleTransition(
            scale: animation,
            child: widget.child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
