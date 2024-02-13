#!/bin/bash

# Set terminal font color to yellow
echo -e "\e[1;33m"

# Clear screen flag
clear_screen=1

while true; do
  # Clear the screen if necessary
  if [ $clear_screen -eq 1 ]; then
    clear
  fi

  # OpEnS ASCII art (Preserved as requested)
  echo -e "\e[1;32m"
  cat << "EOF"
  .oooooo.              oooooooooooo              .oooooo..o oooo        ooo   
 d8P'  `Y8b             `888'     `8             d8P'    `Y8 `888        888  
888      888 oo.ooooo.   888         ooo. .oo.   Y88bo.       888 .oo.   888 .oo.
888      888  888' `88b  888oooo8    `888P"Y88b   `"Y8888o.   888P"Y88b  888P"Y88b
888      888  888   888  888    "     888   888       `"Y88b  888   888  888   888
`88b    d88'  888   888  888       o  888   888  oo     .d8P  888   888  888   888 
 `Y8bood8P'   888bod8P' o888ooooood8 o888o o888o 8""88888P'  o888o o888o o888o o888o
              888                                                        
             o888o                                                       
                                                                         

版本V1.0-20230930 
curl -sS -O https://raw.githubusercontent.com/openMJJ/vpssh/main/opensh.sh && chmod +x opensh.sh && ./opensh.sh
====================================================================================================
EOF
  echo -e "\e[0m"
  
  # Main menu
