## QYRippleAnimation
* A radar of Animation use to show the upload reminder.
* 防雷达加载动画 

 
![image](https://github.com/peanutNote/QYRippleAnimation/blob/master/QYRippleAnimation/demo1.gif)

## 问题产生原因
*  在做蓝犀牛客户端的时候在分车页面，要求增加一个分车等待动画。主要参照的是主流应用Uber的的启动页面中的一个动画效果

## 遇到的问题
* 由于刚开始需求要求在线圈往外扩散的时候背景色也要跟随线圈往外扩散渐变，首先我想到的是利用Quartz2D画一个径向渐变，有了想法马上就动手写一个圆形渐变视图，接着考虑动画该怎么做。
* 我先想到的是通过画圆弧盖在渐变的线圈的上面然后用计时器改变圆弧的大小实现这种动画，尝试以后发现问题：`CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y,
  CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)`，该方法当前其半径过小的时候，圆弧的宽度无法通过：`CGContextSetLineWidth(CGContextRef c, CGFloat width)`无法准确设置线圈的大小（尝试了N次始终没找到什么规律😂）
* 接着我想到了是否可以将画上渐变的视图通过改变其fram的方法增加动画，尝试以后发现将视图设置圆角添加动画并不是线圈往外扩大，增加放大动画会将线框也放大，又失败。

## 问题解决
* 最后在寻找画图方法的时候发现了一个截取当前视图部分的方法`CGContextClip(CGContextRef c)`,用法就是先定义好路径然后调用改方法截去路劲内部分（当然该方法还有很多带不同参数的,这个可自行研究），之后我就利用改变截取区域的大小来实现改动画同时还增加了渐变的效果~

