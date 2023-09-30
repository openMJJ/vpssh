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
  .oooooo.              oooooooooooo              .oooooo..o oooo        
 d8P'  `Y8b             `888'     `8             d8P'    `Y8 `888        
888      888 oo.ooooo.   888         ooo. .oo.   Y88bo.       888 .oo.   
888      888  888' `88b  888oooo8    `888P"Y88b   `"Y8888o.   888P"Y88b  
888      888  888   888  888    "     888   888       `"Y88b  888   888  
`88b    d88'  888   888  888       o  888   888  oo     .d8P  888   888  
 `Y8bood8P'   888bod8P' o888ooooood8 o888o o888o 8""88888P'  o888o o888o 
              888                                                        
             o888o                                                       
                                                                         

版本V1.0-20230930 
curl -sS -O https://raw.githubusercontent.com/openshsh/vpssh/main/opensh.sh && chmod +x opensh.sh && ./opensh.sh
===============================================================================================
EOF
  echo -e "\e[0m"
  
  # Main menu
  echo -e "\e[1;36m1. Timeshift-系统镜像"
  echo -e "\e[1;31m2. 科技lion-"
  echo -e "\e[1;34m3. x-ui-富强面板"
  echo -e "\e[1;33m4. 八合一-富强脚本"
  echo -e "\e[1;37m5. Sing-box 全家桶"
  echo -e "\e[1;31m0. 退出\e[0m"

  read -p "请选择一级菜单选项 (0-4): " main_choice

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
        echo -e "\e[1;36m1. 安装 Timeshift"
        echo -e "\e[1;31m2. 创建镜像 (请输入 comments):"
        echo -e "\e[1;34m3. 查看所有镜像"
        echo -e "\e[1;33m4. 还原镜像 (请输入要还原的镜像编号):"
        echo -e "\e[1;31m5. 删除镜像 (请输入要删除的镜像编号):"
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
      curl -sS -O https://kejilion.pro/kejilion.sh && chmod +x kejilion.sh && ./kejilion.sh
      ;;
    3)
      # x-ui
      clear_screen=1 # Define clear_screen here
      read -p "确认要继续吗？(Y/N): " confirm
      if [ "$confirm" == "Y" ] || [ "$confirm" == "y" ]; then
        bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh)
        # Don't clear the screen
        clear_screen=0
      else
        echo "取消操作"
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
    5)
      # 【Sing-box 全家桶】
      clear_screen=1 # Define clear_screen here
      read -p "确认要继续吗？(Y/N): " confirm
      if [ "$confirm" == "Y" ] || [ "$confirm" == "y" ]; then
        bash <(wget -qO- https://raw.githubusercontent.com/fscarmen/sing-box/main/sing-box.sh)
        # Don't clear the screen
        clear_screen=0
      else
        echo "取消操作"
      fi
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
