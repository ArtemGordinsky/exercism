package letter

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(s string) FreqMap {
	m := FreqMap{}
	for _, r := range s {
		m[r]++
	}
	return m
}

// ConcurrentFrequency counts the frequency of runes in each of the strings asynchronously.
func ConcurrentFrequency(strings []string) FreqMap {
	channel := make(chan FreqMap, len(strings))

	for _, s := range strings {
		go func(s string, ch chan FreqMap) {
			ch <- Frequency(s)
		}(s, channel)
	}

	totalFrequency := FreqMap{}
	for range strings {
		freqMap := <-channel
		for k, v := range freqMap {
			totalFrequency[k] += v
		}
	}

	return totalFrequency
}
