{- https://www.nomadproject.io/api/json-jobs.html#services -}
{ Name : Text
, Tags : List Text
, Meta : (../Map.dhall).Type Text Text
, CanaryTags : List Text
, PortLabel : Text
, AddressMode : Text
, Checks : List ./Check.dhall
}
