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
