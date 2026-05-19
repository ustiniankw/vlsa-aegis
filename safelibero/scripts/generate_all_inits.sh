#!/bin/bash

# 开启 MuJoCo EGL 硬件加速渲染 (无头服务器必备)
export MUJOCO_GL=egl
# ==========================================
# 1. 定义核心路径变量 (提取公共部分，让代码变得极其清爽)
# ==========================================
PYTHON_SCRIPT="/mnt/shared-storage-user/xiakaiwen/VLA-Arena/scripts/init_file_create.py"
BASE_BDDL_DIR="/mnt/shared-storage-user/xiakaiwen/vlsa-aegis/safelibero/libero/libero/bddl_files"
BASE_OUTPUT_DIR="/mnt/shared-storage-user/xiakaiwen/vlsa-aegis/safelibero/libero/libero/init_files"

# ==========================================
# 2. 定义你要处理的 8 个任务套件列表
# ==========================================
SUITES=(
    #"libero_goal_hazard_avoidance"
    #"libero_long_hazard_avoidance"
    "libero_object_hazard_avoidance"
    "libero_spatial_hazard_avoidance"
)

'''
    "safelibero_goal"
    "safelibero_long"
    "safelibero_object"
    "safelibero_spatial"
'''
echo "🚀 开始批量生成所有任务的 pruned_init 存档..."
echo "================================================="

# ==========================================
# 3. 循环遍历每个套件，利用 Python 脚本的文件夹处理能力
# ==========================================
for SUITE in "${SUITES[@]}"
do
    echo "📦 正在处理套件: $SUITE"
    
    # 拼接当前套件的输入和输出路径
    SUITE_BDDL_DIR="$BASE_BDDL_DIR/$SUITE"
    SUITE_OUTPUT_DIR="$BASE_OUTPUT_DIR/$SUITE"
    
    # 如果该套件的 bddl 文件夹存在，则执行 Python 脚本
    if [ -d "$SUITE_BDDL_DIR" ]; then
        python $PYTHON_SCRIPT \
            --bddl_file "$SUITE_BDDL_DIR" \
            --output_path "$SUITE_OUTPUT_DIR"
        
        echo "✅ 套件 $SUITE 处理完成！"
    else
        echo "⚠️ 警告: 找不到文件夹 $SUITE_BDDL_DIR，已跳过。"
    fi
    echo "-------------------------------------------------"
done

echo "🎉 所有套件的初始化状态存档已全部生成完毕！"