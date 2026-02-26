---
title: History
description: Why I started mslicer, the open-source resin slicer
date: 2026-02-25
---

> This article is a combination of explanation why I started this project and some ramblings on interesting problems I had to solve while working on it.

June of 2024 I got access to an [ELEGOO Saturn 3 Ultra](https://www.elegoo.com/products/elegoo-saturn-3-ultra-resin-3d-printer-12k) resin printer, but was disappointed with the selection of slicers.
From what I found, the main choices were [Chitubox](https://chitubox.com/), [VoxelDance Tango](https://voxeldance.com/Tango), and [Lychee](https://mango3d.io/), none of which are open source and all had other issues.

For some reason, models sliced with Chitubox were not printing (I was probably just doing something wrong but moving on).
I actually really liked VoxelDance Tango but they charge $16/month and limit the number of slicing operations per month, so I didn't make it past the free trial.
Online I saw a lot of praise for Lychee Slicer, but when I first ran it to test it out, I swear it took like ten minutes to start, I also had to make an account to use it, there were ads in it, and the slicing was surprisingly slow.

Resin printers build models bottom-up by exposing UV-curing resin with a specific pattern then moving the build plate up for the next layer.
I figured that since MSLA slicers really just need to output an image for each layer, it shouldn't be too hard to make my own.

> This introduction was taken from my personal website's [mslicer project page](https://connorslade.com/projects/mslicer).

A few years later I'm still working on it, but all things considered it wasn't *that* hard.
When I started I had no idea what I was doing (I was only a Junior in High School :eyes:).
I knew I had to somehow intersect a plane with the mesh for each layer, which would give a polygon that could be filled in, but I didn't know the details.
Looking back, I think it's a good thing I had to figure everything out from scratch, because I ended up doing some things better than the competition.

After some research, I realized that every triangle in each mesh could be intersected with the layer plane, which, would either yield a line segment or nothing.
This process could be accelerated by first partitioning the triangles so only faces close to each layer actually run the full intersection test.
Then, to fill the polygons, I decided to use the scan line fill algorithm.[^2]

Because MSLA formats use run-length encoding[^1] I was able to optimize the polygon filling by outputting runs directly instead of filling a bitmap then compressing it.
I can't see the source code of the other slicers, but I suspect this optimization is why mslicer is so much faster than them.
Although speed wasn't originally a goal I had for the project, after seeing that I accidentally made something 20 to 120 times faster than competing slicers, I decided to focus more on it.
This meant writing custom algorithms for processing layers without decompressing them, which was actually really interesting.
That's also why island detection and NanoDLP encoding[^3] is so fast.

I worked on mslicer for a lot of the summer after I first started the project, but eventually moved onto [other things](https://store.steampowered.com/app/3385920/Beam_Time).
But I kept coming back every so often and kept making releases every few months.
Most of the projects I work on are just for me, so it's been great to have a one that people use and addresses a real need in the space.

---

[^2]: Scanline Fill Algorithm

> This algorithm works by intersecting a horizontal scanline with your polygon at every y-value.
> Assuming the polygon is closed, you will get an even number of points, which are the segments of that row that are inside the polygon.
> Normally you would then fill these segments of pixels with some value.

[^1]: Run-Length Encoding

> Because resin printers often have very high resolution displays/masks it would be impractical to store layer data uncompressed, for this reason all the supported formats make use of some form of run-length encoding (RLE).
> This is where equal adjacent values are grouped, so `0100001111` would be converted to `0×1, 1×1, 0×4, 1×4` because the sequence starts with one `0`, then one `1` then four `0`s, etc.

[^3]: NanoDLP Encoding

> The NanoDLP format is interesting, but one strange thing about it is that it uses regular PNG images inside a zip file to store the layer data.
> When I was first implementing the NanoDLP format, I used an existing image processing library but didn't like how the time to encode all the PNGs was slowing down the slicing process more than the intersection tests.
> So I decided to write a custom PNG encoded optimized specifically for run-length encoded data, since that's white the polygon fill code outputs.
> I won't go into the details here, but although it took me a while to understand how everything works the [actual implementation](https://github.com/connorslade/mslicer/blob/39bd721fca9091749e1a0aa62c1fba573e1a5362/common/src/container/rle/png.rs) is not too complicated.
