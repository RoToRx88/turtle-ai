# LWOG (for Location WithOutGPS)

## Description

A little IA for your turtle to help your turtle locate itself without the GPS system of ComputerCraft

## How-to use

Just instantiate the class `LWOG` and call function like if it was `turtle`.
At a difference that when you want to go forward instead of call `turtle.forwad()` you have to call `LWOG.forward(1)`


## Example
So to go 8 blocks forward instead of:

``` lua
for (i = 0, 8) do
    turtle.forward();
end
```

Just do:
```lua
LWOG.forward(8);
```

## Contribution

You are free to contribute to the project, just fork it, code, and do a merge request :)