---
title: Benchmark
description: Speed comparison of mslicer with other slicers
date: 2026-04-8
---

I often claim that mslicer is one of (if not the) fastest resin slicer currently available, so lets do some comparisons with other slicers: ChituBox, Lychee, Lychee Beta, and Photon Workshop.
All of the tests were performed on an my Framework 13 with the {{details(body="Intel® Core™ Ultra 7 165H" desc="6 Performance-cores at 5GHz")}} for the {{details(body="Saturn 3 Ultra" desc="Resolution: 11520×5120")}}.

## The Tests

Each test was performed with and without anti-aliasing at 50μm layer heights.
Note that mslicer is the only slicer in this comparison that supports {{details(body="3DAA" desc="3D Anti-aliasing")}}, meaning it's doing a lot more work while being faster.
The antialiasing level was selected in each slicer to output 9 shades of grey.
Also note that the free version of Lychee has a 20 second waiting period for each slice operation that is not counted here.
 
<div class="benchmark-selector">
  <label><input type="radio" name="benchmark" id="type-normal" checked>Regular</label>
  <label><input type="radio" name="benchmark" id="type-aa">Anti-Alias</label>
</div>

### Stanford Dragon

A standard test model from [The Stanford 3D Scanning Repository](https://graphics.stanford.edu/data/3Dscanrep/#:~:text=of%20this%20model.%20-,Dragon).
318k faces, 1.9k layers.

<div class="test-model">
    <img src="/docs/benchmark/stanford-dragon.png" />
    <img class="type-normal" src="/docs/benchmark/stanford-dragon-chart.svg" />
    <img class="type-aa" src="/docs/benchmark/stanford-dragon-aa-chart.svg" />
</div>

### Wave Energy

Result from my [wave simulator](https://github.com/connorslade/wave-sim) of light passing through a biconvex lens.
2.6M faces, 242 layers.

<div class="test-model">
    <img src="/docs/benchmark/wave-sim.png" />
    <img class="type-normal" src="/docs/benchmark/wave-sim-chart.svg" />
    <img class="type-aa" src="/docs/benchmark/wave-sim-aa-chart.svg" />
</div>

### Stress Test

This is a model I created to have lots of detail on each layer to help me optimize mslicer.
It's basically just a bunch of columns.
29k faces, 2k layers.

<div class="test-model">
    <img src="/docs/benchmark/stress-test.png" />
    <img class="type-normal" src="/docs/benchmark/stress-test-chart.svg" />
    <img class="type-aa" src="/docs/benchmark/stress-test-aa-chart.svg" />
</div>

<!---->

<style>
    .benchmark-selector > label {
        cursor: pointer;
        padding: 4px 12px;
        border: 1px solid #ccc; 

        &:first-child { border-radius: 4px 0 0 4px; }
        &:last-child { border-radius: 0 4px 4px 0; }

        color: #666;
        background: #fff;

        &:hover {
            background: #f0f0f0;
            color: black;
        }

        &:has(input:checked) {
            background: #f0f0f0;
            color: black;
            border-color: black;
        }

        & > input { display: none; }
    }
    
    body:has(input#type-normal:not(:checked)) .type-normal,
    body:has(input#type-aa:not(:checked)) .type-aa {
        display: none;
    }

    .test-model {
        display: grid;
        grid-template-columns: 1fr 1.4fr;
        align-items: center;
    }
    
    .test-model img {
        max-width: 100%;
    }
</style>
