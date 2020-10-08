package letter

import "sync"

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

type SafeFreqMap struct {
	freqMap *FreqMap
	mutex   *sync.Mutex
}

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
	safeFreqMap := SafeFreqMap{freqMap: &FreqMap{}, mutex: &sync.Mutex{}}
	var wg sync.WaitGroup

	for _, s := range strings {
		wg.Add(1)
		go safeCalculateFrequency(s, &safeFreqMap, &wg)
	}

	wg.Wait()
	return *safeFreqMap.freqMap
}

func safeCalculateFrequency(s string, safeFreqMap *SafeFreqMap, wg *sync.WaitGroup) {
	defer wg.Done()
	for _, r := range s {
		safeFreqMap.mutex.Lock()
		(*safeFreqMap.freqMap)[r]++
		safeFreqMap.mutex.Unlock()
	}
}
