# Fronius Energy Consumption & Prometheus Monitoring

Here you can find the docker compose yaml configuration for the fronius energy consumption, which writes the data into a influxdb (currently 1.8 - because of the ARM architecture, which uses the Raspberry PI) and visualize the data in a Grafana Dashboard.

A configuration to Monitor such a device with Prometheus is available. It uses the **cadvisor** (container Advisor) which analyzes and exposes resource usage and performance data from running containers. The **node-exporter** is also used for hardware- and kernel-related metrics. In the configuration you can find a job for **docker** itself. To use this job, you have to be sure that you activate the correspondending Prometheus target. Please have a further look at the configuration for docker [here](https://docs.docker.com/config/daemon/prometheus/).

## Fronius Energy Consumption

The [compose.yaml](smarthome/compose.yaml) includes the service for the influxdb and grafana. As well the fronius energy consumption service will be started, which collects the data. For a further look to configure the fronius energy consumption, you have to switch to the *fronius-energy* [repository](https://github.com/lukeSky3434/fronius-energy).

### Configuration

Environment Variable | Default | Description
------------ | ------------- | -------------
INFLUX_DB_HOME | /home/pi/influxdb/ | Variable which points influxdb home directory
GRAFANA_HOME | /home/pi/grafana/ | Variable which points to the grafana home directory

### Precondition

There should be three directories available in the HOME directory of influx:
* *data*: the docker container will put the data of influx in this directory
* *config*: config file can be added here (e.g.: [influxdb.conf](multi-container-arm/smarthome/influxdb.conf))
* *backup*: backup directory

In the HOME directory of grafana there should be one directory:
* *data*: the docker container will put the data of grafana in this directory

## Prometheus

The [compose.yaml](prometheus/compose.yaml) starts the prometheus container with the corresponding [configuration](prometheus/config.yml).

Environment Variable | Default | Description
------------ | ------------- | -------------
PROMETHEUS_CONFIG_FILE | /home/pi/prometheus/config.yml | Variable which points to the [configuration file](prometheus/config.yml)

It also starts the **cadvisor** and **node-exporter** Service.

## Docker-Compose

Compose is a tool for defining and running multi-container Docker applications, which uses a YAML configuration file.

To install the compose tool on your maschine follow the [instructions](https://docs.docker.com/compose/install/).

For the start the containers use the `docker-compose up` command, add the `-d` option to run the containers in the background.

To stop and remove everything, the `docker-compose down` command should be used.
