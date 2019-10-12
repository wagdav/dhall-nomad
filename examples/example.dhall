{- Dhall representation of the job outputted by `$ nomad init` -}

let types = ../types.dhall

let defaults = ../defaults.dhall

let job = defaults.Job

in  { Job = job }