echo -e "\e[1;96m1& \e[38;5;226mTimeshift-系统镜像"
echo -e "\e[1;91m2& \e[38;5;208m科技lion"
echo -e "\e[1;94m3& \e[38;5;75mx-ui-富强面板"
echo -e "\e[1;93m4& \e[38;5;208m八合一-富强脚本"
echo -e "\e[1;93m4.1& \e[38;5;208misaka-HY2"
echo -e "\e[1;97m5& \e[38;5;33mSing-box 全家桶"
echo -e "\e[1;98m6& \e[38;5;45miptables端口转发"
echo -e "\e[1;98m7& \e[38;5;45mTGPROTO"
echo -e "\e[1;99m8& \e[38;5;197mLxdPro开小鸡 (不支持ARM)"
echo -e "\e[1;33m9& \e[38;5;226m萌咖DD"
echo -e "\e[1;33m10& \e[38;5;226mtraffmonetizer"
echo -e "\e[1;34m11& \e[38;5;226四网回程-221.200.110.212"
echo -e "\e[1;91m12& \e[38;5;208mBlueSkyBox"
echo -e "\e[1;91m13& \e[38;5;208mVPSToolBox"
echo -e "\e[1;91m14& \e[38;5;208mEdNovasBox"
echo -e "\e[1;33m15& \e[38;5;226mLinux网络优化脚本"
echo -e "\e[1;31m0& \e[38;5;196m退出\e[0m" # 添加 \e[0m 来重置文本颜色和背景颜色

  read -p "请选择一级菜单选项 (0-9): " main_choice

  case $main_choice in
    1)
      # Timeshift sub-menu
      clear_screen=1 # Define clear_screen here
      while true; do
        # Timeshift sub-menu
        echo -e "\e[1;33m==================================="
        echo -e "=== Timeshift 功能菜单 ==="
        echo -e "===================================\e[0m"
        # Main menu
        echo -e "\e[1;31m1. Timeshift - 安装 Timeshift\e[0m"
        echo -e "\e[1;32m2. 创建镜像 (请输入 comments)\e[0m"
        echo -e "\e[1;33m3. 查看所有镜像\e[0m"
        echo -e "\e[1;34m4. 还原镜像 (请输入要还原的镜像编号)\e[0m"
        echo -e "\e[1;35m5. 删除镜像 (请输入要删除的镜像编号)\e[0m"
        echo -e "\e[1;31m0. 返回上级菜单\e[0m"

        read -p "请选择选项 (0-5): " choice

        case $choice in
          1)
            # Install Timeshift
            sudo apt install timeshift
            ;;
          2)
            # Create an image
            read -p "请输入 comments: " comments
            timeshift --create --comments "after update: $comments"
            ;;
          3)
            # View all images
            timeshift --list
            ;;
          4)
            # Restore an image
            read -p "请输入要还原的镜像编号: " snapshot_number
            actual_snapshot_number=$((snapshot_number + 1))
            snapshot_name=$(timeshift --list | grep -Eo '[0-9]{4}-[0-9]{2}-[0-9]{2}_[0-9]{2}-[0-9]{2}-[0-9]{2}' | sed -n "${actual_snapshot_number}p")

            if [ -n "$snapshot_name" ]; then
              echo "正在还原快照: $snapshot_name"
              timeshift --restore --snapshot "$snapshot_name"
            else
              echo "无效的镜像编号"
            fi
            ;;
         
          5)
            # Delete an image
            read -p "请输入要删除的镜像编号: " snapshot_number
            actual_snapshot_number=$((snapshot_number + 1))
            snapshot_name=$(timeshift --list | grep -Eo '[0-9]{4}-[0-9]{2}-[0-9]{2}_[0-9]{2}-[0-9]{2}-[0-9]{2}' | sed -n "${actual_snapshot_number}p")

            if [ -n "$snapshot_name" ]; then
              echo "正在删除快照: $snapshot_name"
              timeshift --delete --snapshot "$snapshot_name"
              echo "已删除镜像: $snapshot_name"
            else
              echo "无效的镜像编号"
            fi
            ;;
          0)
            # Return to the previous menu
            clear_screen=1
            break
            ;;
          *)
            echo "无效的选项"
            ;;
        esac
      done
      ;;
    2)
      # 科技lion
      clear_screen=1 # Define clear_screen here
      curl -sS -O https://raw.githubusercontent.com/kejilion/sh/main/kejilion.sh && chmod +x kejilion.sh && ./kejilion.sh
      ;;
    3)
      # 检查是否已经安装了x-ui
      if which x-ui > /dev/null 2>&1; then
      # x-ui已经安装
      clear_screen=1 # Define clear_screen here
      echo "1) 执行 X-ui 命令"
      echo "2) 重新安装 X-ui"
      echo "3) 退出"
      read -p "请选择选项 (1/2/3): " option
      case "$option" in
        1)
          # 执行 X-ui 命令
          x-ui
          ;;
        2)
          # 重新安装 X-ui
          bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh)
          # 不清屏
          clear_screen=0
          ;;
        3)
          # 退出
          echo "取消操作"
          ;;
        *)
          echo "无效选项"
          ;;
      esac
    else
        # x-ui未安装，直接安装
        bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh)
        # 不清屏
        clear_screen=0
        read -n 1 -s -r -p "按任意键继续..."
      fi
      ;;
    4)
      # 八合一
      clear_screen=1 # Define clear_screen here
      read -p "确认要继续吗？(Y/N): " confirm
      if [ "$confirm" == "Y" ] || [ "$confirm" == "y" ]; then
        wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" && chmod 700 /root/install.sh && /root/install.sh
        # Don't clear the screen
        clear_screen=0
      else
        echo "取消操作"
      fi
      ;;
    4.1)
      # misaka-HY2
      clear_screen=1 # Define clear_screen here
      read -p "确认要继续吗？(Y/N): " confirm
      if [ "$confirm" == "Y" ] || [ "$confirm" == "y" ]; then
        bash <(curl -fsSL https://get.hy2.sh/) && bash hysteria.sh
        # Don't clear the screen
        clear_screen=0
      else
        echo "取消操作"
      fi
      ;;
     
    5)
      # 【Sing-box 全家桶】
      clear_screen=1 # Define clear_screen here
      read -p "确认要继续吗？(Y/N): " confirm
      if [ "$confirm" == "Y" ] || [ "$confirm" == "y" ]; then
        bash <(curl -fsSL https://raw.githubusercontent.com/fscarmen/sing-box/main/sing-box.sh)
        # Don't clear the screen
        clear_screen=0
      else
        echo "取消操作"
      fi
      ;;
    6)
      # iptables端口转发
      clear_screen=1 # Define clear_screen here
      bash <(curl -fsSL https://raw.githubusercontent.com/arloor/iptablesUtils/master/natcfg.sh)
      read -p "按任意键继续..."
      ;;    
    7)
      # TG-PROTO
      clear_screen=1 # Define clear_screen here
      curl -sS -O https://raw.githubusercontent.com/sunpma/mtp/master/mtproxy.sh && chmod +x mtproxy.sh && ./mtproxy.sh
      read -p "按任意键继续..."
      ;;
    8)
      # LxdPro开小鸡-不支持ARM"
      clear_screen=1 # Define clear_screen here
      read -p "确认要继续吗？(Y/N): " confirm
      if [ "$confirm" == "Y" ] || [ "$confirm" == "y" ]; then
        wget -N --no-check-certificate https://raw.githubusercontent.com/MXCCO/lxdpro/main/lxdpro.sh && bash lxdpro.sh
        # Don't clear the screen
        clear_screen=0
      else
        echo "取消操作"
      fi
      ;; 
    9)
      clear
      echo "请备份数据，将为你重装系统，预计花费15分钟,port:6022"
      read -p "确定继续吗？(Y/N): " choice
          case "$choice" in
            [Yy])
              while true; do
                read -p "请选择要重装的系统:  1. Debian12 | 2. Ubuntu20.04 : " sys_choice

                case "$sys_choice" in
                  1)
                    xitong="-d 12"
                    break  # 结束循环
                    ;;
                  2)
                    xitong="-u 20.04"
                    break  # 结束循环
                    ;;
                  *)
                    echo "无效的选择，请重新输入。"
                    ;;
                esac
              done

              read -p "请输入你重装后的密码: " vpspasswd
              read -p "请输入你的端口号: " vpsport
              if command -v apt &>/dev/null; then
                  apt update -y && apt install -y wget
              elif command -v yum &>/dev/null; then
                  yum -y update && yum -y install wget
              else
                  echo "未知的包管理器!"
              fi
             
              bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') $xitong -v 64 -p $vpspasswd -port  $vpsport
              ;;
            [Nn])
              echo "已取消"
              ;;
            *)
              echo "无效的选择，请输入 Y 或 N。"
              ;;
          esac
              ;;
    10)
      # traffmonetizer
      clear_screen=1 # Define clear_screen here
      read -p "确认要继续吗？(Y/N): " confirm
      if [ "$confirm" == "Y" ] || [ "$confirm" == "y" ]; then
        docker run -d --restart=always --name tm traffmonetizer/cli_v2 start accept --token +NOOC2/4k8kH3MzVpBuJ5aw5VjC/BHT1/Z0tVBlkGzM=
        # Don't clear the screen
        clear_screen=0
      else
        echo "取消操作"
      fi
      ;; 
      11)
      # 四网回程
      clear_screen=1 # Define clear_screen here
      read -p "确认要继续吗？(Y/N): " confirm
      if [ "$confirm" == "Y" ] || [ "$confirm" == "y" ]; then
        wget https://raw.githubusercontent.com/vpsxb/testrace/main/testrace.sh -O testrace.sh && bash testrace.sh
        # Don't clear the screen
        clear_screen=0
      else
        echo "取消操作"
      fi
      ;; 
      12)
      # BlueSkyBox
      clear_screen=0 # Define clear_screen here
      wget -O box.sh https://raw.githubusercontent.com/BlueSkyXN/SKY-BOX/main/box.sh && chmod +x box.sh && clear && ./box.sh
      ;;
      13)
      # VPSToolBox
      clear_screen=0 # Define clear_screen here
      bash <(curl -Lso- https://sh.vps.dance/toolbox.sh)
      ;;
      14)
      # EdNovasBox
      clear_screen=0 # Define clear_screen here
      wget -N https://cdn.jsdelivr.net/gh/ednovas/vpstoolbox@main/ednovastool.sh && chmod +x ednovastool.sh && ./ednovastool.sh
      ;;
      15)
      # Linux网络优化脚本
      clear_screen=0 # Define clear_screen here
      wget http://sh.nekoneko.cloud/tools.sh -O tools.sh && bash tools.sh
      ;;
      0)
      # Exit
      tput sgr0
      clear
      echo -e "\e[1;32m谢谢使用脚本，再见！\e[0m"
      exit 0
      ;;
    *)
      echo "无效的选项"
      ;;
      
  esac
done
