---
title: Features
description: Overview of mslicer's more interesting features
date: 2026-06-30
---

### Open Source and Private

There aren't really any open-source slicers for resin printers.
Most existing options are closed-source, expensive, slow, require accounts, limit usage, don't support Linux, or even have built-in ads.
mslicer exists to be the opposite of that.
It's fully open source ([GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.en.html)) and will never include any analytics or require an account.

This also makes experimentation and research easier, something that's been common in FDM printing, but missing in the resin printing world due to lack of accessible and hackable tooling.

### Performance

In my testing (see [Benchmark](/docs/benchmark)), I've found that mslicer is often 20 to 120 times faster than competing slicers (crazy right‽).
For most use-cases this is just makes your workflow a little smoother, but with super high-poly models mslicer might be the only tool capable of the job.
This is achieved with multithreading, acceleration structures, and by slicing directly into a {{details(body="RLE" desc="Run-length encoding\nConsecutive occurrences of the same value are stored as a single value and a count.")}} compressed form.

### 3D Anti-Aliasing

Anti-aliasing (AA) reduces the stair-stepping caused by the discrete pixels and layers.
Most slicers only implement XY-AA which increases the effective resolution in those axes; however this is getting less important with higher pixel density printers coming out.
mslicer can apply anti-aliasing across all three axes, smoothing visible layer lines.

### Remote Print

Inside of mslicer you can connect to any Chitu-mainboard printers on your network and remotely start and monitor prints.
No other slicers have this functionality completely built-in.

### Model Alignment

### Collections
