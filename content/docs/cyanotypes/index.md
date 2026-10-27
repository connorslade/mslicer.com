---
title: Cyanotypes
description: 2D printing on a 3D printer… for some reason
date: 2026-10-27
---

{{phosphor_icons()}}

A cyanotype is a photographic printing process sensitive to a similar wavelength of UV light that cures printing resin.
For that reason, it is possible to expose cyanotypes with a resin printer!
Probably no practical use for this; I just thought it would be funny to print 2D images with a 3D printer ☺.

You can get pre-coated cyanotype paper online for under $10, although the quality and uniformity may not be the best.

## Examples

<div class="examples">
    <img src="/docs/cyanotypes/examples/skrillex.png" />
    <img src="/docs/cyanotypes/examples/kim.png" />
    <img src="/docs/cyanotypes/examples/edison.png" />
</div>

From left to right: album covers for "Don't Get Too Close" (Skrillex), "Problématique" (Kim Petras), and Thomas Edison's incandescent light patent (No. 223,898).

## How To

<div class="row">
<div>

Using '{{icon(class="hammer")}} Tools › Image Layer' in mslicer, you can create a print job with a single layer defined by an image file.
The settings here are pretty self-explanatory. Just don't forget to flip your images!

Because there is only one layer (if your bottom layers setting is >0), modify the 'Bottom Layers' exposure settings.
I've found that 15-20 minutes of exposure time is enough to cause full darkening on my printer.

However, just like with resin curing, the darkening is not directly proportional to exposure, so you will need to first do a calibration test to figure out the needed exposure remapping curve (see next section).

</div>
<img src="/docs/cyanotypes/tool.png" />
</div>

### Exposure Calibration

<div class="row">
<div>

Using '{{icon(class="hammer")}} Tools › Calibration › Exposure Test', you can very easily generate a print job with bands of linearly increasing exposure.
Set the XY dimensions to their maximums and Z to zero; the default 15 steps should be fine.
See my result on the right. (Ignore my bad post-processing, which caused the ugly brown spots!)

After scanning the print into an image, I converted it to grayscale and measured the average darkness of each band.
Fitting a curve to [the data](https://www.desmos.com/calculator/6bie627yoa), I found that, for my setup, the needed remapping curve is <img src="/docs/cyanotypes/mapping.svg" style="width: initial" />.
I then modified the exposure remapping Bézier handles in mslicer to approximate it.

I'm not sure how the required remapping changes with different formulations, but you may just be able to copy my values.

</div>
<img src="/docs/cyanotypes/calibration.png" class="shadow" style="max-width: min(432px, 100%);" />
</div>

<br />

<div class="row" style="display: flex;">
<img src="/docs/cyanotypes/remap.png" class="shadow" style="max-width: min(200px, 100%);" />

|P|X|Y|
|:-:|:-:|:-:|
|P₁|0.000|1.000|
|P₂|0.000|0.888|
|P₃|0.463|0.674|
|P₄|1.000|0.528|

</div>

## Resources

- [Cyanotype – the classic process](https://www.alternativephotography.com/cyanotype-classic-process)
- Historic Photographic Processes by Richard Farber

<!---->

<style>
.examples {
    display: grid;
    grid-template-columns: 1fr 1fr 0.59fr;
    gap: 20px;
    
    & > img {
        width: 100%;
    }
}

.shadow, .examples > img {
    filter: drop-shadow(10px 10px 5px #00000050);
}
</style>
