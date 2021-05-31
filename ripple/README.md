# 4-Bit Adder

## Compiling Verilog Code
```
iverilog -o ripplesim ripple.v ripple-test.v
```

## TestBench Results
```
vvp ripplesim
```

## Visualize Using GTK Wave
```
gtkwave ripple.vcd
```