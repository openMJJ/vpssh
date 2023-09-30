#!/bin/bash

# 设置终端字体颜色为黄色
echo -e "\e[1;33m"

# 清屏标志
clear_screen=1

while true; do
  # 如果需要清屏，才清屏
  if [ $clear_screen -eq 1 ]; then
    clear
  fi

  # OpEnS ASCII艺术
  echo -e "\e[1;32m"
  cat << "EOF"
  ___            _____           ____    _     
  / _ \   _ __   | ____|  _ __   / ___|  | |__  
 | | | | | '_ \  |  _|   | '_ \  \___ \  | '_ \ 
 | |_| | | |_) | | |___  | | | |  ___) | | | | |
  \___/  | .__/  |_____| |_| |_| |____/  |_| |_|
         |_|          
=================================================
EOF
  echo -e "\e[0m"
  
  # 一级菜单
  echo -e "\e[1;36m1. Timeshift"
  echo "2. 科技lion"
  echo "3. x-ui"
  echo "4. 八合一"
  echo -e "0. 退出\e[0m"

  read -p "请选择一级菜单选项 (0-4): " main_choice

  case $main_choice in
    1)
      # Timeshift 二级菜单
      while true; do
        # Timeshift 二级菜单
        echo -e "\e[1;33m==================================="
        echo -e "=== Timeshift 功能菜单 ==="
        echo -e "===================================\e[0m"
        # 主菜单
        echo -e "\e[1;36m1. 安装 Timeshift"
        echo "2. 创建镜像 (请输入 comments):"
        echo "3. 查看所有镜像"
        echo "4. 还原镜像 (请输入要还原的镜像编号):"
        echo "5. 删除镜像 (请输入要删除的镜像编号):"
        echo -e "0. 返回上级菜单\e[0m"

        read -p "请选择选项 (0-5): " choice

        case $choice in
          1)
            # 安装 Timeshift
            sudo apt install timeshift
            ;;
          2)
            # 创建镜像
            read -p "请输入 comments: " comments
            timeshift --create --comments "after update: $comments"
            ;;
          3)
            # 查看所有镜像
            timeshift --list
            ;;
          4)
            # 还原镜像
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
            # 删除镜像
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
            # 返回上级菜单
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
      curl -sS -O https://kejilion.pro/kejilion.sh && chmod +x kejilion.sh && ./kejilion.sh
      ;;
    3)
      # x-ui
      read -p "确认要继续吗？(Y/N): " confirm
      if [ "$confirm" == "Y" ] || [ "$confirm" == "y" ]; then
        bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh)
        # 不清屏
        clear_screen=0
      else
        echo "取消操作"
      fi
      ;;
    4)
      # 八合一
      read -p "确认要继续吗？(Y/N): " confirm
      if [ "$confirm" == "Y" ] || [ "$confirm" == "y" ]; then
        wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" && chmod 700 /root/install.sh && /root/install.sh
        # 不清屏
        clear_screen=0
      else
        echo "取消操作"
      fi
      ;;
    0)
      # 退出
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
