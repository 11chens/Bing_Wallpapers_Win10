## 使用

### 注册：

1. 以管理员身份打开*PowerShell*
2. 在当前目录下，运行`Get-ExecutionPolicy`   , 查看当前的执行策略； 若输出为不是 `RemoteSigned` 或 `Unrestricted`，则可以尝试使用以下命令设置为 `RemoteSigned`（建议选择此选项，它允许执行本地脚本，但要求远程脚本必须经过数字签名）：`Set-ExecutionPolicy RemoteSigned`
3. 运行`.\register.ps1` ， 完成Windows下注册计划任务，然后查看*Myscript.log*是否显示注册成功，也可以直接查看是否生成了Pictures文件夹及Bing每日壁纸的jpg文件。该计划任务在每天9:00自动执行脚本*BiW.ps1*，完成背景更换。
4. 任务完成，当然也可以手动运行`.\BIW.ps1`，立即更换壁纸。![image-20230405003926275](C:\Users\86155\AppData\Roaming\Typora\typora-user-images\image-20230405003926275.png)

![image-20230405004013212](C:\Users\86155\AppData\Roaming\Typora\typora-user-images\image-20230405004013212.png)

### 取消注册：

1. 运行：`.\Unregister.ps1` 

2. 输入：`.Y` 

   ![image-20230405003711278](C:\Users\86155\AppData\Roaming\Typora\typora-user-images\image-20230405003711278.png)

