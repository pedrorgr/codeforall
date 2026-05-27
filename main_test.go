package main

import (
	"reflect"
	"testing"
)

func TestFibonacci(t *testing.T) {
	tests := []struct {
		input    int
		expected []int
	}{
		{1, []int{1}},
		{2, []int{1, 1}},
		{5, []int{1, 1, 2, 3, 5}},
		{7, []int{1, 1, 2, 3, 5, 8, 13}},
	}

	for _, test := range tests {
		result := fibonacci(test.input)
		if !reflect.DeepEqual(result, test.expected) {
			t.Errorf("Fibonacci(%d) = %v; want %v", test.input, result, test.expected)
		}
	}
}
