# encoding: UTF-8
require 'json'

fun_facts = {
  "Alison Jones" =>         "In a previous job, I fed poisonous snakes.",
  "Andrew Hyder" =>         "Apps, maps and raps.",
  "Ariel Kennan" =>         "I once designed a small city in China.",
  "Lou Huang" =>            "I was once kicked out of the SFMOMA for pretending to be an art exhibit.",
  "Ryan Closner" =>         "",
  "Lindsay Ballant" =>      "Ask me about that time when Serena Williams was at my house.",
  "Marcin Wichary" =>       "I once played a piano duet with Bear McCreary.",
  "Laura Meixell" =>        "",
  "Shaunak Kashyap" =>      "I once had to literally wade through murky waters, sometimes chest deep, along with my American boss for about 7 miles to take him to the safety of his hotel.",
  "Ezra Spier" =>           "I spent a summer in college working at a Japanese natural gas company outside of Tokyo.",
  "CJ Bryan" =>             "I rode my moped halfway across the country.",
  "Doneliza Joaquin" =>     "I've run 2 marathons.",
  "Sheila Dugan" =>         "I used to be a puppeteer in high school.",
  "Richa Agarwal" =>        "In an ideal world, I would wear onesies all the time.",
  "Jake Solomon" =>         "I got stitches after being hit in the head with a ping pong paddle.",
  "Cris Cristina" =>        "I'm at the top of the Code for America ping-pong ladder.",
  "Marc K. Hébert" =>       "I worked on an ethnographic research project that involved living for six months in a mobile home park in order to understand how people prepare for natural disasters.",
  "Andy Hull" =>            "",
  "Rebecca Ackerman" =>     "I had malaria and typhoid at the same time.",
  "Moncef Belyamani" =>     "I have a knack for imitating certain brass instruments, animals, and accents.",
  "Sophia Parafina" =>      "I'm a competitive shooter.",
  "Anselm Bradford" =>      "I volunteered at a fruit bat rehabilitation facility where I taught young fruit bats to fly.",
  "Tamara Manik-Perlman" => "I've been to Látrabjarg, Iceland, the westernmost point in Europe.",
  "Dave Guarino" =>         "",
  "Reed Duecy Gibbs" =>     "",
  "Alan Williams" =>        "I worked my first political campaign at 13.",
  "Dan Avery" =>            "I once drove from SF to DC in 2 and a half days. Solo.",
  "Katie Lewis" =>          "I've lived in 9 states."
}

File.open("fun_facts.json","w") do |f|
  f.write(fun_facts.to_json)
end