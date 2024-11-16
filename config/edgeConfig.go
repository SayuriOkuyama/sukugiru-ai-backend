package config

import (
	"fmt"
	"log"

	edgeconfig "github.com/thatmattlove/go-vercel-edge-config"
)

func NewEdgeConfig(apiKey, token string) *edgeconfig.VercelEdgeConfigClient {
	options := &edgeconfig.ClientOptions{
		EdgeConfigID:   apiKey,
		EdgeConfigToken: token,
	}

	ec, err := edgeconfig.New(options)
	if err != nil {
			log.Fatalf("Failed to create Edge Config client: %v", err)
	}

	greeting, err := ec.Item("greeting")
	if err != nil {
			log.Fatalf("Failed to get greeting item: %v", err)
	}

	fmt.Println("Greeting:", greeting)

	return ec
}
