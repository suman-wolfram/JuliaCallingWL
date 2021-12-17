#!/usr/bin/env wolframscript
(* ::Package:: *)

s=SocketOpen[Automatic,"ZMQ_PAIR"]
Print[s["LastEndpoint"]]
Pause[5]
(*Developer`WriteRawJSONString[<|"Socket"->s["LastEndpoint"]|>,"ConversionRules"->{_Missing|None->Null},"Compact"->True]*)
