package main

import (
	"sync/atomic"
	"time"
)

const limit = 15000

func main() {
	var c int32

	for i := 0; i < limit; i++ {
		go func() {
			atomic.AddInt32(&c, 1)
			time.Sleep(time.Millisecond)
		}()
	}

	for c < limit {
	}
	println("finish", c)
}
