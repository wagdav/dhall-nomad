{ Artifact = [] : List ../types/Artifact.dhall
, Constraints = [] : List ../types/Constraint.dhall
, Affinities = [] : List ../types/Affinity.dhall
, Spreads = [] : List ../types/Spread.dhall
, DispatchPayload = None ../types/DispatchPayload.dhall
, Env = (../Map.dhall).empty Text Text
, KillSignal = "SIGINT"
, KillTimeout = 5000000000
, Leader = False
, LogConfig = None ../types/LogConfig.dhall
, Meta = (../Map.dhall).empty Text Text
, Services = [ ./Service.dhall ]
, ShutdownDelay = None Natural
, Templates = [] : List ../types/Template.dhall
, User = ""
, Resources = ./Resources.dhall
}
