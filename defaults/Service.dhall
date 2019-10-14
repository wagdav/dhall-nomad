{ Name = "redis-cache"
, Tags = [ "global", "cache" ]
, Meta = toMap { meta = "for my service" }
, CanaryTags = [] : List Text
, PortLabel = "db"
, AddressMode = ""
, Checks = [ ./Check.dhall ]
}
