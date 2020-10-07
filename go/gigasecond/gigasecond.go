package gigasecond

import "time"

// Adds 1 Gigasecond to the provided date.
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Second * 1e9)
}
