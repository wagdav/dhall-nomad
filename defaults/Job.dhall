{ AllAtOnce = False
, Constraints = [] : List ../types/Constraint.dhall
, Affinities = [] : List ../types/Affinity.dhall
, Spreads = [] : List ../types/Spread.dhall
, Datacenters = [ "dc1" ]
, TaskGroups = [ ./TaskGroup.dhall ]
, Migrate = ./Migrate.dhall
, Meta = [] : List Text
, Namespace = [] : List Text
, ParametrizedJob = None ../types/ParametrizedJob.dhall
, Priority = 50
, Region = "global"
, Type = "service"
, Update = ./Update.dhall
, Periodic = None ../types/Periodic.dhall
, ReschedulePolicy = None ../types/ReschedulePolicy.dhall
, ID = "example"
}
