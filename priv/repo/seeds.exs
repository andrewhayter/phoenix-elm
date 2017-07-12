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


Platform.Repo.insert!(%Platform.Accounts.Players{display_name: "Andrew Hayter", username: "andrewhayter", score: 10})
Platform.Repo.insert!(%Platform.Accounts.Players{display_name: "Sarah Judge", username: "sarahjudge", score: 20})
Platform.Repo.insert!(%Platform.Accounts.Players{display_name: "Bronco", username: "broncotheheeler", score: 30})
