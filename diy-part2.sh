#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.0.1/g' package/base-files/luci2/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/OpenWrt/LEDE-srfj/g' package/base-files/files/bin/config_generate

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

# 修复ramips mt7621 5.10内核补丁冲突
echo "===== Try to remove 802/803 gpio patches ====="
pwd
ls -la target/linux/ramips/patches-5.10/
rm -f target/linux/ramips/patches-5.10/802-GPIO-MIPS-ralink-add-gpio-driver-for-ralink-SoC.patch
rm -f target/linux/ramips/patches-5.10/803-gpio-ralink-Add-support-for-GPIO-as-interrupt-contro.patch
ls -la target/linux/ramips/patches-5.10/
echo "===== Remove done ====="

# make defconfig
sed -i 's/^[ \t]*//g' ./.config
make defconfig
