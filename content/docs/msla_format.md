---
title: msla_format
description: A Rust library for encoding and decoding common masked stereolithography (MSLA) file formats.
date: 2026-02-25
---

A Rust library for encoding and decoding common masked stereolithography (MSLA) file formats.
The following formats are supported: ChituBox v5 (`.ctb`), Elegoo v3.0 (`.goo`), and NanoDLP (.`nanodlp`).

## Links

- [crates.io](https://crates.io/crates/msla_format)
- [docs.rs](https://docs.rs/msla_format/latest/msla_format)

## How it Works

mslicer has crates for each of the MSLA formats it supports outputting to (see [mslicer/format](https://github.com/connorslade/mslicer/tree/main/format)).
With [a script](https://github.com/connorslade/mslicer/blob/main/dist/msla_format/generate.sh), these crates are combined into a single crate for publishing.
