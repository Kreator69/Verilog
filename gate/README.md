# Gate

## Compiling Verilog Code
```
iverilog -o gatecktsim gateckt.v tb_gateckt.v

```

## TestBench Results
```
vvp gatecktsim
```

## Visualize Using GTK Wave
```
gtkwave gateckt.vcd
```