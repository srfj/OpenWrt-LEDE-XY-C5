#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# 删除源码中原有的argon主题
rm -rf package/luci-theme-argon

# 重新下载最新argon主题
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

# 添加软件包
git clone https://github.com/srfj/luci-app-mwan3helper-chinaroute package/luci-app-mwan3helper-chinaroute

# 添加插件 ddns-go（本体 + luci 界面，源码来自 sirpdboy 仓库的两个子目录）
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go.git /tmp/luci-app-ddns-go
cp -a /tmp/luci-app-ddns-go/ddns-go package/ddns-go
cp -a /tmp/luci-app-ddns-go/luci-app-ddns-go package/luci-app-ddns-go
rm -rf /tmp/luci-app-ddns-go

# 添加插件 rtp2httpd（本体 + luci 界面，采用官方 Makefile.versioned 固定版本）
git clone --depth 1 https://github.com/stackia/rtp2httpd.git /tmp/rtp2httpd
mkdir -p package/rtp2httpd
cp -a /tmp/rtp2httpd/openwrt-support/rtp2httpd/files package/rtp2httpd/files
cp /tmp/rtp2httpd/openwrt-support/rtp2httpd/Makefile.versioned package/rtp2httpd/Makefile
cp -a /tmp/rtp2httpd/openwrt-support/luci-app-rtp2httpd package/luci-app-rtp2httpd
mv package/luci-app-rtp2httpd/Makefile.versioned package/luci-app-rtp2httpd/Makefile
rm -rf /tmp/rtp2httpd
