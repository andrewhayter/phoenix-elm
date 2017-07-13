# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Platform.Repo.insert!(%Platform.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


Platform.Repo.insert!(%Platform.Accounts.Players{display_name: "Andrew Hayter", username: "andrewhayter", password: "andrewhayter", score: 10})
Platform.Repo.insert!(%Platform.Accounts.Players{display_name: "Sarah Judge", username: "sarahjudge", password: "sarahjudge", score: 20})
Platform.Repo.insert!(%Platform.Accounts.Players{display_name: "Bronco", username: "broncotheheeler", password: "broncotheheeler", score: 30})

# Games
Platform.Repo.insert!(%Platform.Products.Game{title: "Adventure Game", description: "Adventure game example.", author_id: 1})
Platform.Repo.insert!(%Platform.Products.Game{title: "Driving Game", description: "Driving game example.", author_id: 2})
Platform.Repo.insert!(%Platform.Products.Game{title: "Platform Game", description: "Platform game example.", author_id: 3})
