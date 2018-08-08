# MVP
iOS中MVP的示例Demo

MVP 实现了Cocoa的MVC的愿景
(mvc.png)
这看起来不正是苹果的MVC吗？是的，它的名字是MVP（Passive View variant，被动视图变体）。
等等...这是不是意味着苹果的MVC实际上是MVP？不，不是这样。
如果你仔细回忆一下，View是和Controller紧密耦合的，但是MVP的中介Presenter并没有对ViewController的生命周期做任何改变，因此View可以很容易的被模拟出来。
在Presenter中根本没有和布局有关的代码，但是它却负责更新View的数据和状态。
