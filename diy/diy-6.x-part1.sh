#!/bin/bash -e
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================

# 修复系统kernel内核md5校验码不正确的问题
# https://mirrors.ustc.edu.cn/openwrt/releases/24.10.2/targets/rockchip/armv8/kmods/
# https://downloads.openwrt.org/releases/24.10.2/targets/rockchip/armv8/kmods/
# https://archive.openwrt.org/releases/24.10.2/targets/rockchip/armv8/kmods/
# https://mirrors.cqupt.edu.cn/openwrt/releases/24.10.2/targets/rockchip/armv8/kmods/
# https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/24.10.2/targets/rockchip/armv8/kmods/
Releases_version=$(cat include/version.mk | sed -n 's|.*releases/\([0-9]\+\.[0-9]\+\.[0-9]\+\).*|\1|p')
http_value=$(wget -qO- "https://mirrors.ustc.edu.cn/openwrt/releases/${Releases_version}/targets/rockchip/armv8/kmods/")
hash_value=$(echo "$http_value" | sed -n 's/^.*-\([0-9a-f]\{32\}\)\/.*/\1/p' | head -1)
hash_value=${hash_value:-$(echo "$http_value" | sed -n 's/.*\([0-9a-f]\{32\}\)\/.*/\1/p' | head -1)}
if [ -n "$hash_value" ] && [[ "$hash_value" =~ ^[0-9a-f]{32}$ ]]; then
    echo "$hash_value" > .vermagic
    echo "kernel内核md5校验码：$hash_value"
fi

# 修改版本为编译日期，数字类型
date_version=$(date +"%Y%m%d%H")
echo $date_version > version

# 为iStoreOS固件版本加上编译作者
#author="kwonelee"
#sed -i "s/DISTRIB_DESCRIPTION.*/DISTRIB_DESCRIPTION='%D %V ${date_version} by ${author}'/g" package/base-files/files/etc/openwrt_release
#sed -i "s/OPENWRT_RELEASE.*/OPENWRT_RELEASE=\"%D %V ${date_version} by ${author}\"/g" package/base-files/files/usr/lib/os-release

# 拉取软件包仓库
#echo 'src-git kwpackages https://github.com/Jaykwok2999/istoreos-ipk.git;main' >> feeds.conf.default
