#!/bin/bash
# Copyright 2020 DeepMind Technologies Limited.
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

python -m venv avae_env
source avae_env/bin/activate
pip install --upgrade pip
pip install -r avae/requirements.txt

# Start training AVAE model.
python -m avae.train_main \
  --dataset='color_mnist' \
  --latent_dim=64 \
  --checkpoint_dir='/tmp/avae_checkpoints' \
  --checkpoint_filename='color_mnist_mlp_avae' \
  --rho=0.975 \
  --encoder=color_mnist_mlp_encoder \
  --decoder=color_mnist_mlp_decoder \
  --iterations=1
