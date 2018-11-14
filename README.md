# LayerExplore



## CALayer简介

1. CALayer包含在QuartzCore框架中，这是一个跨平台的框架，既可以用在iOS中又可以用在Mac OS X中。而他的近亲UIView是在UIKit框架中，只能用在iOS中。
2. UIView中有一个layer属性作为根图层，CALayer通过delegate持有UIView。
3. 在UIView中所有能够看到的内容都包含在layer中。





## CALayer常用属性

1. 隐式属性动画的本质是这些属性的变动默认隐含了CABasicAnimation动画实现，详情大家可以参照Xcode帮助文档中“Animatable Properties”一节。

2. 在CALayer中很少使用frame属性，因为frame本身不支持动画效果，通常使用bounds和position代替。

3. CALayer中透明度使用opacity表示而不是alpha；中心点使用position表示而不是center。

4. anchorPoint属性是图层的锚点，范围在（0~1,0~1）表示在x、y轴的比例，这个点永远可以同position（中心点）重合，当图层中心点固定后，调整anchorPoint即可达到调整图层显示位置的作用（因为它永远和position重合





## CALayer绘图



代理方式

[关于CALayer导致的crash问题](https://www.cnblogs.com/fengmin/p/8480014.html)

[设置CALayer的delegate时需要注意的问题](https://blog.csdn.net/qinqi376990311/article/details/81975444)

自定义方式









## 参考文档

[iOS开发之让你的应用“动”起来](http://www.cocoachina.com/ios/20141022/10005.html)





