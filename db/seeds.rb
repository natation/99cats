gizmo = Cat.create!(
        name: "Gizmo", birth_date: Date.parse("1990-11-11"),
        color: "orange", sex: "M", description: "Old cat."
        )
blackfyre = Cat.create!(
        name: "Blackfyre", birth_date: Date.parse("2003-04-20"),
        color: "black", sex: "M", description: "Is a Targaryen pretender."
        )

bloodraven = Cat.create!(
        name: "Bloodraven", birth_date: Date.parse("2011-06-15"),
        color: "white", sex: "M", description: "A thousand eyes and one."
        )
socks = Cat.create!(
        name: "Socks", birth_date: Date.parse("2003-08-19"),
        color: "blue", sex: "F", description: "The only blue cat in the world."
        )

date1 = Date.parse("2012-11-11")
date2 = Date.parse("2012-12-22")
date3 = Date.parse("2013-01-15")
date4 = Date.parse("2013-05-07")
date5 = Date.parse("2013-09-26")


request1 = CatRentalRequest.create!(cat: gizmo, start_date: date1, end_date: date3)
request1_ol = CatRentalRequest.create!(cat: gizmo, start_date: date1, end_date: date2)
request2 = CatRentalRequest.create!(cat: gizmo, start_date: date4, end_date: date5)
request3 = CatRentalRequest.create!(cat: bloodraven, start_date: date1, end_date: date4)
