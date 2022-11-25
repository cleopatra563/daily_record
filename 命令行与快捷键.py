如何创建 Anaconda 虚拟环境

#环境目录 conda env list

# 版本切换
打开Anaconda Prompt，比如创建一个名为Glenn 的python版本为3.7.3的环境
# 创建虚拟环境 conda create -n pyhton3.7 python=3.7.3
# 激活虚拟环境 conda activate python3.7
# 退出虚拟环境 deactivate

# 安装第三方库和版本号
切换到python环境
# 库与版本 pip list

Pycharm快捷键设置
# 自动调整代码格式 Alt+Ctrl+L
# 更换编码方式
1、在setting中的Editor中找到File and Code Templates，在Python Script中添加代码
# !/user/bin/evn python2
# -*-coding : utf-8 -*-

2、接着，在File Encoding中修改下编码

# 自动复制上一行代码 Ctrl+D
# Debug功能使用
1、设置好断点，debug运行
2、F8 单步调试
3、遇到想进入的函数 F7 进去
4、想出来在 shift + F8，跳过不想看的地方
5、直接设置下一个断点，然后 F9 过去
