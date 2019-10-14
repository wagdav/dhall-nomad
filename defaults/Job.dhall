{ AllAtOnce = False
, Constraints = [] : List ../types/Constraint.dhall
, Affinities = [] : List ../types/Affinity.dhall
, Spreads = [] : List ../types/Spread.dhall
, TaskGroups = [ ./TaskGroup.dhall ]
, Migrate = ./Migrate.dhall
, Meta = [] : List Text
, Namespace = [] : List Text
, ParametrizedJob = None ../types/ParametrizedJob.dhall
, Priority = 50
, Region = "global"
, Update = ./Update.dhall
, Periodic = None ../types/Periodic.dhall
, ReschedulePolicy = None ../types/ReschedulePolicy.dhall
}
