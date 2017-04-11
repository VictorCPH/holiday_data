## Holiday
- 获得一段时间内某个地区的holiday信息，存入mysql数据库中
- mysql中 holiday_data 表结构如下：

| Field     | Type      | Describe                    |
| --------- | --------- | --------------------------- |
| year      | int       | 年份                        |
| month     | int       | 月份                        |
| day       | int       | 天数                        |
| holiday   | int       | 是否假期，是：1，否：0      |
| weekday   | int       | 星期，Mon=1,...,Sat=6,Sun=0 |

## Usage
1. 获取依赖
```sh
bundle install --path vendor
```

2. 添加配置
```sh
cp .env .env.example
```
 根据.env文件中的说明填写配置信息

3. 运行
```sh
bundle exec ruby get_holiday_data.rb
```
