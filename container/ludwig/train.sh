SM_BASE_DIR=/opt/ml
SM_INPUT_CONFIG_DIR=${SM_BASE_DIR}/input/config
SM_CHANNEL_TRAINING=${SM_BASE_DIR}/input/data/training
SM_MODEL_DIR=${SM_BASE_DIR}/model

RESULT_PREFIX="${SM_MODEL_DIR}/ludwig"

echo "$(cat ${SM_INPUT_CONFIG_DIR}/hyperparameters.json | tr -d \' | tr -d \")" > ${SM_MODEL_DIR}/model-def
ls ${SM_CHANNEL_TRAINING}

ludwig train --data_csv ${SM_CHANNEL_TRAINING}/* --model_definition_file ${SM_MODEL_DIR}/model-def --output_directory ${SM_MODEL_DIR}

echo "Generated model $(ls ${SM_MODEL_DIR})"
