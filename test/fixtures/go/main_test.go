package main

import "testing"

func TestGreeting(t *testing.T) {
	want := "hello from actions test fixture"
	if got := greeting(); got != want {
		t.Errorf("greeting() = %q, want %q", got, want)
	}
}
