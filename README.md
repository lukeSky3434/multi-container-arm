# Fronius Energy Consumption & Prometheus Monitoring

Here you can find the docker compose yaml configuration for the fronius energy consumption, which writes the data into a influxdb (currently 1.8 - because of the ARM architecture, which uses the Raspberry PI) and visualize the data in a Grafana Dashboard.

You can also find a configuration to Monitor such a device with Prometheus. It uses the **cadvisor** (container Advisor) which analyzes and exposes resource usage and performance data from running containers. The **node-exporter** is also used for hardware- and kernel-related metrics. In the configuration you can also find a job for **docker** itself. For that you have to be sure, that you also collect these data, for that you should activate this Prometheus target. Please have a further look into the configuration for docker [here](https://docs.docker.com/config/daemon/prometheus/).

## Fronius Energy Consumption

You can use the [compose.yaml](smarthome/compose.yaml), which includes the service for the influxdb and grafana. It also starts the fronius reader, which collects the data. For a further look to configure the fronius reader, you have to switch to the *fronius-energy* repository.

Environment Variable | Default | Description
------------ | ------------- | -------------
INFLUX_DB_HOME | /home/pi/influxdb/ | Variable which points influxdb home directory 
GRAFANA_HOME | /home/pi/grafana/ | Variable which points to the grafana home directory

There should be two directories in the HOME directory of influx:
* *data*: the docker container will put the data of influx in this directory
* *config*: config file can be added here (e.g.: influxdb.conf)

In the HOME directory of grafana should be one directory:
* *data*: the docker container will put the data of grafana in this directory

## Prometheus

You can use the [compose.yaml](prometheus/compose.yaml), which starts the prometheus container with the corresponding [configuration](prometheus/config.yml). 


Environment Variable | Default | Description
------------ | ------------- | -------------
PROMETHEUS_CONFIG_FILE | /home/pi/prometheus/config.yml | Variable which points to the [configuration file](prometheus/config.yml) 

It also starts the cadvisor and node-export Service.


## Docker-Compose

Compose is a tool for defining and running multi-container Docker applications, which uses a YAML configuration file. 

You have to follow the [instructions](https://docs.docker.com/compose/install/) to install Compose on your machine. After your successful installation you can use the 

For the startup you can use the `docker-compose up` command, add the `-d` option to run the containers in the background.

To stop and remove everything, use the `docker-compose down` command.

