MUJOCO_GL=egl python /mnt/shared-storage-user/xiakaiwen/VLA-Arena/scripts/init_file_create.py --bddl_file /mnt/shared-storage-user/xiakaiwen/vlsa-aegis/safelibero/libero/libero/bddl_files/libero_spatial_hazard_avoidance/pick_up_the_black_bowl_on_the_ramekin_and_place_it_on_the_plate.bddl --output_path /mnt/shared-storage-user/xiakaiwen/vlsa-aegis/safelibero/libero/libero/init_files/libero_spatial_hazard_avoidance




conda activate cosmos

export PYTHONPATH="/mnt/shared-storage-user/xiakaiwen/vlsa-aegis/safelibero:/mnt/shared-storage-user/xiakaiwen/cosmos-policy-main"

pip install robosuite==1.5.1

cd /mnt/shared-storage-user/xiakaiwen/vlsa-aegis/safelibero/scripts

chmod +x generate_all_inits.sh

./generate_all_inits.sh
