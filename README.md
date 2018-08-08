# MVP

### iOS中cocoa MVC模式：

![image](/mvc.png)

### 实际上cocoa的MVC模式：
![image](/M_vc.png)

如此看来，Cocoa MVC 模式 似乎是一个很糟糕的选择。但是让我们根据文章开头定义的特性来评估它：

* 职责拆分 — View和Model实现了分离，但是View与Controller仍是紧耦合。
* 可测性 — 由于模式的原因，你只能测试你的Model。
* 易用性 — 相比于其他模式代码量最少。此外，每个人都熟悉它，即使经验不太丰富的开发人员也能够维护它。

如果你不愿意在项目的架构上投入太多的时间，那么Cocoa MVC 就是你应该选择的模式。而且你会发现用其他维护成本较高的模式开发小的应用是一个致命的错误。

> Cocoa MVC是开发速度最快的架构模式。

### MVP 实现了Cocoa的MVC的愿景
![image](/mvp.png)
### MVP
这看起来不正是苹果的MVC吗？是的，它的名字是MVP（Passive View variant，被动视图变体）。

等等...这是不是意味着苹果的MVC实际上是MVP？不，不是这样。

如果你仔细回忆一下，View是和Controller紧密耦合的，但是MVP的中介Presenter并没有对ViewController的生命周期做任何改变，因此View可以很容易的被模拟出来。

在Presenter中根本没有和布局有关的代码，但是它却负责更新View的数据和状态。

> 假如告诉你,UIViewController就是View呢？

在MVP中，UIViewController的子类实际上是Views而不是Presenters。

这种模式的可测试性得到了极大的提高，付出的代价是开发速度的一些降低，因为必须要做一些手动的数据和事件绑定
