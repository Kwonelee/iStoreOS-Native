<div align="center">
  <img width="768" src="https://cdn.jsdelivr.net/gh/haiibo/OpenWrt/images/openwrt.png"/>
  <h1>基于官方源码编译的iStoreOS固件</h1>

  <img src="https://img.shields.io/github/downloads/Kwonelee/iStoreOS-Native/total.svg?style=for-the-badge&color=32C955"/>
  <img src="https://img.shields.io/github/stars/Kwonelee/iStoreOS-Native.svg?style=for-the-badge&color=orange"/>
  <img src="https://img.shields.io/github/forks/Kwonelee/iStoreOS-Native.svg?style=for-the-badge&color=ff69b4"/>
  <img src="https://img.shields.io/github/license/Kwonelee/iStoreOS-Native.svg?style=for-the-badge&color=blueviolet"/>

  [![](https://img.shields.io/badge/-目录:-696969.svg)](#readme)
  [![](https://img.shields.io/badge/-项目介绍-FFFFFF.svg)](#-项目介绍-)
  [![](https://img.shields.io/badge/-第三方插件-FFFFFF.svg)](#-第三方插件-)
  [![](https://img.shields.io/badge/-支持设备-FFFFFF.svg)](#-支持设备-)
  [![](https://img.shields.io/badge/-项目截图-FFFFFF.svg)](#-项目截图-)
  [![](https://img.shields.io/badge/-Thanks-FFFFFF.svg)](#-Thanks-)
  [![](https://img.shields.io/badge/-免责声明-FFFFFF.svg)](#-免责声明-)
</div>

---

## 🤔 项目介绍 [![](https://img.shields.io/badge/-项目介绍-FFFFFF.svg)](#-项目介绍-)
**iStoreOS** 目标是提供一个人人会用的路由兼轻 **NAS 系统** ，不管是作为路由还是 NAS，你都有相似的操作体验。

> [!TIP]
> 🔈本项目提供了一个参考实现，用于将 RK 平台适配至 iStoreOS 官方源码，并能通过原生编译生成 sysupgrade 格式的固件；该格式固件支持手动在线刷写固件，无需重复刷机
> 
> 😂如果您在适配其他 RK 机型时遇到困难，欢迎您直接使用右侧项目😂👉👉👉[iStoreOS-Actions](https://github.com/Kwonelee/iStoreOS-Actions/releases)
> 
> 使用此仓库必须设置机密token，Actions云编译固件时需要用到，通常在仓库设置里面。机密键名为 `GH_TOKEN`（严禁在仓库可视代码中填写，否则后果自负）

## 😅 第三方插件 [![](https://img.shields.io/badge/-第三方插件-FFFFFF.svg)](#-第三方插件-)
<div align="center">

| 插件                     |  状态   | 源码地址                                                                  | 备注         |
|:------------------------:|:------:| ------------------------------------------------------------------------- | ------------ |
| ramfree释放内存           |  ✅   | [sbwml/openwrt_pkgs](https://github.com/sbwml/openwrt_pkgs)               | 🟢 已测试    |
| FileBrowser文件浏览器     |  ✅   | [sbwml/openwrt_pkgs](https://github.com/sbwml/openwrt_pkgs)               | 🟢 已测试    |
| lucky                    |  ✅   | [luci-app-lucky](https://github.com/gdy666/luci-app-lucky)                | 🟢 已测试    |
| openlist2                |  ✅   | [luci-app-openlist2](https://github.com/sbwml/luci-app-openlist2)         | 🟢 已测试    |
| adguardhome              |  ✅   | [w9315273/adguardhome](https://github.com/w9315273/luci-app-adguardhome) ; [sirpdboy/adguardhome](https://github.com/sirpdboy/luci-app-adguardhome) | 🟢 已测试     |
| 其他                     |  ⏳   |                                                                           |               |

✅ 支持 - ⏳ 计划中 - ⭕ 不支持

</div>

## 😊 支持设备 [![](https://img.shields.io/badge/-支持设备-FFFFFF.svg)](#-支持设备-)
<div align="center">

| 设备         |  状态     |  包名                                                                   | 备注                      |
|-------------|:---------:| ----------------------------------------------------------------------- | ------------------------- |
| tvi3315a    |    ✅    | istoreos-rockchip-armv8-tvi_tvi3315a-squashfs-sysupgrade.img.gz         | ⭕ 最新源码不可用后续移除   |
| jp-tvbox    |    ✅    | istoreos-rockchip-armv8-jp_jp-tvbox-squashfs-sysupgrade.img.gz          | 🟢 已测试                 |
| 其他        |    ⏳    |                                                                         |                           |

✅ 支持 - ⏳ 计划中 - ⭕ 不支持

</div>

## 🤗 项目截图 [![](https://img.shields.io/badge/-项目截图-FFFFFF.svg)](#-项目截图-)
![screenshots](./configfiles/screenshot/screenshot2.png)

# 🌟 Star戳一戳，好运加满！😆
> **"点过 `Star` 的朋友，颜值与智慧双双在线！✨"**

> **"您的每一个⭐️，都是开源土壤里的一缕阳光，让灵感发芽，让创造生长~"**

## 🎉 Thanks [![](https://img.shields.io/badge/-Thanks-FFFFFF.svg)](#-Thanks-)
- [istoreos](https://github.com/istoreos/istoreos)
- [linux-6.6.y](https://github.com/unifreq/linux-6.6.y)
- [Actions-iStoreOS-RK35XX-24.10](https://github.com/xiaomeng9597/Actions-iStoreOS-RK35XX-24.10)

## 🙏 免责声明 [![](https://img.shields.io/badge/-免责声明-FFFFFF.svg)](#-免责声明-)
- 📚 本固件仅供学习研究，严禁用于任何商业用途
- 🤝 使用本固件产生的所有后果均由使用者自行承担
- ⚠️ 固件仍可能存在缺陷，开发者不提供任何形式的技术支持
- 📜 请严格遵守国家网络安全法律法规，合法使用

<a href="#readme">
<img src="https://img.shields.io/badge/-返回顶部-FFFFFF.svg" title="返回顶部" align="right"/>
</a>
