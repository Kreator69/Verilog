# 4-Bit Adder

## Compiling Verilog Code
```
iverilog -o add4sim add4.v add.v sum.v carry.v tb_add4.v
```

## TestBench Results
```
vvp add4sim
```

## Visualize Using GTK Wave
```
gtkwave add4.vcd
```