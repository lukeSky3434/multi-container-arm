#!/bin/bash
sudo docker exec influx influxd backup -portable -database home /backup

