#!/bin/bash
# Copyright 2017 WSO2 Inc. (http://wso2.org)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ----------------------------------------------------------------------------
# Generate JSON Payloads
# ----------------------------------------------------------------------------

script_dir=$(dirname "$0")
echo "Generating 0 KiB file"
touch 0K.json

for s in 1 10 100
do
    echo "Generating ${s}KiB file"
    java -jar $script_dir/payload-generator-${performance.common.version}.jar --size $s
done
