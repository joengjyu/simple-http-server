package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
)

type PortArray []string

func (pa *PortArray) String() string {
	return "PortArray"
}

func (pa *PortArray) Set(value string) error {
	*pa = append(*pa, value)
	return nil
}

var ports PortArray

func init() {
	flag.Var(&ports, "port", "每个port都会启动一个HTTP服务")
}

func main() {
	flag.Parse()
	hostname, _ := os.Hostname()
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		_, err := fmt.Fprintf(w, "Hello from %s\nPowered by Simple HTTP Server\n", hostname)
		if err != nil {
			fmt.Println(err)
		}
	})

	if len(ports) == 0 {
		ports = append(ports, "80")
	}

	for _, port := range ports {
		go startServer(port)
	}

	select {}
}

func startServer(port string) {
	fmt.Printf("Starting server at port %s\n", port)
	if err := http.ListenAndServe(":"+port, nil); err != nil {
		log.Fatal(err)
	}
}
