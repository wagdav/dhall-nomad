{ Artifact = [] : List ../types/Artifact.dhall
, Config = { image = "redis:3.2", port_map = [ toMap { db = 6379 } ] }
, Constraints = [] : List ../types/Constraint.dhall
, Affinities = [] : List ../types/Affinity.dhall
, Spreads = [] : List ../types/Spread.dhall
, DispatchPayload = None ../types/DispatchPayload.dhall
, Driver = "docker"
, Env = (../Map.dhall).empty Text Text
, KillSignal = "SIGINT"
, KillTimeout = 5000000000
, Leader = False
, LogConfig = None ../types/LogConfig.dhall
, Meta = (../Map.dhall).empty Text Text
, Name = "redis"
, Services = [ ./Service.dhall ]
, ShutdownDelay = None Natural
, Templates = [] : List ../types/Template.dhall
, User = ""
, Resources = ./Resources.dhall
}
