export PYTHONPATH=$PWD:${PWD}/../vball_tracking

# Train on Titan-RTX Turing
export CUDA_VISIBLE_DEVICES=0,1
export WORLD_SIZE=1
# export CUDA_VISIBLE_DEVICES=0
# unset WORLD_SIZE

EXP=yolox_x_fullcourt
DSET=v8_2
TAG="new-bytetrack-baseline"

CKPT=/mnt/g/checkpoints/ByteTrack/bytetrack_x_mot17.pth.tar

python3 tools/train.py \
	-d 2 -b 8 --fp16 \
	-f exps/example/mot/${EXP}.py \
	-o \
        -expn ${EXP}_${DSET}${TAG} \
	train_ann /mnt/g/data/vball/fullcourt/trn_${DSET}.json \
	val_ann /mnt/g/data/vball/fullcourt/val_${DSET}.json \
	max_epoch 12 no_aug_epochs 4

#	--resume -c $CKPT \
