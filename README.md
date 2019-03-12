# NaiveContainersMonitor

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/7668c17939544539bd6e8df46f0f71af)](https://app.codacy.com/app/woojoong88/NaiveContainersMonitor?utm_source=github.com&utm_medium=referral&utm_content=woojoong88/NaiveContainersMonitor&utm_campaign=Badge_Grade_Dashboard)
[![Build Status](https://travis-ci.org/woojoong88/NaiveContainersMonitor.svg?branch=master)](https://travis-ci.org/woojoong88/NaiveContainersMonitor)

![GitHub](https://img.shields.io/github/license/woojoong88/NaiveContainersMonitor.svg)
![GitHub top language](https://img.shields.io/github/languages/top/woojoong88/NaiveContainersMonitor.svg)
![GitHub language count](https://img.shields.io/github/languages/count/woojoong88/NaiveContainersMonitor.svg)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/woojoong88/NaiveContainersMonitor.svg)
![GitHub repo size in bytes](https://img.shields.io/github/repo-size/woojoong88/NaiveContainersMonitor.svg)
![GitHub All Releases](https://img.shields.io/github/downloads/woojoong88/NaiveContainersMonitor/total.svg)

![GitHub issues](https://img.shields.io/github/issues-raw/woojoong88/NaiveContainersMonitor.svg)
![GitHub closed issues](https://img.shields.io/github/issues-closed-raw/woojoong88/NaiveContainersMonitor.svg)
![GitHub commit activity](https://img.shields.io/github/commit-activity/y/woojoong88/NaiveContainersMonitor.svg)
![GitHub last commit](https://img.shields.io/github/last-commit/woojoong88/NaiveContainersMonitor.svg)

Naive version of Container Monitoring System with cAdvisor, InfluxDB, and Grafana. It is just for the study.

## Preliminaries

### 1. Need to install Docker engine
```
node$ ./set_env.sh
```

**NOTE: To make sure that the user is in the `docker` group, please log off and then log in again. You can check which groups belong to the user with the below command.**

```
node$ groups
```
If you can see the group `docker`, everything looks good!

## Install

### 1. Download and run node-exporter and cAdvisor
```
node$ ./set_each_node.sh
```

### 2. Configure prometheus configuration files
* Go to `conf/prometheus.yml` and change `<IP_number>` to node IP addresses running node-exporter
* Go to `conf/prometheus-cadvisor.yml` and change `<IP_number>` to node IP addresses running cAdvisor

### 3. Download and run Prometheus for node-exporter and cAdvisor
```
node$ ./set_prom.sh
```

### 4. Download and run Grafana
```
node$ ./set_grafana.sh
```

### 5. Configuration of Grafana within UI
**TBD**

## Release information
Release 1: Download and run node-exporter, cAdvisor, and Grafana. (Mar 5, 2019)

Release 2: Automatically set up Grafana and merge InfluxDB on top of Release 1. (Mar 15, 2019)

## Appendix 1. Troubleshooting
**TBD**
