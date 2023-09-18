from pathlib import Path
import sys
import yaml
import os

if os.path.exists("/mnt/v-peihuamai/unlearning/memit/globals.yml"):
    path = "/mnt/v-peihuamai/unlearning/memit/globals.yml"
if os.path.exists("/home/v-peihuamai/amlt-msra/unlearning/memit/globals.yml"):
    path = "/home/v-peihuamai/amlt-msra/unlearning/memit/globals.yml"
# path2 = "/home/v-peihuamai/amlt-msra/unlearning/memit/globals.yml"
with open(path, "r") as stream:
    data = yaml.safe_load(stream)

(RESULTS_DIR, DATA_DIR, STATS_DIR, HPARAMS_DIR, KV_DIR) = (
    Path(z)
    for z in [
        data["RESULTS_DIR"],
        data["DATA_DIR"],
        data["STATS_DIR"],
        data["HPARAMS_DIR"],
        data["KV_DIR"],
    ]
)

REMOTE_ROOT_URL = data["REMOTE_ROOT_URL"]
