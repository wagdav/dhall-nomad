{- https://www.nomadproject.io/api/json-jobs.html#job -}
{ Affinities : List ./Affinity.dhall
, AllAtOnce : Bool
, Constraints : List ./Constraint.dhall
, Datacenters : List Text
, ID : Text
, Meta : List Text
, Migrate : ./Migrate.dhall
, Namespace : List Text
, ParametrizedJob : Optional ./ParametrizedJob.dhall
, Periodic : Optional ./Periodic.dhall
, Priority : Natural
, Region : Text
, ReschedulePolicy : Optional ./ReschedulePolicy.dhall
, Spreads : List ./Spread.dhall
, TaskGroups : List ./TaskGroup.dhall
, Type : Text
, Update : ./Update.dhall
}
