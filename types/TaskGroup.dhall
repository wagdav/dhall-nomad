{- https://www.nomadproject.io/api/json-jobs.html#task-group -}
{ Affinities : List ./Affinity.dhall
, Constraints : List ./Constraint.dhall
, Count : Natural
, EphemeralDisk : ./EphemeralDisk.dhall
, Migrate : Optional ./Migrate.dhall
, Name : Text
, RestartPolicy : Optional ./RestartPolicy.dhall
, ReschedulePolicy : Optional ./ReschedulePolicy.dhall
, Spreads : List ./Spread.dhall
, Tasks : List ./Task.dhall
, Update : Optional ./Update.dhall
}
