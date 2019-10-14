{- https://www.nomadproject.io/api/json-jobs.html#resources-1 -}
{ CPU : Natural
, Devices : List ./Device.dhall
, MemoryMB : Natural
, Networks : List ./Network.dhall
}
