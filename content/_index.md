---
title: mslicer
description: An open source slicer for masked stereolithography (resin) printers.
template: index.html
---

An open-source slicer for masked stereolithography (resin) printers.
Supports the following output formats: Chitu (.ctb), Elegoo (.goo), NanoDLP (.nanodlp), and Vector (.svg).

<div>
    <img src="/images/frog.png" id="s-1" />
    <img src="/images/supported-dragon.png" id="s-2" />
    <div class="screenshot-selector">
        <label><input type="radio" name="screenshot" id="sb-1" checked /> 1</label>
        <label><input type="radio" name="screenshot" id="sb-2" /> 2</label>
    </div>
</div>



## Features

### Open Source and Private

There aren't really any other open-source slicers for resin printers.
There are a few commercial closed source options available, but they each come with their own issues, like being slow, requiring an account, limiting the number of models you can slice, lacking Linux support, or even having built-in ads.

For this reason I decided to start working on this project to fill that gap in the market.
mslicer will always stay open source (it's licensed under GPL-3.0) and will never include any analytics.

Additionally, in the FDM printing world, there are a bunch of open source slicers, which makes experimentation and research much easier.
But this hasn’t really been possible with resin printing unless you were willing to build an entire slicer from scratch, which while less complicated than for a FDM printer, is still a lot of work.

### Performance

In my [(unscientific) testing](https://files.connorcode.com/Documents/mslicer/speed-chart.pdf), I've found that mslicer is often 20 to 120 times faster than competing slicers (crazy right?).
For most use-cases this is just makes your workflow a little easier, but with super high resolution models mslicer might be the only slicer capable of handling the workload.
This is achieved with multithreading and by slicing directly into the compressed formats used by MSLA file formats.

### Remote Print

Inside of mslicer you can connect to Chitu-mainboard printers on your network and remotely start and monitor prints.

## Installation

### Stable

<div class="downloads" >
    <div>
        <h4><img src="icons/linux-logo-fill.svg">Linux</h4>
        <ul>
            <li><a href="https://github.com/connorslade/mslicer/releases">Binary (x64)</a></li>
            <li><a href="https://flathub.org/en/apps/com.connorcode.mslicer">Flathub</a></li>
            <li><a href="https://search.nixos.org/packages?channel=unstable&query=mslicer&show=mslicer">Nixpkgs</a></li>
        </ul>
    </div>
    <div>
        <h4><img src="icons/windows-logo-fill.svg">Windows</h4>
        <ul>
            <li><a href="https://github.com/connorslade/mslicer/releases">Binary (x64)</a></li>
        </ul>
    </div>
    <div>
        <h4><img src="icons/apple-logo-fill.svg">MacOS</h4>
        <ul>
            <li><a href="https://github.com/connorslade/mslicer/releases">App (Intel)</a></li>
        </ul>
    </div>
</div>

### Development

The latest development builds are available for Linux, Windows, and MacOS on [Github Actions](https://github.com/connorslade/mslicer/actions/workflows/build.yml?query=branch%3Amain%20is%3Asuccess).
Just open the workflow run and download the correct artifact for your system.

### From Source

If you would rather build from source, just have the latest stable version of the [Rust toolchain](https://rustup.rs/) installed and build the binaries you want (mslicer, slicer) as shown below.

```bash
git clone https://github.com/connorslade/mslicer
cd mslicer
cargo build --release --package mslicer
```
