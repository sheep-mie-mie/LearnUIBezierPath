# LearnUIBezierPath
学习贝塞尔曲线
===========================
# 贝塞尔曲线和CAShapeLayer 基本属性
===========================

* CAShapeLayer 优点
- CAShapeLayer继承自CALayer，因此，可使用CALayer的所有属性。但是，CAShapeLayer需要和贝塞尔曲线配合使用才有意义。
- CAShapeLayer和drawRect的比较
- 1.drawRect：属于CoreGraphics框架，占用CPU，性能消耗大 
- 2.CAShapeLayer：属于CoreAnimation框架，通过GPU来渲染图形，节省性能。动画渲染直接提交给手机GPU，不消耗内存

===========================
# CAShapeLayer与UIBezierPath的关系：
===========================
- 1.CAShapeLayer中shape代表形状的意思，所以需要形状才能生效
- 2.贝塞尔曲线可以创建基于矢量的路径，而UIBezierPath类是对CGPathRef的封装
- 3.贝塞尔曲线给CAShapeLayer提供路径，CAShapeLayer在提供的路径中进行渲染。路径会闭环，所以绘制出了Shape
- 4.用于CAShapeLayer的贝塞尔曲线作为path，其path是一个首尾相接的闭环的曲线，即使该贝塞尔曲线不是一个闭环的曲线

* 结合UIBezierPath与CAShapeLayer画图
- 1 将UIBezierPath对象转化为CGPathRef对象 赋值给CAShapeLayer的path属性即可,即能画出各种线条和图形
* layer.path = bezierPath.CGPath; 
* [self.view.layer addSublayer:layer]; 把layer层添加到视图上
# CAShapeLayer 属性
- 重要 position 设置layer的中心点
- layer.strokeColor 边框颜色
- layer.fillColor   填充颜色
- layer.lineCap     线条拐角
- layer.lineJoin    终点处理
# 画折线
*画折线的UIBezierPath相关方法
- +(instancetype)bezierPath; 生成一个UIBezierPath对象,多用于画不规则曲线或多边形
- -(void)moveToPoint:(CGPoint)point; 添加路劲起点
- -(void)addLineToPoint:(CGPoint)point; 添加路劲起点外的其他点
# 画圆
- UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 250, 200, 200)];
# 矩形 四周切圆角
- UIBezierPath *pathOne = [UIBezierPath bezierPathWithRoundedRect:<#(CGRect)#> cornerRadius:<#(CGFloat)#>];
- cornerRadius 切角角度
# 画单角的圆角矩形
- UIBezierPath *pathOne = [UIBezierPath bezierPathWithRoundedRect:<#(CGRect)#> byRoundingCorners:<#(UIRectCorner)#> cornerRadii:<#(CGSize)#>];
- byRoundingCorners 选择哪个切角
- cornerRadii       设置角度

===========================
# UIBezierPath和CABasicAnimation 动态弧线
===========================
# 画圆弧
+ (instancetype)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
- (CGPoint)center 中心点
- (CGFloat)radiu  半径
- (CGFloat)startAngle 开始角度 正三点方向为0 2M_PI 顺时针方向
- (CGFloat)endAngle  结束角度
- (BOOL)clockwise   是否顺时针方向旋转
# CABasicAnimation 
- CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
- duration 持续时间
- timingFunction 动画进行速度
- fromValue  开始值
- toValue    结束值
- pathAnima.fillMode = kCAFillModeForwards;
  pathAnima.removedOnCompletion = NO; 动画完成保持完成状态
- [shapeLayer addAnimation:pathAnima forKey:@"strokeEnd"]; 开始动画
