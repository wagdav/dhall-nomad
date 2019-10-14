{- https://www.nomadproject.io/api/json-jobs.html#task -}
{ Artifact : List ./Artifact.dhall
, Config : ./Config.dhall
, Constraints : List ./Constraint.dhall
, Affinities : List ./Affinity.dhall
, Spreads : List ./Spread.dhall
, DispatchPayload : Optional ./DispatchPayload.dhall
, Driver : Text
, Env : (../Map.dhall).Type Text Text
, KillSignal : Text
, KillTimeout : Natural
, Leader : Bool
, LogConfig : Optional ./LogConfig.dhall
, Meta : (../Map.dhall).Type Text Text
, Name : Text
, Services : List ./Service.dhall
, ShutdownDelay : Optional Natural
, Templates : List ./Template.dhall
, User : Text
, Resources : ./Resources.dhall
}
