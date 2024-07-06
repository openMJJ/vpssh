# OpEnS 脚本集合

```plaintext
  .oooooo.              oooooooooooo              .oooooo..o oooo        ooo   
 d8P'  `Y8b             `888'     `8             d8P'    `Y8 `888        888  
888      888 oo.ooooo.   888         ooo. .oo.   Y88bo.       888 .oo.   888 .oo.
888      888  888' `88b  888oooo8    `888P"Y88b   `"Y8888o.   888P"Y88b  888P"Y88b
888      888  888   888  888    "     888   888       `"Y88b  888   888  888   888
`88b    d88'  888   888  888       o  888   888  oo     .d8P  888   888  888   888 
 `Y8bood8P'   888bod8P' o888ooooood8 o888o o888o 8""88888P'  o888o o888o o888o o888o
              888                                                        
             o888o                                                       
版本 V1.0-20230930

bash
复制代码
curl -sS -O https://raw.githubusercontent.com/openMJJ/vpssh/main/opensh.sh && chmod +x opensh.sh && ./opensh.sh
菜单功能
Timeshift - 系统镜像

安装 Timeshift
创建镜像
查看所有镜像
还原镜像
删除镜像
科技lion

安装和运行科技lion脚本
x-ui - 富强面板

检查并安装 x-ui
八合一 - 富强脚本

安装八合一富强脚本
4.1 Misaka-HY2

安装 Misaka-HY2 脚本
Sing-box 全家桶

安装 Sing-box 全家桶脚本
iptables 端口转发

配置 iptables 端口转发
TGPROTO

安装 TGPROTO 脚本
LxdPro 开小鸡 (不支持 ARM)

安装 LxdPro 脚本
萌咖DD

重装系统脚本 (Debian12/Ubuntu20.04)
traffmonetizer

安装 traffmonetizer 脚本
四网回程

测试四网回程脚本
BlueSkyBox

安装 BlueSkyBox 脚本
VPSToolBox

安装 VPSToolBox 脚本
EdNovasBox

安装 EdNovasBox 脚本
Linux 网络优化脚本

安装 Linux 网络优化脚本
serv00 相关脚本

PM2 安装命令

bash
复制代码
bash <(curl -s https://raw.githubusercontent.com/k0baya/alist_repl/main/serv00/install-pm2.sh)
Go1.22 安装命令

bash
复制代码
mkdir -p ~/local/soft && cd ~/local/soft
wget https://dl.google.com/go/go1.22.0.freebsd-amd64.tar.gz
tar -xzvf go1.22.0.freebsd-amd64.tar.gz
rm go1.22.0.freebsd-amd64.tar.gz
echo 'export PATH=~/local/soft/go/bin:$PATH' >> ~/.profile
source ~/.profile
go version
Reality 和 Hysteria2 脚本安装

bash
复制代码
bash <(curl -fsSL https://github.com/openMJJ/serv00-hysteria2/raw/main/serv00_singbox.sh)
贡献
欢迎贡献脚本和改进建议，请提交 Pull Request 或 Issue。

许可证
本项目采用 MIT 许可证，详细信息请参阅 LICENSE 文件。
