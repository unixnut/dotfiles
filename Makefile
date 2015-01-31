.PHONY: all
all: .less

.less: .lesskey
	lesskey --output=$@ $^
