#!/bin/bash

# 设置终端字体颜色为黄色
echo -e "\e[6;1;33m"

# 清屏
clear

# 主循环
while true; do
  # 标题栏
  echo -e "\e[6;1;33m==================================="
  echo -e "=== Timeshift 功能菜单 ==="
  echo -e "===================================\e[0m"
  # 主菜单
  echo "1. 安装 Timeshift"
  echo "2. 创建镜像 (请输入 comments):"
  echo "3. 查看所有镜像"
  echo "4. 还原镜像 (请输入要还原的镜像编号):"
  echo "5. 删除镜像 (请输入要删除的镜像编号):"
  echo "0. 退出"

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
      # 恢复终端设置
      tput sgr0  # 恢复默认颜色和字体大小
      clear
      echo "谢谢使用 Timeshift 脚本，再见！"
      exit 0
      ;;
    *)
      echo "无效的选项"
      ;;
  esac
done
