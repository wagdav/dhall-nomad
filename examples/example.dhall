{- Dhall representation of the job outputted by `$ nomad init` -}

let nomad = ../package.dhall

let job =
      nomad.Job::{
      , ID = "example"
      , Datacenters = [ "dc1" ]
      , Type = "service"
      , TaskGroups =
          [ nomad.TaskGroup::{
            , Name = "cache"
            , Tasks =
                [ nomad.Task::{
                  , Driver = "docker"
                  , Name = "redis"
                  , Config =
                      { image = "redis:3.2"
                      , port_map = [ toMap { db = 6379 } ]
                      }
                  , Services =
                      [ nomad.Service::{
                        , Name = "redis-cache"
                        , PortLabel = "db"
                        , Tags = [ "global", "cache" ]
                        }
                      ]
                  , Resources =
                      nomad.Resources::{
                      , Networks =
                          [ nomad.Network::{
                            , DynamicPorts = [ { Label = "db", Value = 0 } ]
                            }
                          ]
                      }
                  }
                ]
            }
          ]
      }

in  ../render.dhall job
