---
title: v0.10.0 Release Notes
description: Release notes for mslicer v0.10.0.
date: 2026-10-10
---

<link
rel="stylesheet"
type="text/css"
href="https://cdn.jsdelivr.net/npm/@phosphor-icons/web@2.1.1/src/regular/style.css"
/>

> **v0.10.0 is not yet released! This document is just a draft.**

This is a big release, about two months in the making!
The release notes only cover the biggest and most interesting features, check the [changelog](/docs/changelog) for a full list.

## New Features

### Modes

<div class="row">
<div>

The 3D viewport now has three modes: Cursor (default), Support Placement, and Orient to Face.
The modes change what clicking on a model does:

- **Cursor** &mdash; Selects a model in the `Models` panel, useful for use with keyboard shortcuts like Delete (D), Duplicate (C), Hide (H), etc.
  Can also select supports (generated or manually placed) for deletion or modification.
- **Support Placement** &mdash; Used with the `Supports` panel for manually adding supports to a model.
- **Orient to Face** &mdash; The model will be transformed so that the face you click will be made parallel with the build plate (facing down).
  This makes orienting models much easier, removing the need to manually edit the rotation angles.

</div>
<img src="/docs/release-notes/v0-10-0/modes.png" />
</div>

The modes can be switch by clicking the buttons or with the keyboard shortcuts 1 for Cursor, 2 for Support Placement, and 3 for Orient to face.

### Sliced Panel

#### Interactive Preview

<div class="row">
<div>

You can now customize the generated preview image that gets embedded in the sliced file.
The 'Workspace › Preview Image' dropdown lets you configure the preview image size, background color, and camera properties.
Additionally the preview image display has been replaced with a 3D view, allowing you reposition the camera just by clicking and dragging!

It's not the most important feature, but I find it really cool.
Although maybe not worth all the work updating the render pipeline to support this...

</div>
<video src="https://files.connorslade.com/Documents/mslicer/Video/interactive-preview.webm" controls loop muted autoplay></video>
</div>

#### Analysis

<div class="row">
<div>

A few new sections were added to the analysis section of the sidebar: Resin Usage, Layer Properties, File Properties, and Defects.

- **Resin Usage** &mdash; Shows the estimated resin volume that will be used when printed.
  This is a conservative estimate, since it doesn't consider the uncured resin that gets wasted during clean / post processing.
  The mass and cost are calculated from the estimated volume and the provided constants: resin density and unit cost.
- **Layer Properties** &mdash; Shows the height (Z-position), run count, and memory usage of the currently previewed layer.
- **File Properties** &mdash; Shows the default slice height (ignoring layers with variable layer height) as well as the size and resolution of the printer it was sliced for.
- **Defects** &mdash; Defective meshes can cause slicing defects, but wont always.
  If you have sliced a defective mesh and it results in slice defects you can see which layers were affected here.

</div>
<img src="/docs/release-notes/v0-10-0/sliced-analysis.png" />
</div>

### Presets and Compatibility

<div class="row">
<div>

The default list of printer presets has been significantly expanded, from 19 in the previous release to 100!
Most of these presets were scraped from my ChituBox installation if they were marked as supporting `.goo` or `.ctb` files.

Additionally printers that are verified to work with mslicer are marked in the UI, see the <i class="ph ph-check-circle"></i> in the screenshot on the right, and on the new [Printer Compatibility](/docs/printer-compatibility) page.
The compatibility page also mentions if specific printers need to be handled differently, like using the new 'Legacy Chitu' output format.

#### Chitu Legacy Format

This is a newly implemented output format!
It's called 'Chitu Legacy' in the UI, but more technically it is an un-encrypted v4 CTB file.
Useful if you, for example, have a Mars 2 Pro (or compatible) printer which can't read the newer encrypted v5 CTB file format.

</div>
<img src="/docs/release-notes/v0-10-0/printer-presets.png" />
</div>

### Project Notes

A new `Notes` panel has been added.
Anything you write in it will be saved into the project file so you can view it next time you open the project.
(See bottom right of image below)

While experimenting with different generation and print settings for my [3D printed phonograph record project](/docs/phonograph-record), I used this panel to keep track of what I changed between each trial.
This way when I have time to work on it again, I'll know where to find my notes.

![](notes.png)

### Memory Usage Tracking

<div class="row">
<div>

High face-count or very detailed meshes will result in high memory usage.
You can now view the memory usage of individual models in `Models` panel or of a slice result in the `Sliced` sidebar.

Additionally the `Workspace` panel got a new 'Memory' section that shows the breakdown of memory usage from: models, history (deleted models), and sliced files.

</div>
<img src="/docs/release-notes/v0-10-0/memory-usage.png" />
</div>

<!--

### Mesh Processing

mslicer now has a built-in mesh repair tool!

- Add button to flip model winding order
- Rename non manifold mesh to defective mesh since some kinds of non-manifold meshes will slice correctly
- Take mesh warning off of non-manifold but sliceable meshes
- Mesh repair tool
  - Unwelded vertices
  - Holes
  - Degenerate and repeated faces
  - Inconsistent winding order
- Allow exporting meshes
- Added phonograph record and height map generator
- Don't save big meshes in history when deleted (configurable threshold)
- Reconstruct mesh with greedy RLE meshing

---

- Allow configuring quick layout min spacing

### Slicing

- Rasterize edges using pixel center sampling ([#38](https://github.com/connorslade/mslicer/pull/38))
- Sliced file diff tool
- Alow changing XY and Z antialiasing separately
- Added test pattern tool for mslicer debugging / testing
- Show slicing speed in layers/sec and triangles/sec
- Detect and report slicing defects (caused by mesh defects)
- Allow setting slice config layer counts in millimeters
- Support generation progress
  - Slice supports
  - Allow clicking on individual supports in the viewport
  - New supports UI
  - Supports track parent model transformations
  - Select multiple supports
  - Delete selected supports
  - Save support config per project
  - Default model lift when supporting automatically



## Bug Fixes

### Performance

Lots of little optimizations have been made to make things run more smoothly when handling high-poly meshes or detailed sliced files.

- Don't block the main thread while encoding layers
- Reduce unnecessary cross-thread memory copies
- Calculate mesh volume asynchronously (helps on models with ~ >10M faces)

---

- Merge lift and retract distance settings.
  In practice they should always be the same and the setting was only supported by `.goo`
- Fix auto-layout's previously incorrect handling of scaled and rotated models
- Fix zero length runs crashing the nanodlp png encoder
- Correctly calculate volume with non-uniform layer height
- Fix the way paths are inflated in the PCB tool
- Allow configuring max allowed circle error in PCB tool
- Update slicer CLI progress reporting ([#39](https://github.com/connorslade/mslicer/pull/39))

'###' NanoDLP

- Fix NanoDLP encoder creating invalid results with horizontal dimensions not divisible by three
  - Note that the expected behavior in this case is undefined by the NanoDLP
    documentation, so files sliced with widths that aren't divisible by three
    may not be loadable by other programs.
- Fix loading of .nanodlp sliced files
- Multi-threaded nanodlp loading
- Multi-threaded output layer encoding (mainly for nanodlp where encoding is quite expensive)

-->

<style>
    i.ph {
        position: relative;
        top: 2px;
    }
</style>
