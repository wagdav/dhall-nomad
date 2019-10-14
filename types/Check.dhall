{ AddressMode : Text
, Args : List Text
, CheckRestart : Optional ./CheckRestart.dhall
, Command : Text
, Header : (../Map.dhall).Type Text (List Text)
, Interval : Natural
, Method : Text
, Name : Text
, Path : Text
, PortLabel : Text
, Protocol : Text
, InitialStatus : Text
, Timeout : Natural
, TLSSkipVerify : Bool
, Type : Text
}
