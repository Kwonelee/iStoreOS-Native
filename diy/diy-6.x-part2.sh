#!/bin/bash -e
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================

# 集成设备无线
mkdir -p package/base-files/files/lib/firmware/brcm
cp -a $GITHUB_WORKSPACE/configfiles/firmware/brcm/* package/base-files/files/lib/firmware/brcm/

# ================================================================
# 移植RK3399示例，其他RK3399可模仿
# ================================================================
# 增加设备
echo -e "\\ndefine Device/tvi_tvi3315a
  DEVICE_VENDOR := Tvi
  DEVICE_MODEL := TVI3315A
  SOC := rk3399
  UBOOT_DEVICE_NAME := tvi3315a-rk3399
endef
TARGET_DEVICES += tvi_tvi3315a" >> target/linux/rockchip/image/armv8.mk

# 替换package/boot/uboot-rockchip/Makefile
cp -f $GITHUB_WORKSPACE/configfiles/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制dts与配置文件到package/boot/uboot-rockchip
cp -f $GITHUB_WORKSPACE/configfiles/dts/rk3399/{rk3399.dtsi,rk3399-opp.dtsi,rk3399-tvi3315a.dts} package/boot/uboot-rockchip/src/arch/arm/dts/
cp -f $GITHUB_WORKSPACE/configfiles/uboot-rockchip/rk3399-tvi3315a-u-boot.dtsi package/boot/uboot-rockchip/src/arch/arm/dts/
cp -f $GITHUB_WORKSPACE/configfiles/uboot-rockchip/tvi3315a-rk3399_defconfig package/boot/uboot-rockchip/src/configs/

# 复制dts到files/arch/arm64/boot/dts/rockchip
cp -f $GITHUB_WORKSPACE/configfiles/dts/rk3399/{rk3399.dtsi,rk3399-opp.dtsi,rk3399-tvi3315a.dts} target/linux/rockchip/files/arch/arm64/boot/dts/rockchip/

# 添加dtb补丁到target/linux/rockchip/patches-6.6
cp -f $GITHUB_WORKSPACE/configfiles/patch/800-add-rk3399-tvi3315a-dtb-to-makefile.patch target/linux/rockchip/patches-6.6/
# ================================================================
# RK3399示例结束
# ================================================================

# ================================================================
# 移植RK3566示例，其他RK35xx可模仿
# ================================================================
# 增加设备
cp -f $GITHUB_WORKSPACE/configfiles/uboot-rockchip/legacy.mk target/linux/rockchip/image/legacy.mk

# 复制dts与配置文件到package/boot/uboot-rockchip
cp -f $GITHUB_WORKSPACE/configfiles/dts/rk3568/rk3566-roc-pc.dts package/boot/uboot-rockchip/src/dts/upstream/src/arm64/rockchip/
cp -f $GITHUB_WORKSPACE/configfiles/uboot-rockchip/rk3566-station-m2-u-boot.dtsi package/boot/uboot-rockchip/src/arch/arm/dts/
cp -f $GITHUB_WORKSPACE/configfiles/uboot-rockchip/station-m2-rk3566_defconfig package/boot/uboot-rockchip/src/configs/

# 复制dts到target/linux/rockchip/dts/rk3568
cp -f $GITHUB_WORKSPACE/configfiles/dts/rk3568/rk3566-jp-tvbox.dts target/linux/rockchip/dts/rk3568/
# ================================================================
# RK35xx示例结束
# ================================================================

# ================================================================
# DIY部分
# ================================================================
# 移除要替换的包
rm -rf feeds/packages/net/adguardhome
rm -rf feeds/third_party/luci-app-LingTiGameAcc
rm -rf feeds/luci/applications/luci-app-filebrowser

# clash_meta
mkdir -p files/etc/openclash/core
CLASH_META_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz"
wget -qO- $CLASH_META_URL | tar xOvz > files/etc/openclash/core/clash_meta
chmod +x files/etc/openclash/core/clash*

# clash_config
mkdir -p files/etc/config
wget -qO- https://raw.githubusercontent.com/Kwonelee/Kwonelee/refs/heads/main/rule/openclash > files/etc/config/openclash

# 处理Rust报错
sed -i 's/ci-llvm=true/ci-llvm=false/g' feeds/packages/lang/rust/Makefile

# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package/new
  cd .. && rm -rf $repodir
}

# 常见插件
git_sparse_clone master https://github.com/vernesong/OpenClash luci-app-openclash
git_sparse_clone main https://github.com/gdy666/luci-app-lucky luci-app-lucky lucky
git clone -b master https://github.com/w9315273/luci-app-adguardhome package/new/luci-app-adguardhome
git_sparse_clone main https://github.com/sbwml/openwrt_pkgs filebrowser luci-app-filebrowser-go luci-app-ramfree
sed -i 's/2.31.2/2.52.0/g' package/new/filebrowser/Makefile
