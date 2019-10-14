{ Constraints = [] : List ../types/Constraint.dhall
, Affinities = [] : List ../types/Affinity.dhall
, Spreads = [] : List ../types/Spread.dhall
, Count = 1
, Migrate = None ../types/Migrate.dhall
, Name = "cache"
, RestartPolicy = None ../types/RestartPolicy.dhall
, ReschedulePolicy = None ../types/ReschedulePolicy.dhall
, Tasks = [ ./Task.dhall ]
, Update = None ../types/Update.dhall
, EphemeralDisk = ./EphemeralDisk.dhall
}
