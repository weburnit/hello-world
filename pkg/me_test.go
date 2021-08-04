package pkg

import "testing"

func TestIam(t *testing.T) {
	tests := []struct {
		name string
		want string
	}{
		{
			name: "#1: Test me",
			want: "paul",
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := Iam(); got != tt.want {
				t.Errorf("Iam() = %v, want %v", got, tt.want)
			}
		})
	}
}
