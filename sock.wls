#!/usr/bin/env wolframscript
(* ::Package:: *)

(* s=SocketOpen[Automatic,"ZMQ_PAIR"] *)
(* 
s=SocketOpen[6667,"ZMQ_PAIR"]

SocketListen[s, processData[#DataByteArray, #SourceSocket]&, HandlerFunctionsKeys -> {"DataByteArray", "SourceSocket"}]


Print[s["LastEndpoint"]]
Pause[5]
 *)

(* For[i=0,i<2,i++,
msg = SocketReadMessage[s];
eval = ToExpression[ByteArrayToString[r]];
jsonWrite = 
 Developer`WriteRawJSONString[<|"Output" -> eval|>, 
  "ConversionRules" -> {_Missing | None -> Null}, "Compact" -> True];
BinaryWrite[s, StringToByteArray[jsonWrite]]
] *)
(*Developer`WriteRawJSONString[<|"Socket"->s["LastEndpoint"]|>,"ConversionRules"->{_Missing|None->Null},"Compact"->True]*)


processData[dataByteArray_, sourceSocket_] := 
 Module[{dataString, jsonWrite},
  If[! ByteArrayQ[dataByteArray], Print["ByteArray Error"];];
  dataString = ByteArrayToString@dataByteArray;
  eval = ToExpression[dataString];
  jsonWrite = 
   Developer`WriteRawJSONString[<|"Output" -> eval|>, 
    "ConversionRules" -> {_Missing | None -> Null}, "Compact" -> True];
  BinaryWrite[sourceSocket, StringToByteArray[jsonWrite]]
  
  ]

s = SocketOpen[9002, "ZMQ_PAIR"]

SocketListen[s, processData[#DataByteArray, #SourceSocket] &, 
 HandlerFunctionsKeys -> {"DataByteArray", "SourceSocket"}]