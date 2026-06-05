#!/bin/bash
# 本脚本在 feeds update/install 之后、make defconfig 之前执行

# 修改 feeds 配置 - 确保 nikki 和 homeproxy 被安装
if ! grep -q "nikki" feeds.conf.default; then
    echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git" >> feeds.conf.default
fi

if ! grep -q "homeproxy" feeds.conf.default; then
    echo "src-git homeproxy https://github.com/immortalwrt/homeproxy.git" >> feeds.conf.default
fi

# 重新更新 feeds
./scripts/feeds update nikki homeproxy
./scripts/feeds install -a -p nikki
./scripts/feeds install -a -p homeproxy

# 删除不需要的插件包目录（避免编译冲突）
rm -rf package/feeds/passwall_packages 2>/dev/null
rm -rf package/feeds/luci/luci-app-passwall 2>/dev/null
rm -rf package/feeds/luci/luci-app-openclash 2>/dev/null

echo "✅ diy.sh 执行完毕"
