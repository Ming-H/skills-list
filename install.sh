#!/bin/bash

# skills-list 安装脚本
# GitHub: https://github.com/Ming-H/skills-list

set -e

REPO_URL="https://raw.githubusercontent.com/Ming-H/skills-list/main"
SKILL_FILE="SKILL.md"
SKILL_NAME="skills-list.md"

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 打印帮助
print_help() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --global, -g    安装到用户级目录 (~/.claude/skills/)"
    echo "  --project, -p   安装到项目级目录 (.claude/skills/) [默认]"
    echo "  --help, -h      显示此帮助信息"
    echo ""
    echo "Examples:"
    echo "  $0                      # 安装到当前项目"
    echo "  $0 --global             # 安装到用户目录（所有项目可用）"
    echo "  curl -sSL URL | bash    # 一键安装到项目"
    echo "  curl -sSL URL | bash -s -- --global  # 一键安装到用户目录"
}

# 解析参数
INSTALL_MODE="project"

while [[ $# -gt 0 ]]; do
    case $1 in
        --global|-g)
            INSTALL_MODE="global"
            shift
            ;;
        --project|-p)
            INSTALL_MODE="project"
            shift
            ;;
        --help|-h)
            print_help
            exit 0
            ;;
        *)
            echo -e "${RED}未知参数: $1${NC}"
            print_help
            exit 1
            ;;
    esac
done

# 确定安装路径
if [ "$INSTALL_MODE" = "global" ]; then
    SKILLS_DIR="$HOME/.claude/skills"
    INSTALL_DESC="用户级（所有项目可用）"
else
    SKILLS_DIR="$(pwd)/.claude/skills"
    INSTALL_DESC="项目级（仅当前项目）"
fi

# 打印 banner
echo -e "${BLUE}"
echo "╔═══════════════════════════════════════════╗"
echo "║         skills-list 安装程序              ║"
echo "║   查看所有可用的 Claude Code Skills       ║"
echo "╚═══════════════════════════════════════════╝"
echo -e "${NC}"

echo -e "${YELLOW}安装模式: ${INSTALL_DESC}${NC}"
echo -e "${YELLOW}目标路径: ${SKILLS_DIR}/${SKILL_NAME}${NC}"
echo ""

# 创建目录
if [ ! -d "$SKILLS_DIR" ]; then
    echo -e "${BLUE}→ 创建目录: ${SKILLS_DIR}${NC}"
    mkdir -p "$SKILLS_DIR"
fi

# 下载文件
echo -e "${BLUE}→ 下载 SKILL.md...${NC}"
if curl -fsSL "${REPO_URL}/${SKILL_FILE}" -o "${SKILLS_DIR}/${SKILL_NAME}"; then
    echo -e "${GREEN}✓ 下载成功${NC}"
else
    echo -e "${RED}✗ 下载失败${NC}"
    echo -e "${RED}请检查网络连接或手动下载: ${REPO_URL}/${SKILL_FILE}${NC}"
    exit 1
fi

# 验证安装
if [ -f "${SKILLS_DIR}/${SKILL_NAME}" ]; then
    echo ""
    echo -e "${GREEN}╔═══════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║           安装成功！                      ║${NC}"
    echo -e "${GREEN}╚═══════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "文件位置: ${GREEN}${SKILLS_DIR}/${SKILL_NAME}${NC}"
    echo ""
    echo -e "${YELLOW}使用方法:${NC}"
    echo -e "  在 Claude Code 中输入："
    echo -e "  ${BLUE}\"有哪些skills？\"${NC}"
    echo -e "  ${BLUE}\"查看skills列表\"${NC}"
    echo ""
else
    echo -e "${RED}安装失败，请检查权限或手动安装${NC}"
    exit 1
fi
