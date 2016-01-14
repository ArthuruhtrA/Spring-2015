restart
force CLK 0 0, 1 50ns -repeat 100ns
force SL 1 0, 0 120
force SIN 0 120, 1 320
force RST 0 0, 1 20ns
force A 1 0
force B 0 0
force C 1 0
force D 1 0
run 600ns