# slimTableView
tableView 瘦身

tableView瘦身方式：

  将tableView的delegate和dataSource方法抽离成一个类，然后初始化该类，并通过相关回调进行tableView的配置，
  目前该类只支持tableView列表数据使用同一种cell的情况，暂不支持多种cell样式的排版，具体请下载demo进行查看
