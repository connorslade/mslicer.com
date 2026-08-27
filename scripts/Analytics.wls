#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*data=Association@@@Import["/home/connorslade/Programming/mslicer.com/scripts/analytics.json"]*)


(* ::Input:: *)
(*Histogram[FromUnixTime/@IntegerPart[data[[All,"time"]]]]*)


(* ::Input:: *)
(*Block[*)
(*{counts=Counts[data[[All,"os"]]]},*)
(*PieChart[*)
(*counts,*)
(*PlotLabels->Callout[Keys[counts]],*)
(*PlotRange->All,*)
(*ImageSize->Medium*)
(*]*)
(*]*)


(* ::Input:: *)
(*Block[*)
(*{counts=Counts[data[[All,"ip"]]]},*)
(*PieChart[counts,*)
(*PlotLabels->Callout[Keys[counts]],*)
(*PlotRange->All,*)
(*ImageSize->Large*)
(*]*)
(*]*)
