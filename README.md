bmc-sdr-status
==============
A monitoring solution for Ampere Altra BMC sensor status on Docker with [Prometheus](https://prometheus.io/), [Grafana](http://grafana.org/),  and [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/).

Also thank [dockprom](https://github.com/stefanprodan/dockprom) inspire me to build this script

## Download

Clone bmc-sdr-status from github 
```bash
git clone https://github.com/richliu/bmc-sdr-status.git
cd bmc-sdr-status
```

# Build Docker Image

Install docker first on your Linux platform, for example, ubuntu 
```bash
sudo snap install docker
```

Next step is to build telegraf docker image by yourself. 
```bash
bash build-telegraf.sh
```

It will download latest telegraf docker image and build it. 

# Configure Ampere Altra BMC Server

Modify file bmc-sdr-status/telegraf/telegraf.conf, and section ```[[inputs.ipmi_sensor]]```

There are two pre-configure server, ADMIN:ADMIN is your BMC web/ipmi login username and password, please modify it according to your environment
```
servers = ["ADMIN:ADMIN@lan(192.168.110.234)", "ADMIN:ADMIN@lan(192.168.3.157)" ]
```
## Run Services

In directory bmc-sdr-status, run command below
```bash
docker-compose up -d
```

## Setup Garfarna 
Navigate to `http://<host-ip>:3000` and login with user ***admin*** password ***admin***. This script doesn't provide proxy function like dockprom does.

Grafana is preconfigured with dashboards and Prometheus as the default data source:

* Name: Prometheus
* Type: Prometheus
* Url: http://prometheus:9090
* Access: Server
  
## Screenshot 
![screenshot](https://github.com/richliu/bmc-sdr-status/raw/main/screens/Ampere_Altra_Bmc.png)
