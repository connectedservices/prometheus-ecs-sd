package main

import (
    "github.com/connectedservices/prometheus-ecs-sd/cmd"
	log "github.com/sirupsen/logrus"
)

func main() {
	err := cmd.RootCmd.Execute()
	if err != nil {
		log.Fatal(err)
	}
}
