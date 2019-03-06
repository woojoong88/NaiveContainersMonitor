#!/bin/bash
#
# Copyright 2019-present an Individual Developer Woojoong Kim
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

docker run -d -p 9100:9100 --name node-exporter prom/node-exporter:v0.14.0

docker run --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --volume=/dev/disk/:/dev/disk:ro --publish=8080:8080 --detach=true --name=cadvisor google/cadvisor:v0.27.0

docker run -d --name prometheus -h prometheus -v $(pwd)/config/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus:v1.7.0 -config.file=/etc/prometheus/prometheus.yml

docker run -d --name prometheus-cadvisor -h prometheus-cadvisor -v $(pwd)/config/prometheus-cadvisor.yml:/etc/prometheus/prometheus.yml prom/prometheus:v1.7.0 -config.file=/etc/prometheus/prometheus.yml

docker run -d --name grafana -h grafana -e GF_SECURITY_ADMIN_PASSWORD=pass -p 3000:3000 --link prometheus:prometheus --link prometheus-cadvisor:prometheus-cadvisor grafana/grafana:4.4.3
