#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*data=Association@@@Import["analytics.json"]*)


(* ::Input:: *)
(*(* Filter out my IP*)*)
(*data=Select[data,#["ip"]!="?.?.?.?" &];*)


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
(*{counts=Counts[data[[All,"version"]]]},*)
(*PieChart[counts,*)
(*PlotLabels->Callout[Keys[counts]],*)
(*PlotRange->All*)
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


(* ::Input:: *)
(*Now-FromUnixTime[IntegerPart[Last[data[[All,"time"]]]]]*)


(* ::Input:: *)
(*GeoBubbleChart@Cases[*)
(*{FindGeoLocation[#1],#2}&@@@Tally[data[[All,"ip"]]],*)
(*{geo_,count_}:>geo->count*)
(*]*)


(* ::Input:: *)
(*GeoListPlot[FindGeoLocation/@DeleteDuplicates[data[[All,"ip"]]]]*)
