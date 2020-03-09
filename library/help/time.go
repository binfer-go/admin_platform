package help

import (
	"strconv"
	"time"
)

const (
	TIME_FORMAT_OUT 	= "2006-01-02 15:04:05"
	TIME_FORMAT_DAY_OUT = "2006-01-02"
)

func TimeToSting(times int64) string {

	return time.Unix(times, 0).Format(TIME_FORMAT_OUT)

}

type Time time.Time

func (ts Time) MarshalJSON() ([]byte, error) {
	origin := time.Time(ts)
	return []byte(strconv.FormatInt(origin.UnixNano()/1000000, 10)), nil
}

func (ts *Time) Time() time.Time {
	return time.Time(*ts)
}

// UnmarshalJSON implements the json.Unmarshaler interface.
// The time is expected to be a quoted string in RFC 3339 format.
func (ts *Time) UnmarshalJSON(data []byte) error {
	if len(data) == 0 || string(data) == "null" {
		return nil
	}
	millis, err := strconv.ParseInt(string(data), 10, 64)
	if err != nil {
		return err
	}
	*ts = Time(time.Unix(0, millis*int64(time.Millisecond)))
	return nil
}

func (ts Time) String() string {
	return ts.Time().Format("2006-01-02 15:04:05")
}

func TimeStrips(y, m, d int) time.Time {

	init := time.Now()
	initTime := time.Date(init.Year(), init.Month(), init.Day(), 0,0,0,0, time.Local)
	return initTime.AddDate(y, m, d)

}
