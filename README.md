# go-cqhttp
使用 [mirai](https://github.com/mamoe/mirai) 以及 [MiraiGo](https://github.com/Mrs4s/MiraiGo) 开发的cqhttp golang原生实现, 并在[cqhttp原版](https://github.com/richardchien/coolq-http-api)的基础上做了部分修改和拓展.
文档暂时可查看 `docs` 目录， 目前还在撰写中.

测试版可前往 Release 下载

## 兼容性

#### 接口
- [x] HTTP API
- [x] 反向HTTP POST
- [x] 正向Websocket
- [x] 反向Websocket

#### 拓展支持
> 拓展API可前往 [文档](docs/cqhttp.md) 查看
- [x] HTTP POST多点上报
- [x] 反向WS多点连接 
- [x] 修改群名
- [x] 消息撤回事件
- [x] 解析/发送 回复消息
- [x] 解析/发送 合并转发
- [ ] 使用代理请求网络图片

#### 实现
<details>
<summary>已实现CQ码</summary>

- [CQ:image]
- [CQ:face]
- [CQ:at]
- [CQ:share]
- [CQ:reply]
- [CQ:forward]
- [CQ:node]

</details>

<details>
<summary>已实现API</summary>

##### 注意: 部分API实现与CQHTTP原版略有差异，请参考文档
| API                      | 功能                                                         |
| ------------------------ | ------------------------------------------------------------ |
| /get_login_info          | [获取登录号信息](https://cqhttp.cc/docs/4.15/#/API?id=get_login_info-获取登录号信息) |
| /get_friend_list         | [获取好友列表](https://cqhttp.cc/docs/4.15/#/API?id=get_friend_list-获取好友列表) |
| /get_group_list          | [获取群列表](https://cqhttp.cc/docs/4.15/#/API?id=get_group_list-获取群列表) |
| /get_group_info          | [获取群信息](https://cqhttp.cc/docs/4.15/#/API?id=get_group_info-获取群信息) |
| /get_group_member_list   | [获取群成员列表](https://cqhttp.cc/docs/4.15/#/API?id=get_group_member_list-获取群成员列表) |
| /get_group_member_info   | [获取群成员信息](https://cqhttp.cc/docs/4.15/#/API?id=get_group_member_info-获取群成员信息) |
| /send_msg                | [发送消息](https://cqhttp.cc/docs/4.15/#/API?id=send_msg-发送消息) |
| /send_group_msg          | [发送群消息](https://cqhttp.cc/docs/4.15/#/API?id=send_group_msg-发送群消息) |
| /send_private_msg        | [发送私聊消息](https://cqhttp.cc/docs/4.15/#/API?id=send_private_msg-发送私聊消息) |
| /delete_msg              | [撤回信息](https://cqhttp.cc/docs/4.15/#/API?id=delete_msg-撤回消息) |
| /set_friend_add_request  | [处理加好友请求](https://cqhttp.cc/docs/4.15/#/API?id=set_friend_add_request-处理加好友请求) |
| /set_group_add_request   | [处理加群请求/邀请](https://cqhttp.cc/docs/4.15/#/API?id=set_group_add_request-处理加群请求／邀请) |
| /set_group_card          | [设置群名片(群备注)](https://cqhttp.cc/docs/4.15/#/API?id=set_group_card-设置群名片（群备注）) |
| /set_group_special_title | [设置群组专属头衔](https://cqhttp.cc/docs/4.15/#/API?id=set_group_special_title-设置群组专属头衔) |
| /set_group_kick          | [群组T人](https://cqhttp.cc/docs/4.15/#/API?id=set_group_kick-群组踢人) |
| /set_group_ban           | [群组单人禁言](https://cqhttp.cc/docs/4.15/#/API?id=set_group_ban-群组单人禁言) |
| /set_group_whole_ban     | [群组全员禁言](https://cqhttp.cc/docs/4.15/#/API?id=set_group_whole_ban-群组全员禁言) |
| /set_group_leave         | [退出群组](https://cqhttp.cc/docs/4.15/#/API?id=set_group_leave-退出群组) |
| /set_group_name          | 设置群组名(拓展API)                                         |
| /get_image               | 获取图片信息(拓展API)                                        |
| /get_group_msg           | 获取群组消息(拓展API)                                        |
| /can_send_image          | [检查是否可以发送图片](https://cqhttp.cc/docs/4.15/#/API?id=can_send_image-检查是否可以发送图片) |
| /can_send_record         | [检查是否可以发送语音](https://cqhttp.cc/docs/4.15/#/API?id=can_send_record-检查是否可以发送语音) |
| /get_status              | [获取插件运行状态](https://cqhttp.cc/docs/4.15/#/API?id=get_status-获取插件运行状态) |
| /get_version_info        | [获取 酷Q 及 CQHTTP插件的版本信息](https://cqhttp.cc/docs/4.15/#/API?id=get_version_info-获取-酷q-及-cqhttp-插件的版本信息) |

</details>

<details>
<summary>已实现Event</summary>

##### 注意: 部分Event数据与CQHTTP原版略有差异，请参考文档
| Event                                                        |
| ------------------------------------------------------------ |
| [私聊信息](https://cqhttp.cc/docs/4.15/#/Post?id=私聊消息)   |
| [群消息](https://cqhttp.cc/docs/4.15/#/Post?id=群消息)       |
| [群消息撤回(拓展Event)](docs/cqhttp.md#群消息撤回)             |
| [好友消息撤回(拓展Event)](docs/cqhttp.md#好友消息撤回)             |
| [群管理员变动](https://cqhttp.cc/docs/4.15/#/Post?id=群管理员变动) |
| [群成员减少](https://cqhttp.cc/docs/4.15/#/Post?id=群成员减少) |
| [群成员增加](https://cqhttp.cc/docs/4.15/#/Post?id=群成员增加) |
| [群禁言](https://cqhttp.cc/docs/4.15/#/Post?id=群禁言)       |
| [群文件上传](https://cqhttp.cc/docs/4.15/#/Post?id=群文件上传)|
| [加好友请求](https://cqhttp.cc/docs/4.15/#/Post?id=加好友请求) |
| [加群请求/邀请](https://cqhttp.cc/docs/4.15/#/Post?id=加群请求／邀请) |

</details>

## 性能

在关闭数据库的情况下, 加载25个好友128个群运行24小时后内存使用为10MB左右. 开启数据库后内存使用将根据消息量增加10-20MB, 如果系统内存小于128M建议关闭数据库使用. 

## Docker 镜像

本项目的 Docker 镜像位于 `nanahira/go-cqhttp` 。可以直接 pull 之后使用。

## 端口

以下端口使用1个即可，更建议将业务容器和本项目容器放置于同一 `docker-compose.yml` 文件下，直接互通使用。

* `5700` HTTP 端口
* `6700` websocket 端口

## 数据卷目录

* `/data` 本项目相关数据，也可以直接把 `config.json` 放入该目录进行配置。

## 环境变量

配置方法使用下列环境变量**或** `config.json` 文件均可。

* `UIN` QQ 号。
* `PASS` QQ 密码。
* `HTTP_POST` 后端路径。
* `HTTP_SECRET` 后端密钥。这两个环境变量若使用 websocket 则不必需。
* `ACCESS_TOKEN` 访问令牌，需要和业务后端保持一致。
* `ENABLE_DB` 默认为 `true`，若为 `false` 则不使用数据库，功能会受到限制。
* `DEBUG` 若为 `true` 则输出更多的调试信息。
