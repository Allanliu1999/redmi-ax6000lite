这里是红米ax6000-128M-U-boot固件，基于immortalwrt-24.10，linux内核版本6.6,闭源无线驱动，自带passwall（已注释）、nikki、homeproxy，可修改代码增加自己需要的插件，直接fork即可云编译；

地址为192.168.99.1 需要修改的自行在diy-part2.sh文件第二十行里修改；

删除原版tmate导致以下需中途介入问题，现在一键启动编译到完成。
（action后，在SSH connection to Actions连接选项输入true, run workflow 等待出现SSH链接，并点击打开新页面 进入ssh连接页面后 ctrl+c 输入 cd openwrt && make menuconfig 进入图形选择界面，选择好所需插件后保存退出）
