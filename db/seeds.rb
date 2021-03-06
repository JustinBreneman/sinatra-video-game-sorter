ps4 = Platform.create(name: "PS4", manufacturer: "Sony")
ps3 = Platform.create(name: "PS3", manufacturer: "Sony")
xbox360 = Platform.create(name: "X-Box 360", manufacturer: "Microsoft")
xboxone = Platform.create(name: "X-Box One", manufacturer: "Microsoft")
switch = Platform.create(name: "Switch", manufacturer: "Nintendo")
pc = Platform.create(name: "Windows", manufacturer: "Microsoft")
alexa = Platform.create(name: "Alexa", manufacturer: "Amazon")

game1 = pc.games.build(title: "Skyrim", developer: "Bethesda", release_date: "11 November 2011")
game2 = pc.games.build(title: "Skyrim Special Edition", developer: "Bethesda", release_date: "28 October 2016")
game3 = pc.games.build(title: "Warframe", developer: "Digital Extremes", release_date: "25 March 2013")
game4 = ps3.games.build(title: "Skyrim", developer: "Bethesda", release_date: "11 November 2011")
game5 = xbox360.games.build(title: "Skyrim", developer: "Bethesda", release_date: "11 November 2011")
game6 = ps4.games.build(title: "Skyrim Special Edition", developer: "Bethesda", release_date: "28 October 2016")
game7 = ps4.games.build(title: "Warframe", developer: "Digital Extremes", release_date: "15 November 2013")
game8 = xboxone.games.build(title: "Skyrim Special Edition", developer: "Bethesda", release_date: "28 October 2016")
game9 = xboxone.games.build(title: "Warframe", developer: "Digital Extremes", release_date: "02 September 2014")
game10 = switch.games.build(title: "Warframe", developer: "Digital Extremes", release_date: "20 November 2018")
game11 = switch.games.build(title: "Skyrim Special Edition", developer: "Bethesda", release_date: "17 November 2017")
game12 = alexa.games.build(title: "Skyrim Very Special Edition", developer: "Bethesda", release_date: "10 June 2018")

user1 = User.create(username: "user1", email: "user1@email.com", password: "user1")
user2 = User.create(username: "user2", email: "user2@email.com", password: "user2")
user3 = User.create(username: "user3", email: "user3@email.com", password: "user3")
user4 = User.create(username: "user4", email: "user4@email.com", password: "user4")
user5 = User.create(username: "user5", email: "user5@email.com", password: "user5")
user6 = User.create(username: "user6", email: "user6@email.com", password: "user6")
user7 = User.create(username: "user7", email: "user7@email.com", password: "user7")
user8 = User.create(username: "user8", email: "user8@email.com", password: "user8")
user9 = User.create(username: "user9", email: "user9@email.com", password: "user9")
user10 = User.create(username: "user10", email: "user10@email.com", password: "user10")

user1.games = [game1, game3, game7, game9, game11, game12]
user2.games = [game2, game4, game6, game8, game10, game11]
user3.games = [game1, game3, game6, game12]
user4.games = [game3]
user5.games = [game10, game11]
user6.games = [game1, game2, game3]
user7.games = [game5, game8, game9]
user8.games = [game4, game6, game7]
user9.games = [game2, game5, game9, game12]
user10.games = [game1, game2, game3, game4, game5, game6, game7, game8, game9, game10, game11, game12]