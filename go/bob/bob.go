package bob

import (
	"regexp"
	"strings"
)

// Returns appropriate responses based on the passed remark.
func Hey(remark string) string {
	remark = strings.TrimSpace(remark)
	isAllCaps := remark == strings.ToUpper(remark)
	isQuestion := strings.HasSuffix(remark, "?")
	containsLetters := regexp.MustCompile(`[a-zA-Z]`).MatchString

	switch {
	case remark == "":
		return "Fine. Be that way!"
	case isAllCaps && containsLetters(remark):
		if isQuestion {
			return "Calm down, I know what I'm doing!"
		} else {
			return "Whoa, chill out!"
		}
	case isQuestion:
		return "Sure."
	default:
		return "Whatever."
	}
}
