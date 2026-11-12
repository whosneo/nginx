# syntax=docker/dockerfile:1
FROM nginx:latest

# 调整 nginx 的 UID/GID（与常见宿主机用户匹配）
RUN <<'EOF'
set -eux
usermod -u 1000 nginx
groupmod -g 1000 nginx
# usermod 只改家目录里的属主，基础镜像里 uid/gid 101 的文件要单独改
find / -xdev -uid 101 -exec chown -h nginx {} +
find / -xdev -gid 101 -exec chgrp -h nginx {} +
if find / -xdev \( -uid 101 -o -gid 101 \) | grep -q .; then
    echo "leftover uid/gid 101" >&2
    find / -xdev \( -uid 101 -o -gid 101 \) -ls >&2
    exit 1
fi
test "$(id -u nginx)" = 1000
test "$(id -g nginx)" = 1000
EOF
