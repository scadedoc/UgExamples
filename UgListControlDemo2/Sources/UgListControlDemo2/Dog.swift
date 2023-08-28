import ScadeKit

class Dog: EObject {

  // please make sure you annotate each variable with the type
  // for SCADE to more identify and leverage the type information
  var id: String
  var name: String
  var ageInYears: Int
  var breed: String

  init(id: String, name: String, breed: String, ageInYears: Int) {
    self.id = id
    self.name = name
    self.breed = breed
    self.ageInYears = ageInYears
  }
}

class Dogs {

  var dogs: [Dog] = []

  init() {

    self.dogs.append(Dog(id: "D001", name: "Bella", breed: "Border Collie", ageInYears: 5))
    self.dogs.append(
      Dog(id: "D002", name: "Max", breed: "West Highland White Terrier", ageInYears: 4))
    self.dogs.append(Dog(id: "D003", name: "Charlie", breed: "German Shepherd Dog", ageInYears: 8))
    self.dogs.append(Dog(id: "D004", name: "Coco", breed: "English Setter", ageInYears: 8))
    self.dogs.append(Dog(id: "D005", name: "Rocky", breed: "Dobermann", ageInYears: 6))
    self.dogs.append(Dog(id: "D006", name: "Lola", breed: "Great Dane", ageInYears: 12))
    self.dogs.append(Dog(id: "D007", name: "Lucky", breed: "Bulldog", ageInYears: 10))
    self.dogs.append(Dog(id: "D008", name: "Lucy", breed: "Border Collie", ageInYears: 9))
    self.dogs.append(Dog(id: "D009", name: "Buddy", breed: "Beagle", ageInYears: 5))
    self.dogs.append(Dog(id: "D010", name: "Daisy", breed: "English Setter", ageInYears: 1))
    self.dogs.append(Dog(id: "D011", name: "Princess", breed: "Miniature Schnauzer", ageInYears: 0))
    self.dogs.append(Dog(id: "D012", name: "Bailey", breed: "German Shepherd Dog", ageInYears: 6))
    self.dogs.append(Dog(id: "D013", name: "Molly", breed: "Yorkshire Terrier", ageInYears: 7))
    self.dogs.append(
      Dog(id: "D014", name: "Teddy", breed: "Dachshund (all varieties)", ageInYears: 12))
    self.dogs.append(Dog(id: "D015", name: "Chloe", breed: "Bernese Mountain Dog", ageInYears: 12))
    self.dogs.append(Dog(id: "D016", name: "Toby", breed: "Shih Tzu", ageInYears: 6))
    self.dogs.append(
      Dog(id: "D017", name: "Luna", breed: "Cavalier King Charles Spaniel", ageInYears: 11))
    self.dogs.append(
      Dog(id: "D018", name: "Jack", breed: "German Shorthaired Pointer", ageInYears: 1))
    self.dogs.append(
      Dog(id: "D019", name: "Maggie", breed: "Staffordshire Bull Terrier", ageInYears: 9))
    self.dogs.append(Dog(id: "D020", name: "Oreo", breed: "Bernese Mountain Dog", ageInYears: 1))
    self.dogs.append(Dog(id: "D021", name: "Sophie", breed: "Poodle", ageInYears: 8))
    self.dogs.append(Dog(id: "D022", name: "Lily", breed: "Labrador Retriever", ageInYears: 2))
    self.dogs.append(Dog(id: "D023", name: "Oliver", breed: "English Setter", ageInYears: 7))
    self.dogs.append(
      Dog(id: "D024", name: "Milo", breed: "English Springer Spaniel", ageInYears: 4))
    self.dogs.append(Dog(id: "D025", name: "Gizmo", breed: "Poodle", ageInYears: 6))
    self.dogs.append(Dog(id: "D026", name: "Lady", breed: "Pug", ageInYears: 8))
    self.dogs.append(
      Dog(id: "D027", name: "Ginger", breed: "West Highland White Terrier", ageInYears: 9))
    self.dogs.append(Dog(id: "D028", name: "Mia", breed: "Poodle", ageInYears: 8))
    self.dogs.append(Dog(id: "D029", name: "Penny", breed: "Shih Tzu", ageInYears: 3))
    self.dogs.append(Dog(id: "D030", name: "Lulu", breed: "Dobermann", ageInYears: 0))
    self.dogs.append(Dog(id: "D031", name: "Ruby", breed: "Chihuahua", ageInYears: 6))
    self.dogs.append(
      Dog(id: "D032", name: "Cooper", breed: "English Cocker Spaniel", ageInYears: 6))
    self.dogs.append(Dog(id: "D033", name: "Cookie", breed: "Golden Retriever", ageInYears: 9))
    self.dogs.append(Dog(id: "D034", name: "Prince", breed: "Poodle", ageInYears: 5))
    self.dogs.append(Dog(id: "D035", name: "Stella", breed: "Labrador Retriever", ageInYears: 4))
    self.dogs.append(Dog(id: "D036", name: "Leo", breed: "Pug", ageInYears: 6))
    self.dogs.append(Dog(id: "D037", name: "Sasha", breed: "Beagle", ageInYears: 12))
    self.dogs.append(Dog(id: "D038", name: "Cody", breed: "Boxer", ageInYears: 5))
    self.dogs.append(Dog(id: "D039", name: "Riley", breed: "Shih Tzu", ageInYears: 2))
    self.dogs.append(
      Dog(id: "D040", name: "Roxy", breed: "Staffordshire Bull Terrier", ageInYears: 4))
    self.dogs.append(Dog(id: "D041", name: "Jake", breed: "Maltese", ageInYears: 3))
    self.dogs.append(Dog(id: "D042", name: "Shadow", breed: "Chihuahua", ageInYears: 12))
    self.dogs.append(Dog(id: "D043", name: "Buster", breed: "Poodle", ageInYears: 1))
    self.dogs.append(Dog(id: "D044", name: "Sadie", breed: "French Bulldog", ageInYears: 10))
    self.dogs.append(
      Dog(id: "D045", name: "Baby", breed: "English Springer Spaniel", ageInYears: 4))
    self.dogs.append(Dog(id: "D046", name: "Oscar", breed: "German Spitz", ageInYears: 3))
    self.dogs.append(
      Dog(id: "D047", name: "Bear", breed: "Cavalier King Charles Spaniel", ageInYears: 4))
    self.dogs.append(
      Dog(id: "D048", name: "Zoe", breed: "Cavalier King Charles Spaniel", ageInYears: 3))
    self.dogs.append(Dog(id: "D049", name: "Rosie", breed: "Poodle", ageInYears: 6))
    self.dogs.append(Dog(id: "D050", name: "Sammy", breed: "Labrador Retriever", ageInYears: 12))
    self.dogs.append(Dog(id: "D051", name: "Zoey", breed: "Great Dane", ageInYears: 7))
    self.dogs.append(
      Dog(id: "D052", name: "Bruno", breed: "West Highland White Terrier", ageInYears: 11))
    self.dogs.append(Dog(id: "D053", name: "Henry", breed: "Labrador Retriever", ageInYears: 8))
    self.dogs.append(Dog(id: "D054", name: "Sandy", breed: "German Shepherd Dog", ageInYears: 10))
    self.dogs.append(Dog(id: "D055", name: "Pepper", breed: "English Setter", ageInYears: 0))
    self.dogs.append(Dog(id: "D056", name: "Duke", breed: "Shetland Sheepdog", ageInYears: 4))
    self.dogs.append(
      Dog(id: "D057", name: "Sparky", breed: "Staffordshire Bull Terrier", ageInYears: 12))
    self.dogs.append(Dog(id: "D058", name: "Blue", breed: "Chihuahua", ageInYears: 4))
    self.dogs.append(Dog(id: "D059", name: "Dexter", breed: "Shih Tzu", ageInYears: 8))
    self.dogs.append(Dog(id: "D060", name: "Gracie", breed: "Yorkshire Terrier", ageInYears: 2))
    self.dogs.append(
      Dog(id: "D061", name: "King", breed: "Staffordshire Bull Terrier", ageInYears: 11))
    self.dogs.append(Dog(id: "D062", name: "Angel", breed: "Boxer", ageInYears: 3))
    self.dogs.append(Dog(id: "D063", name: "Bentley", breed: "Rottweiler", ageInYears: 12))
    self.dogs.append(Dog(id: "D064", name: "Rusty", breed: "Great Dane", ageInYears: 9))
    self.dogs.append(Dog(id: "D065", name: "Sam", breed: "Poodle", ageInYears: 11))
    self.dogs.append(Dog(id: "D066", name: "Honey", breed: "Pug", ageInYears: 8))
    self.dogs.append(
      Dog(id: "D067", name: "Rex", breed: "Dachshund (all varieties)", ageInYears: 9))
    self.dogs.append(Dog(id: "D068", name: "Romeo", breed: "Shih Tzu", ageInYears: 12))
    self.dogs.append(
      Dog(id: "D069", name: "Brooklyn", breed: "Cavalier King Charles Spaniel", ageInYears: 12))
    self.dogs.append(Dog(id: "D070", name: "Zeus", breed: "Labrador Retriever", ageInYears: 1))
    self.dogs.append(Dog(id: "D071", name: "Peanut", breed: "Beagle", ageInYears: 1))
    self.dogs.append(Dog(id: "D072", name: "Mickey", breed: "Shetland Sheepdog", ageInYears: 6))
    self.dogs.append(Dog(id: "D073", name: "Louie", breed: "Rottweiler", ageInYears: 7))
    self.dogs.append(Dog(id: "D074", name: "Benji", breed: "Shih Tzu", ageInYears: 1))
    self.dogs.append(Dog(id: "D075", name: "Brownie", breed: "French Bulldog", ageInYears: 6))
    self.dogs.append(Dog(id: "D076", name: "Diamond", breed: "Labrador Retriever", ageInYears: 11))
    self.dogs.append(Dog(id: "D077", name: "Rocco", breed: "Yorkshire Terrier", ageInYears: 10))
    self.dogs.append(
      Dog(id: "D078", name: "Winston", breed: "Dachshund (all varieties)", ageInYears: 7))
    self.dogs.append(Dog(id: "D079", name: "Scout", breed: "Great Dane", ageInYears: 12))
    self.dogs.append(Dog(id: "D080", name: "Harley", breed: "Rottweiler", ageInYears: 5))
    self.dogs.append(Dog(id: "D081", name: "Frankie", breed: "Miniature Schnauzer", ageInYears: 7))
    self.dogs.append(Dog(id: "D082", name: "Emma", breed: "Shih Tzu", ageInYears: 4))
    self.dogs.append(Dog(id: "D083", name: "Missy", breed: "Pug", ageInYears: 3))
    self.dogs.append(Dog(id: "D084", name: "Jasper", breed: "Border Collie", ageInYears: 2))
    self.dogs.append(
      Dog(id: "D085", name: "Simba", breed: "Staffordshire Bull Terrier", ageInYears: 4))
    self.dogs.append(Dog(id: "D086", name: "Lexi", breed: "Rottweiler", ageInYears: 12))
    self.dogs.append(Dog(id: "D087", name: "Tyson", breed: "English Cocker Spaniel", ageInYears: 6))
    self.dogs.append(Dog(id: "D088", name: "Jackson", breed: "Bulldog", ageInYears: 7))
    self.dogs.append(Dog(id: "D089", name: "Layla", breed: "Poodle", ageInYears: 0))
    self.dogs.append(
      Dog(id: "D090", name: "Snoopy", breed: "English Springer Spaniel", ageInYears: 2))
    self.dogs.append(Dog(id: "D091", name: "Maximus", breed: "Great Dane", ageInYears: 12))
    self.dogs.append(Dog(id: "D092", name: "Madison", breed: "Border Collie", ageInYears: 7))
    self.dogs.append(
      Dog(id: "D093", name: "George", breed: "English Cocker Spaniel", ageInYears: 6))
    self.dogs.append(
      Dog(id: "D094", name: "Lilly", breed: "German Shorthaired Pointer", ageInYears: 0))
    self.dogs.append(Dog(id: "D095", name: "Murphy", breed: "Great Dane", ageInYears: 5))
    self.dogs.append(
      Dog(id: "D096", name: "Nala", breed: "Dachshund (all varieties)", ageInYears: 11))
    self.dogs.append(Dog(id: "D097", name: "Precious", breed: "Rottweiler", ageInYears: 3))
    self.dogs.append(Dog(id: "D098", name: "Tucker", breed: "Pug", ageInYears: 9))
    self.dogs.append(Dog(id: "D099", name: "Joey", breed: "Pug", ageInYears: 2))
    self.dogs.append(Dog(id: "D100", name: "Olive", breed: "Labrador Retriever", ageInYears: 3))
    self.dogs.append(Dog(id: "D101", name: "Marley", breed: "Shetland Sheepdog", ageInYears: 9))
    self.dogs.append(Dog(id: "D102", name: "Maya", breed: "Yorkshire Terrier", ageInYears: 9))
    self.dogs.append(Dog(id: "D103", name: "Hudson", breed: "German Spitz", ageInYears: 4))
    self.dogs.append(Dog(id: "D104", name: "Gigi", breed: "Border Collie", ageInYears: 10))
    self.dogs.append(Dog(id: "D105", name: "Gus", breed: "Shih Tzu", ageInYears: 8))
    self.dogs.append(
      Dog(id: "D106", name: "Abby", breed: "Dachshund (all varieties)", ageInYears: 5))
    self.dogs.append(Dog(id: "D107", name: "Bandit", breed: "Maltese", ageInYears: 9))
    self.dogs.append(Dog(id: "D108", name: "Fluffy", breed: "German Spitz", ageInYears: 3))
    self.dogs.append(Dog(id: "D109", name: "Jax", breed: "Rottweiler", ageInYears: 9))
    self.dogs.append(Dog(id: "D110", name: "Casey", breed: "Shetland Sheepdog", ageInYears: 4))
    self.dogs.append(
      Dog(id: "D111", name: "Chester", breed: "Bernese Mountain Dog", ageInYears: 11))
    self.dogs.append(Dog(id: "D112", name: "Baxter", breed: "German Spitz", ageInYears: 9))
    self.dogs.append(Dog(id: "D113", name: "Spike", breed: "Chihuahua", ageInYears: 10))
    self.dogs.append(Dog(id: "D114", name: "Mimi", breed: "Yorkshire Terrier", ageInYears: 10))
    self.dogs.append(Dog(id: "D115", name: "Pebbles", breed: "Miniature Schnauzer", ageInYears: 12))
    self.dogs.append(Dog(id: "D116", name: "Diesel", breed: "Shetland Sheepdog", ageInYears: 8))
    self.dogs.append(Dog(id: "D117", name: "Minnie", breed: "Yorkshire Terrier", ageInYears: 3))
    self.dogs.append(
      Dog(id: "D118", name: "Benny", breed: "German Shorthaired Pointer", ageInYears: 6))
    self.dogs.append(
      Dog(id: "D119", name: "Ellie", breed: "Cavalier King Charles Spaniel", ageInYears: 6))
    self.dogs.append(Dog(id: "D120", name: "Ella", breed: "English Cocker Spaniel", ageInYears: 11))
    self.dogs.append(Dog(id: "D121", name: "Mocha", breed: "German Spitz", ageInYears: 10))
    self.dogs.append(Dog(id: "D122", name: "Chico", breed: "Bernese Mountain Dog", ageInYears: 6))
    self.dogs.append(Dog(id: "D123", name: "Ace", breed: "Miniature Schnauzer", ageInYears: 6))
    self.dogs.append(
      Dog(id: "D124", name: "Hunter", breed: "West Highland White Terrier", ageInYears: 10))
    self.dogs.append(
      Dog(id: "D125", name: "Chewy", breed: "Dachshund (all varieties)", ageInYears: 7))
    self.dogs.append(
      Dog(id: "D126", name: "Harry", breed: "West Highland White Terrier", ageInYears: 12))
    self.dogs.append(Dog(id: "D127", name: "Hazel", breed: "Chihuahua", ageInYears: 10))
    self.dogs.append(Dog(id: "D128", name: "Roxie", breed: "Great Dane", ageInYears: 5))
    self.dogs.append(Dog(id: "D129", name: "Belle", breed: "Labrador Retriever", ageInYears: 5))
    self.dogs.append(Dog(id: "D130", name: "Holly", breed: "Shetland Sheepdog", ageInYears: 1))
    self.dogs.append(Dog(id: "D131", name: "Nina", breed: "Dobermann", ageInYears: 9))
    self.dogs.append(Dog(id: "D132", name: "Remy", breed: "Border Collie", ageInYears: 10))
    self.dogs.append(Dog(id: "D133", name: "Samantha", breed: "Chihuahua", ageInYears: 1))
    self.dogs.append(Dog(id: "D134", name: "Phoebe", breed: "Chihuahua", ageInYears: 6))
    self.dogs.append(Dog(id: "D135", name: "Foxy", breed: "Poodle", ageInYears: 12))
    self.dogs.append(Dog(id: "D136", name: "Sugar", breed: "German Shepherd Dog", ageInYears: 5))
    self.dogs.append(Dog(id: "D137", name: "Otis", breed: "German Spitz", ageInYears: 11))
    self.dogs.append(Dog(id: "D138", name: "Ziggy", breed: "Pug", ageInYears: 7))
    self.dogs.append(Dog(id: "D139", name: "Nena", breed: "German Shepherd Dog", ageInYears: 0))
    self.dogs.append(Dog(id: "D140", name: "Elvis", breed: "Miniature Schnauzer", ageInYears: 3))
    self.dogs.append(Dog(id: "D141", name: "Happy", breed: "German Spitz", ageInYears: 0))
    self.dogs.append(
      Dog(id: "D142", name: "Rufus", breed: "German Shorthaired Pointer", ageInYears: 1))
    self.dogs.append(
      Dog(id: "D143", name: "Brandy", breed: "English Springer Spaniel", ageInYears: 7))
    self.dogs.append(Dog(id: "D144", name: "Cocoa", breed: "Boxer", ageInYears: 10))
    self.dogs.append(
      Dog(id: "D145", name: "Ollie", breed: "Cavalier King Charles Spaniel", ageInYears: 10))
    self.dogs.append(Dog(id: "D146", name: "Archie", breed: "English Setter", ageInYears: 0))
    self.dogs.append(Dog(id: "D147", name: "Chase", breed: "Chihuahua", ageInYears: 5))
    self.dogs.append(
      Dog(id: "D148", name: "Petey", breed: "Staffordshire Bull Terrier", ageInYears: 1))
    self.dogs.append(Dog(id: "D149", name: "Tiger", breed: "Rottweiler", ageInYears: 12))
    self.dogs.append(Dog(id: "D150", name: "Dakota", breed: "French Bulldog", ageInYears: 1))
    self.dogs.append(
      Dog(id: "D151", name: "Hershey", breed: "German Shorthaired Pointer", ageInYears: 8))
    self.dogs.append(Dog(id: "D152", name: "", breed: "Maltese", ageInYears: 8))
    self.dogs.append(Dog(id: "D153", name: "Rudy", breed: "Miniature Schnauzer", ageInYears: 0))
    self.dogs.append(Dog(id: "D154", name: "Samson", breed: "Great Dane", ageInYears: 5))
    self.dogs.append(Dog(id: "D155", name: "Trixie", breed: "Golden Retriever", ageInYears: 5))
    self.dogs.append(Dog(id: "D156", name: "Luke", breed: "Pug", ageInYears: 6))
    self.dogs.append(Dog(id: "D157", name: "Penelope", breed: "Dobermann", ageInYears: 4))
    self.dogs.append(
      Dog(id: "D158", name: "Smokey", breed: "Dachshund (all varieties)", ageInYears: 1))
    self.dogs.append(Dog(id: "D159", name: "Sunny", breed: "Chihuahua", ageInYears: 4))
    self.dogs.append(
      Dog(id: "D160", name: "Chance", breed: "Dachshund (all varieties)", ageInYears: 1))
    self.dogs.append(
      Dog(id: "D161", name: "Loki", breed: "English Springer Spaniel", ageInYears: 0))
    self.dogs.append(Dog(id: "D162", name: "Gucci", breed: "Golden Retriever", ageInYears: 4))
    self.dogs.append(Dog(id: "D163", name: "Winnie", breed: "Rottweiler", ageInYears: 6))
    self.dogs.append(
      Dog(id: "D164", name: "Apollo", breed: "English Springer Spaniel", ageInYears: 9))
    self.dogs.append(
      Dog(id: "D165", name: "Biscuit", breed: "Cavalier King Charles Spaniel", ageInYears: 4))
    self.dogs.append(Dog(id: "D166", name: "Millie", breed: "Yorkshire Terrier", ageInYears: 5))
    self.dogs.append(Dog(id: "D167", name: "Mr.", breed: "Pug", ageInYears: 9))
    self.dogs.append(Dog(id: "D168", name: "Champ", breed: "Shetland Sheepdog", ageInYears: 9))
    self.dogs.append(Dog(id: "D169", name: "Cosmo", breed: "Chihuahua", ageInYears: 7))
    self.dogs.append(Dog(id: "D170", name: "Parker", breed: "French Bulldog", ageInYears: 11))
    self.dogs.append(Dog(id: "D171", name: "Annie", breed: "French Bulldog", ageInYears: 5))
    self.dogs.append(Dog(id: "D172", name: "Boomer", breed: "Labrador Retriever", ageInYears: 2))
    self.dogs.append(
      Dog(id: "D173", name: "Bruce", breed: "German Shorthaired Pointer", ageInYears: 0))
    self.dogs.append(Dog(id: "D174", name: "Kiki", breed: "Dobermann", ageInYears: 0))
    self.dogs.append(Dog(id: "D175", name: "Casper", breed: "Bulldog", ageInYears: 7))
    self.dogs.append(Dog(id: "D176", name: "Jackie", breed: "Bulldog", ageInYears: 10))
    self.dogs.append(Dog(id: "D177", name: "Roscoe", breed: "Great Dane", ageInYears: 7))
    self.dogs.append(Dog(id: "D178", name: "Scooby", breed: "Beagle", ageInYears: 0))
    self.dogs.append(Dog(id: "D179", name: "Sonny", breed: "Golden Retriever", ageInYears: 3))
    self.dogs.append(
      Dog(id: "D180", name: "Junior", breed: "Cavalier King Charles Spaniel", ageInYears: 7))
    self.dogs.append(Dog(id: "D181", name: "Piper", breed: "Beagle", ageInYears: 0))
    self.dogs.append(
      Dog(id: "D182", name: "Thor", breed: "West Highland White Terrier", ageInYears: 12))
    self.dogs.append(Dog(id: "D183", name: "Misty", breed: "Poodle", ageInYears: 8))
    self.dogs.append(
      Dog(id: "D184", name: "Bobby", breed: "Staffordshire Bull Terrier", ageInYears: 4))
    self.dogs.append(Dog(id: "D185", name: "Dixie", breed: "Labrador Retriever", ageInYears: 5))
    self.dogs.append(Dog(id: "D186", name: "Snowball", breed: "Poodle", ageInYears: 7))
    self.dogs.append(Dog(id: "D187", name: "Willow", breed: "Miniature Schnauzer", ageInYears: 7))
    self.dogs.append(Dog(id: "D188", name: "Bosco", breed: "Rottweiler", ageInYears: 2))
    self.dogs.append(
      Dog(id: "D189", name: "Muffin", breed: "Cavalier King Charles Spaniel", ageInYears: 9))
    self.dogs.append(Dog(id: "D190", name: "Nikki", breed: "Shetland Sheepdog", ageInYears: 6))
    self.dogs.append(
      Dog(id: "D191", name: "Onyx", breed: "Cavalier King Charles Spaniel", ageInYears: 4))
    self.dogs.append(Dog(id: "D192", name: "Sheba", breed: "Shetland Sheepdog", ageInYears: 2))
    self.dogs.append(Dog(id: "D193", name: "Fiona", breed: "Poodle", ageInYears: 6))
    self.dogs.append(Dog(id: "D194", name: "Lucas", breed: "Bulldog", ageInYears: 1))
    self.dogs.append(
      Dog(id: "D195", name: "Bonnie", breed: "Dachshund (all varieties)", ageInYears: 0))
    self.dogs.append(Dog(id: "D196", name: "Little", breed: "Labrador Retriever", ageInYears: 9))
    self.dogs.append(Dog(id: "D197", name: "Logan", breed: "English Setter", ageInYears: 5))
    self.dogs.append(Dog(id: "D198", name: "Niko", breed: "Maltese", ageInYears: 6))
    self.dogs.append(Dog(id: "D199", name: "Katie", breed: "Miniature Schnauzer", ageInYears: 11))
    self.dogs.append(
      Dog(id: "D200", name: "Maddie", breed: "German Shorthaired Pointer", ageInYears: 12))
    self.dogs.append(Dog(id: "D201", name: "Simon", breed: "Bulldog", ageInYears: 11))
    self.dogs.append(Dog(id: "D202", name: "Sophia", breed: "Golden Retriever", ageInYears: 10))
    self.dogs.append(Dog(id: "D203", name: "Kobe", breed: "Maltese", ageInYears: 7))
    self.dogs.append(Dog(id: "D204", name: "Izzy", breed: "French Bulldog", ageInYears: 9))
    self.dogs.append(Dog(id: "D205", name: "Maxwell", breed: "Miniature Schnauzer", ageInYears: 7))
    self.dogs.append(Dog(id: "D206", name: "Sir", breed: "Yorkshire Terrier", ageInYears: 8))
    self.dogs.append(Dog(id: "D207", name: "Star", breed: "English Cocker Spaniel", ageInYears: 9))
    self.dogs.append(
      Dog(id: "D208", name: "Betty", breed: "West Highland White Terrier", ageInYears: 0))
    self.dogs.append(
      Dog(id: "D209", name: "Dino", breed: "West Highland White Terrier", ageInYears: 4))
    self.dogs.append(
      Dog(id: "D210", name: "Boo", breed: "Cavalier King Charles Spaniel", ageInYears: 1))
    self.dogs.append(Dog(id: "D211", name: "Jessie", breed: "French Bulldog", ageInYears: 3))
    self.dogs.append(Dog(id: "D212", name: "Mikey", breed: "German Shepherd Dog", ageInYears: 10))
    self.dogs.append(Dog(id: "D213", name: "Hank", breed: "Yorkshire Terrier", ageInYears: 2))
    self.dogs.append(Dog(id: "D214", name: "Nico", breed: "Border Collie", ageInYears: 8))
    self.dogs.append(Dog(id: "D215", name: "Patches", breed: "English Setter", ageInYears: 11))
    self.dogs.append(Dog(id: "D216", name: "Mason", breed: "Boxer", ageInYears: 3))
    self.dogs.append(Dog(id: "D217", name: "Sky", breed: "Labrador Retriever", ageInYears: 4))
    self.dogs.append(Dog(id: "D218", name: "Spanky", breed: "Shetland Sheepdog", ageInYears: 8))
    self.dogs.append(Dog(id: "D219", name: "Storm", breed: "Shetland Sheepdog", ageInYears: 10))
    self.dogs.append(Dog(id: "D220", name: "Cleo", breed: "Miniature Schnauzer", ageInYears: 11))
    self.dogs.append(Dog(id: "D221", name: "Lexie", breed: "Pug", ageInYears: 4))
    self.dogs.append(Dog(id: "D222", name: "Luca", breed: "Dobermann", ageInYears: 7))
    self.dogs.append(Dog(id: "D223", name: "Monty", breed: "Dobermann", ageInYears: 6))
    self.dogs.append(Dog(id: "D224", name: "Beau", breed: "Border Collie", ageInYears: 5))
    self.dogs.append(Dog(id: "D225", name: "Midnight", breed: "French Bulldog", ageInYears: 6))
    self.dogs.append(Dog(id: "D226", name: "Otto", breed: "German Spitz", ageInYears: 9))
    self.dogs.append(Dog(id: "D227", name: "Callie", breed: "Maltese", ageInYears: 12))
    self.dogs.append(Dog(id: "D228", name: "Paris", breed: "Miniature Schnauzer", ageInYears: 8))
    self.dogs.append(Dog(id: "D229", name: "Rambo", breed: "Miniature Schnauzer", ageInYears: 12))
    self.dogs.append(Dog(id: "D230", name: "Snow", breed: "French Bulldog", ageInYears: 5))
    self.dogs.append(Dog(id: "D231", name: "Wally", breed: "Yorkshire Terrier", ageInYears: 3))
    self.dogs.append(Dog(id: "D232", name: "Charley", breed: "Shih Tzu", ageInYears: 11))
    self.dogs.append(Dog(id: "D233", name: "Dolly", breed: "German Shepherd Dog", ageInYears: 3))
    self.dogs.append(Dog(id: "D234", name: "Ozzy", breed: "Chihuahua", ageInYears: 7))
    self.dogs.append(
      Dog(id: "D235", name: "Tiny", breed: "German Shorthaired Pointer", ageInYears: 8))
    self.dogs.append(
      Dog(id: "D236", name: "Amber", breed: "Staffordshire Bull Terrier", ageInYears: 3))
    self.dogs.append(Dog(id: "D237", name: "Isabella", breed: "Golden Retriever", ageInYears: 1))
    self.dogs.append(
      Dog(id: "D238", name: "Yogi", breed: "West Highland White Terrier", ageInYears: 12))
    self.dogs.append(Dog(id: "D239", name: "Barney", breed: "Poodle", ageInYears: 5))
    self.dogs.append(Dog(id: "D240", name: "Brady", breed: "Rottweiler", ageInYears: 6))
    self.dogs.append(Dog(id: "D241", name: "Chelsea", breed: "German Spitz", ageInYears: 3))
    self.dogs.append(Dog(id: "D242", name: "Xena", breed: "Yorkshire Terrier", ageInYears: 0))
    self.dogs.append(
      Dog(id: "D243", name: "Brody", breed: "English Springer Spaniel", ageInYears: 11))
    self.dogs.append(
      Dog(id: "D244", name: "Hercules", breed: "Bernese Mountain Dog", ageInYears: 6))
    self.dogs.append(Dog(id: "D245", name: "Miles", breed: "Yorkshire Terrier", ageInYears: 5))
    self.dogs.append(Dog(id: "D246", name: "Scrappy", breed: "Yorkshire Terrier", ageInYears: 7))
    self.dogs.append(Dog(id: "D247", name: "Taz", breed: "German Spitz", ageInYears: 2))
    self.dogs.append(
      Dog(id: "D248", name: "Billy", breed: "English Springer Spaniel", ageInYears: 8))
    self.dogs.append(Dog(id: "D249", name: "Cassie", breed: "Chihuahua", ageInYears: 7))
    self.dogs.append(Dog(id: "D250", name: "Fred", breed: "Miniature Schnauzer", ageInYears: 8))
    self.dogs.append(Dog(id: "D251", name: "Jojo", breed: "Shetland Sheepdog", ageInYears: 7))
    self.dogs.append(Dog(id: "D252", name: "Peaches", breed: "English Setter", ageInYears: 1))
    self.dogs.append(Dog(id: "D253", name: "Ricky", breed: "Border Collie", ageInYears: 5))
    self.dogs.append(
      Dog(id: "D254", name: "Spencer", breed: "English Cocker Spaniel", ageInYears: 5))
    self.dogs.append(Dog(id: "D255", name: "Delilah", breed: "Border Collie", ageInYears: 9))
    self.dogs.append(Dog(id: "D256", name: "Hugo", breed: "Golden Retriever", ageInYears: 2))
    self.dogs.append(Dog(id: "D257", name: "Chanel", breed: "Shih Tzu", ageInYears: 5))
    self.dogs.append(Dog(id: "D258", name: "Cinnamon", breed: "Boxer", ageInYears: 6))
    self.dogs.append(Dog(id: "D259", name: "Dylan", breed: "Bernese Mountain Dog", ageInYears: 7))
    self.dogs.append(Dog(id: "D260", name: "Louis", breed: "Border Collie", ageInYears: 9))
    self.dogs.append(Dog(id: "D261", name: "Mochi", breed: "Bulldog", ageInYears: 6))
    self.dogs.append(Dog(id: "D262", name: "Olivia", breed: "Shetland Sheepdog", ageInYears: 9))
    self.dogs.append(Dog(id: "D263", name: "Shea", breed: "Bulldog", ageInYears: 9))
    self.dogs.append(Dog(id: "D264", name: "Jasmine", breed: "Golden Retriever", ageInYears: 12))
    self.dogs.append(Dog(id: "D265", name: "Walter", breed: "Great Dane", ageInYears: 2))
    self.dogs.append(Dog(id: "D266", name: "Ava", breed: "Pug", ageInYears: 2))
    self.dogs.append(Dog(id: "D267", name: "Bo", breed: "Shih Tzu", ageInYears: 3))
    self.dogs.append(Dog(id: "D268", name: "Moose", breed: "Border Collie", ageInYears: 12))
    self.dogs.append(Dog(id: "D269", name: "Sebastian", breed: "Dobermann", ageInYears: 3))
    self.dogs.append(Dog(id: "D270", name: "Willie", breed: "Golden Retriever", ageInYears: 1))
    self.dogs.append(Dog(id: "D271", name: "Bebe", breed: "Chihuahua", ageInYears: 4))
    self.dogs.append(Dog(id: "D272", name: "Brutus", breed: "Miniature Schnauzer", ageInYears: 0))
    self.dogs.append(
      Dog(id: "D273", name: "Dusty", breed: "English Springer Spaniel", ageInYears: 9))
    self.dogs.append(Dog(id: "D274", name: "Finn", breed: "Poodle", ageInYears: 1))
    self.dogs.append(Dog(id: "D275", name: "Sally", breed: "Pug", ageInYears: 1))
    self.dogs.append(Dog(id: "D276", name: "Andy", breed: "Bernese Mountain Dog", ageInYears: 2))
    self.dogs.append(Dog(id: "D277", name: "Chewie", breed: "Bernese Mountain Dog", ageInYears: 3))
    self.dogs.append(
      Dog(id: "D278", name: "Pumpkin", breed: "German Shorthaired Pointer", ageInYears: 9))
    self.dogs.append(Dog(id: "D279", name: "Cash", breed: "Bernese Mountain Dog", ageInYears: 7))
    self.dogs.append(Dog(id: "D280", name: "Charlotte", breed: "Golden Retriever", ageInYears: 4))
    self.dogs.append(Dog(id: "D281", name: "Dante", breed: "Beagle", ageInYears: 8))
    self.dogs.append(
      Dog(id: "D282", name: "Eli", breed: "Dachshund (all varieties)", ageInYears: 4))
    self.dogs.append(Dog(id: "D283", name: "Josie", breed: "Pug", ageInYears: 9))
    self.dogs.append(Dog(id: "D284", name: "Sassy", breed: "Boxer", ageInYears: 4))
    self.dogs.append(Dog(id: "D285", name: "Alfie", breed: "Border Collie", ageInYears: 11))
    self.dogs.append(Dog(id: "D286", name: "Bambi", breed: "German Shepherd Dog", ageInYears: 12))
    self.dogs.append(Dog(id: "D287", name: "Eddie", breed: "Bulldog", ageInYears: 3))
    self.dogs.append(Dog(id: "D288", name: "Koko", breed: "Labrador Retriever", ageInYears: 12))
    self.dogs.append(Dog(id: "D289", name: "Mabel", breed: "Shetland Sheepdog", ageInYears: 1))
    self.dogs.append(Dog(id: "D290", name: "Polo", breed: "French Bulldog", ageInYears: 2))
    self.dogs.append(Dog(id: "D291", name: "Chip", breed: "Poodle", ageInYears: 8))
    self.dogs.append(Dog(id: "D292", name: "Jesse", breed: "Beagle", ageInYears: 3))
    self.dogs.append(Dog(id: "D293", name: "Shelby", breed: "Border Collie", ageInYears: 6))
    self.dogs.append(
      Dog(id: "D294", name: "Watson", breed: "West Highland White Terrier", ageInYears: 12))
    self.dogs.append(Dog(id: "D295", name: "Blu", breed: "Beagle", ageInYears: 8))
    self.dogs.append(Dog(id: "D296", name: "Diva", breed: "Miniature Schnauzer", ageInYears: 5))
    self.dogs.append(Dog(id: "D297", name: "Ernie", breed: "German Shepherd Dog", ageInYears: 7))
    self.dogs.append(Dog(id: "D298", name: "Miss", breed: "Maltese", ageInYears: 8))
    self.dogs.append(Dog(id: "D299", name: "Mugsy", breed: "Border Collie", ageInYears: 11))
    self.dogs.append(Dog(id: "D300", name: "Pepe", breed: "English Cocker Spaniel", ageInYears: 2))
    self.dogs.append(Dog(id: "D301", name: "Tank", breed: "Great Dane", ageInYears: 9))
    self.dogs.append(Dog(id: "D302", name: "Tony", breed: "Labrador Retriever", ageInYears: 2))
    self.dogs.append(Dog(id: "D303", name: "Athena", breed: "Bernese Mountain Dog", ageInYears: 6))
    self.dogs.append(Dog(id: "D304", name: "Lacey", breed: "Golden Retriever", ageInYears: 8))
    self.dogs.append(
      Dog(id: "D305", name: "Skippy", breed: "German Shorthaired Pointer", ageInYears: 12))
    self.dogs.append(Dog(id: "D306", name: "Baci", breed: "Poodle", ageInYears: 9))
    self.dogs.append(Dog(id: "D307", name: "Bobo", breed: "Boxer", ageInYears: 5))
    self.dogs.append(Dog(id: "D308", name: "Chocolate", breed: "Yorkshire Terrier", ageInYears: 9))
    self.dogs.append(Dog(id: "D309", name: "Diego", breed: "Shih Tzu", ageInYears: 7))
    self.dogs.append(Dog(id: "D310", name: "Sydney", breed: "Chihuahua", ageInYears: 6))
    self.dogs.append(Dog(id: "D311", name: "Benjamin", breed: "Dobermann", ageInYears: 9))
    self.dogs.append(Dog(id: "D312", name: "Enzo", breed: "Shih Tzu", ageInYears: 5))
    self.dogs.append(
      Dog(id: "D313", name: "Guinness", breed: "Bernese Mountain Dog", ageInYears: 10))
    self.dogs.append(Dog(id: "D314", name: "Jerry", breed: "English Cocker Spaniel", ageInYears: 8))
    self.dogs.append(Dog(id: "D315", name: "Jimmy", breed: "English Cocker Spaniel", ageInYears: 4))
    self.dogs.append(Dog(id: "D316", name: "Juno", breed: "Bernese Mountain Dog", ageInYears: 11))
    self.dogs.append(
      Dog(id: "D317", name: "Reggie", breed: "English Cocker Spaniel", ageInYears: 6))
    self.dogs.append(Dog(id: "D318", name: "Scruffy", breed: "Great Dane", ageInYears: 3))
    self.dogs.append(Dog(id: "D319", name: "Stanley", breed: "Border Collie", ageInYears: 9))
    self.dogs.append(Dog(id: "D320", name: "Tiffany", breed: "Labrador Retriever", ageInYears: 4))
    self.dogs.append(Dog(id: "D321", name: "Tommy", breed: "French Bulldog", ageInYears: 7))
    self.dogs.append(Dog(id: "D322", name: "Alex", breed: "French Bulldog", ageInYears: 10))
    self.dogs.append(
      Dog(id: "D323", name: "Blackie", breed: "English Cocker Spaniel", ageInYears: 3))
    self.dogs.append(Dog(id: "D324", name: "Clyde", breed: "Bulldog", ageInYears: 5))
    self.dogs.append(Dog(id: "D325", name: "Frank", breed: "Shih Tzu", ageInYears: 9))
    self.dogs.append(Dog(id: "D326", name: "Goldie", breed: "Rottweiler", ageInYears: 6))
    self.dogs.append(Dog(id: "D327", name: "Heidi", breed: "Labrador Retriever", ageInYears: 5))
    self.dogs.append(Dog(id: "D328", name: "Ozzie", breed: "Bulldog", ageInYears: 5))
    self.dogs.append(Dog(id: "D329", name: "Cali", breed: "Poodle", ageInYears: 2))
    self.dogs.append(Dog(id: "D330", name: "Cindy", breed: "Great Dane", ageInYears: 7))
    self.dogs.append(Dog(id: "D331", name: "Grace", breed: "Miniature Schnauzer", ageInYears: 5))
    self.dogs.append(Dog(id: "D332", name: "Lila", breed: "Boxer", ageInYears: 7))
    self.dogs.append(Dog(id: "D333", name: "Tina", breed: "Yorkshire Terrier", ageInYears: 4))
    self.dogs.append(Dog(id: "D334", name: "Yoshi", breed: "German Shepherd Dog", ageInYears: 6))
    self.dogs.append(Dog(id: "D335", name: "Barkley", breed: "Great Dane", ageInYears: 1))
    self.dogs.append(Dog(id: "D336", name: "Ben", breed: "Shih Tzu", ageInYears: 8))
    self.dogs.append(Dog(id: "D337", name: "Bubba", breed: "Maltese", ageInYears: 6))
    self.dogs.append(Dog(id: "D338", name: "Gia", breed: "Pug", ageInYears: 12))
    self.dogs.append(Dog(id: "D339", name: "Matilda", breed: "Labrador Retriever", ageInYears: 4))
    self.dogs.append(Dog(id: "D340", name: "Paco", breed: "German Spitz", ageInYears: 5))
    self.dogs.append(Dog(id: "D341", name: "Tootsie", breed: "Boxer", ageInYears: 4))
    self.dogs.append(Dog(id: "D342", name: "Violet", breed: "Boxer", ageInYears: 6))
    self.dogs.append(Dog(id: "D343", name: "April", breed: "German Spitz", ageInYears: 0))
    self.dogs.append(
      Dog(id: "D344", name: "Dolce", breed: "German Shorthaired Pointer", ageInYears: 2))
    self.dogs.append(
      Dog(id: "D345", name: "Duncan", breed: "Staffordshire Bull Terrier", ageInYears: 6))
    self.dogs.append(Dog(id: "D346", name: "Hope", breed: "Bulldog", ageInYears: 6))
    self.dogs.append(Dog(id: "D347", name: "Jeter", breed: "English Cocker Spaniel", ageInYears: 7))
    self.dogs.append(Dog(id: "D348", name: "Nemo", breed: "Labrador Retriever", ageInYears: 1))
    self.dogs.append(Dog(id: "D349", name: "Nino", breed: "Bernese Mountain Dog", ageInYears: 1))
    self.dogs.append(Dog(id: "D350", name: "Ranger", breed: "Golden Retriever", ageInYears: 8))
    self.dogs.append(Dog(id: "D351", name: "Scooter", breed: "Shih Tzu", ageInYears: 5))
    self.dogs.append(Dog(id: "D352", name: "Snowy", breed: "Chihuahua", ageInYears: 3))
    self.dogs.append(Dog(id: "D353", name: "Kelly", breed: "French Bulldog", ageInYears: 8))
    self.dogs.append(Dog(id: "D354", name: "Rico", breed: "Miniature Schnauzer", ageInYears: 4))
    self.dogs.append(Dog(id: "D355", name: "Shaggy", breed: "Maltese", ageInYears: 12))
    self.dogs.append(
      Dog(id: "D356", name: "Snickers", breed: "Dachshund (all varieties)", ageInYears: 9))
    self.dogs.append(
      Dog(id: "D357", name: "Taco", breed: "English Springer Spaniel", ageInYears: 11))
    self.dogs.append(Dog(id: "D358", name: "Bianca", breed: "Miniature Schnauzer", ageInYears: 8))
    self.dogs.append(Dog(id: "D359", name: "Buffy", breed: "Shih Tzu", ageInYears: 3))
    self.dogs.append(
      Dog(id: "D360", name: "Buttercup", breed: "Bernese Mountain Dog", ageInYears: 4))
    self.dogs.append(Dog(id: "D361", name: "Duchess", breed: "Dobermann", ageInYears: 1))
    self.dogs.append(
      Dog(id: "D362", name: "Leila", breed: "West Highland White Terrier", ageInYears: 2))
    self.dogs.append(Dog(id: "D363", name: "Momo", breed: "Chihuahua", ageInYears: 6))
    self.dogs.append(Dog(id: "D364", name: "Theo", breed: "Border Collie", ageInYears: 9))
    self.dogs.append(
      Dog(id: "D365", name: "Bam", breed: "English Springer Spaniel", ageInYears: 10))
    self.dogs.append(
      Dog(id: "D366", name: "Blaze", breed: "English Springer Spaniel", ageInYears: 7))
    self.dogs.append(
      Dog(id: "D367", name: "Buttons", breed: "Cavalier King Charles Spaniel", ageInYears: 9))
    self.dogs.append(Dog(id: "D368", name: "Georgia", breed: "Bulldog", ageInYears: 0))
    self.dogs.append(Dog(id: "D369", name: "Harvey", breed: "Shih Tzu", ageInYears: 2))
    self.dogs.append(Dog(id: "D370", name: "Linda", breed: "German Spitz", ageInYears: 2))
    self.dogs.append(Dog(id: "D371", name: "Mac", breed: "Boxer", ageInYears: 2))
    self.dogs.append(
      Dog(id: "D372", name: "Panda", breed: "West Highland White Terrier", ageInYears: 8))
    self.dogs.append(
      Dog(id: "D373", name: "Summer", breed: "Cavalier King Charles Spaniel", ageInYears: 12))
    self.dogs.append(Dog(id: "D374", name: "Susie", breed: "Dobermann", ageInYears: 0))
    self.dogs.append(Dog(id: "D375", name: "Bowie", breed: "Golden Retriever", ageInYears: 10))
    self.dogs.append(
      Dog(id: "D376", name: "Dallas", breed: "Cavalier King Charles Spaniel", ageInYears: 12))
    self.dogs.append(Dog(id: "D377", name: "Hannah", breed: "Golden Retriever", ageInYears: 1))
    self.dogs.append(
      Dog(id: "D378", name: "Jade", breed: "English Springer Spaniel", ageInYears: 11))
    self.dogs.append(Dog(id: "D379", name: "Koda", breed: "Dobermann", ageInYears: 7))
    self.dogs.append(Dog(id: "D380", name: "Mack", breed: "English Cocker Spaniel", ageInYears: 7))
    self.dogs.append(Dog(id: "D381", name: "Nicky", breed: "Rottweiler", ageInYears: 11))
    self.dogs.append(Dog(id: "D382", name: "Pinky", breed: "Rottweiler", ageInYears: 12))
    self.dogs.append(Dog(id: "D383", name: "Shiloh", breed: "Pug", ageInYears: 3))
    self.dogs.append(Dog(id: "D384", name: "Sofia", breed: "English Setter", ageInYears: 2))
    self.dogs.append(Dog(id: "D385", name: "Theodore", breed: "English Setter", ageInYears: 12))
    self.dogs.append(Dog(id: "D386", name: "Bernie", breed: "French Bulldog", ageInYears: 12))
    self.dogs.append(
      Dog(id: "D387", name: "Caesar", breed: "English Springer Spaniel", ageInYears: 1))
    self.dogs.append(Dog(id: "D388", name: "Candy", breed: "Yorkshire Terrier", ageInYears: 1))
    self.dogs.append(Dog(id: "D389", name: "Dash", breed: "Golden Retriever", ageInYears: 5))
    self.dogs.append(Dog(id: "D390", name: "Macho", breed: "Bernese Mountain Dog", ageInYears: 12))
    self.dogs.append(Dog(id: "D391", name: "Mila", breed: "Great Dane", ageInYears: 1))
    self.dogs.append(
      Dog(id: "D392", name: "Napoleon", breed: "West Highland White Terrier", ageInYears: 12))
    self.dogs.append(
      Dog(id: "D393", name: "Ralph", breed: "Staffordshire Bull Terrier", ageInYears: 3))
    self.dogs.append(Dog(id: "D394", name: "Red", breed: "Bulldog", ageInYears: 7))
    self.dogs.append(Dog(id: "D395", name: "Toto", breed: "Rottweiler", ageInYears: 5))
    self.dogs.append(
      Dog(id: "D396", name: "Captain", breed: "Staffordshire Bull Terrier", ageInYears: 0))
    self.dogs.append(
      Dog(id: "D397", name: "Franklin", breed: "Staffordshire Bull Terrier", ageInYears: 7))
    self.dogs.append(Dog(id: "D398", name: "Gypsy", breed: "Labrador Retriever", ageInYears: 11))
    self.dogs.append(Dog(id: "D399", name: "Ivy", breed: "Bulldog", ageInYears: 2))
    self.dogs.append(Dog(id: "D400", name: "Kirby", breed: "Pug", ageInYears: 2))
    self.dogs.append(Dog(id: "D401", name: "Pearl", breed: "Pug", ageInYears: 7))
    self.dogs.append(Dog(id: "D402", name: "Biggie", breed: "German Spitz", ageInYears: 12))
    self.dogs.append(Dog(id: "D403", name: "Butter", breed: "Rottweiler", ageInYears: 1))
    self.dogs.append(Dog(id: "D404", name: "Charles", breed: "German Spitz", ageInYears: 11))
    self.dogs.append(Dog(id: "D405", name: "Fritz", breed: "Shetland Sheepdog", ageInYears: 11))
    self.dogs.append(
      Dog(id: "D406", name: "Mookie", breed: "Dachshund (all varieties)", ageInYears: 10))
    self.dogs.append(
      Dog(id: "D407", name: "Murray", breed: "German Shorthaired Pointer", ageInYears: 2))
    self.dogs.append(Dog(id: "D408", name: "Poppy", breed: "Boxer", ageInYears: 5))
    self.dogs.append(
      Dog(id: "D409", name: "Shorty", breed: "German Shorthaired Pointer", ageInYears: 11))
    self.dogs.append(Dog(id: "D410", name: "Stewie", breed: "Rottweiler", ageInYears: 5))
    self.dogs.append(Dog(id: "D411", name: "Suki", breed: "Border Collie", ageInYears: 0))
    self.dogs.append(
      Dog(id: "D412", name: "Titan", breed: "Dachshund (all varieties)", ageInYears: 11))
    self.dogs.append(Dog(id: "D413", name: "Trouble", breed: "Pug", ageInYears: 12))
    self.dogs.append(Dog(id: "D414", name: "Amy", breed: "French Bulldog", ageInYears: 7))
    self.dogs.append(Dog(id: "D415", name: "Bubbles", breed: "Miniature Schnauzer", ageInYears: 11))
    self.dogs.append(
      Dog(id: "D416", name: "Domino", breed: "Staffordshire Bull Terrier", ageInYears: 9))
    self.dogs.append(Dog(id: "D417", name: "Freddie", breed: "English Setter", ageInYears: 10))
    self.dogs.append(Dog(id: "D418", name: "Jada", breed: "Boxer", ageInYears: 0))
    self.dogs.append(Dog(id: "D419", name: "Jay", breed: "Poodle", ageInYears: 3))
    self.dogs.append(
      Dog(id: "D420", name: "Linus", breed: "Dachshund (all varieties)", ageInYears: 7))
    self.dogs.append(
      Dog(id: "D421", name: "Peter", breed: "West Highland White Terrier", ageInYears: 0))
    self.dogs.append(Dog(id: "D422", name: "Pluto", breed: "Maltese", ageInYears: 6))
    self.dogs.append(Dog(id: "D423", name: "Quincy", breed: "Maltese", ageInYears: 2))
    self.dogs.append(
      Dog(id: "D424", name: "Rascal", breed: "Cavalier King Charles Spaniel", ageInYears: 12))
    self.dogs.append(
      Dog(id: "D425", name: "Rocket", breed: "Dachshund (all varieties)", ageInYears: 5))
    self.dogs.append(Dog(id: "D426", name: "Tallulah", breed: "Poodle", ageInYears: 0))
    self.dogs.append(Dog(id: "D427", name: "Unkown", breed: "Great Dane", ageInYears: 2))
    self.dogs.append(Dog(id: "D428", name: "Zelda", breed: "Miniature Schnauzer", ageInYears: 6))
    self.dogs.append(
      Dog(id: "D429", name: "Cupcake", breed: "English Cocker Spaniel", ageInYears: 9))
    self.dogs.append(Dog(id: "D430", name: "Dutch", breed: "Beagle", ageInYears: 8))
    self.dogs.append(Dog(id: "D431", name: "Khloe", breed: "English Cocker Spaniel", ageInYears: 0))
    self.dogs.append(Dog(id: "D432", name: "Lilo", breed: "Border Collie", ageInYears: 3))
    self.dogs.append(Dog(id: "D433", name: "Mandy", breed: "Boxer", ageInYears: 2))
    self.dogs.append(
      Dog(id: "D434", name: "Mojo", breed: "German Shorthaired Pointer", ageInYears: 3))
    self.dogs.append(Dog(id: "D435", name: "Pippa", breed: "Boxer", ageInYears: 4))
    self.dogs.append(Dog(id: "D436", name: "Faith", breed: "Miniature Schnauzer", ageInYears: 12))
    self.dogs.append(Dog(id: "D437", name: "Frida", breed: "Bernese Mountain Dog", ageInYears: 12))
    self.dogs.append(Dog(id: "D438", name: "Isis", breed: "Great Dane", ageInYears: 2))
    self.dogs.append(Dog(id: "D439", name: "Jordan", breed: "German Spitz", ageInYears: 2))
    self.dogs.append(Dog(id: "D440", name: "Kuma", breed: "Boxer", ageInYears: 5))
    self.dogs.append(Dog(id: "D441", name: "Maxine", breed: "Labrador Retriever", ageInYears: 6))
    self.dogs.append(
      Dog(id: "D442", name: "Melo", breed: "English Springer Spaniel", ageInYears: 4))
    self.dogs.append(Dog(id: "D443", name: "Pixie", breed: "Golden Retriever", ageInYears: 9))
    self.dogs.append(Dog(id: "D444", name: "Spot", breed: "Yorkshire Terrier", ageInYears: 6))
    self.dogs.append(Dog(id: "D445", name: "Stitch", breed: "Yorkshire Terrier", ageInYears: 4))
    self.dogs.append(Dog(id: "D446", name: "Tinkerbell", breed: "Golden Retriever", ageInYears: 4))
    self.dogs.append(
      Dog(id: "D447", name: "Butch", breed: "German Shorthaired Pointer", ageInYears: 2))
    self.dogs.append(Dog(id: "D448", name: "Harper", breed: "Labrador Retriever", ageInYears: 10))
    self.dogs.append(Dog(id: "D449", name: "Major", breed: "Bernese Mountain Dog", ageInYears: 2))
    self.dogs.append(Dog(id: "D450", name: "Marty", breed: "Bulldog", ageInYears: 6))
    self.dogs.append(Dog(id: "D451", name: "Maxie", breed: "Rottweiler", ageInYears: 6))
    self.dogs.append(Dog(id: "D452", name: "Noah", breed: "Maltese", ageInYears: 8))
    self.dogs.append(Dog(id: "D453", name: "Rocko", breed: "Bulldog", ageInYears: 2))
    self.dogs.append(Dog(id: "D454", name: "Scarlett", breed: "Pug", ageInYears: 11))
    self.dogs.append(
      Dog(id: "D455", name: "Sofie", breed: "West Highland White Terrier", ageInYears: 2))
    self.dogs.append(Dog(id: "D456", name: "Tito", breed: "Yorkshire Terrier", ageInYears: 9))
    self.dogs.append(
      Dog(id: "D457", name: "Valentino", breed: "Miniature Schnauzer", ageInYears: 2))
    self.dogs.append(Dog(id: "D458", name: "Basil", breed: "German Spitz", ageInYears: 11))
    self.dogs.append(Dog(id: "D459", name: "Betsy", breed: "Border Collie", ageInYears: 7))
    self.dogs.append(Dog(id: "D460", name: "Fifi", breed: "Labrador Retriever", ageInYears: 3))
    self.dogs.append(Dog(id: "D461", name: "Jazzy", breed: "Poodle", ageInYears: 0))
    self.dogs.append(Dog(id: "D462", name: "Miley", breed: "Boxer", ageInYears: 4))
    self.dogs.append(
      Dog(id: "D463", name: "Mylo", breed: "Staffordshire Bull Terrier", ageInYears: 0))
    self.dogs.append(
      Dog(id: "D464", name: "Ringo", breed: "Cavalier King Charles Spaniel", ageInYears: 4))
    self.dogs.append(Dog(id: "D465", name: "Stevie", breed: "Bernese Mountain Dog", ageInYears: 7))
    self.dogs.append(
      Dog(id: "D466", name: "Tigger", breed: "Staffordshire Bull Terrier", ageInYears: 2))
    self.dogs.append(Dog(id: "D467", name: "Tyler", breed: "German Spitz", ageInYears: 10))
    self.dogs.append(Dog(id: "D468", name: "Winter", breed: "Dobermann", ageInYears: 3))
    self.dogs.append(Dog(id: "D469", name: "Coconut", breed: "Bernese Mountain Dog", ageInYears: 8))
    self.dogs.append(Dog(id: "D470", name: "Dutchess", breed: "English Setter", ageInYears: 10))
    self.dogs.append(Dog(id: "D471", name: "Emily", breed: "Bulldog", ageInYears: 3))
    self.dogs.append(Dog(id: "D472", name: "Gatsby", breed: "Dobermann", ageInYears: 2))
    self.dogs.append(Dog(id: "D473", name: "Johnny", breed: "Great Dane", ageInYears: 1))
    self.dogs.append(Dog(id: "D474", name: "Kona", breed: "Boxer", ageInYears: 1))
    self.dogs.append(Dog(id: "D475", name: "Nellie", breed: "Boxer", ageInYears: 5))
    self.dogs.append(Dog(id: "D476", name: "Nyla", breed: "Boxer", ageInYears: 11))
    self.dogs.append(Dog(id: "D477", name: "Pablo", breed: "Maltese", ageInYears: 3))
    self.dogs.append(
      Dog(id: "D478", name: "Ripley", breed: "English Springer Spaniel", ageInYears: 12))
    self.dogs.append(Dog(id: "D479", name: "Savannah", breed: "German Spitz", ageInYears: 8))
    self.dogs.append(Dog(id: "D480", name: "Tara", breed: "German Spitz", ageInYears: 7))
    self.dogs.append(Dog(id: "D481", name: "Troy", breed: "Beagle", ageInYears: 9))
    self.dogs.append(Dog(id: "D482", name: "Yoda", breed: "Rottweiler", ageInYears: 8))
    self.dogs.append(Dog(id: "D483", name: "Alice", breed: "German Shepherd Dog", ageInYears: 6))
    self.dogs.append(
      Dog(id: "D484", name: "Ariel", breed: "English Springer Spaniel", ageInYears: 4))
    self.dogs.append(Dog(id: "D485", name: "Carter", breed: "Miniature Schnauzer", ageInYears: 6))
    self.dogs.append(
      Dog(id: "D486", name: "Eva", breed: "German Shorthaired Pointer", ageInYears: 9))
    self.dogs.append(Dog(id: "D487", name: "Georgie", breed: "Yorkshire Terrier", ageInYears: 12))
    self.dogs.append(Dog(id: "D488", name: "London", breed: "Chihuahua", ageInYears: 9))
    self.dogs.append(Dog(id: "D489", name: "Luigi", breed: "Chihuahua", ageInYears: 12))
    self.dogs.append(Dog(id: "D490", name: "Mini", breed: "Golden Retriever", ageInYears: 0))
    self.dogs.append(Dog(id: "D491", name: "Mister", breed: "Labrador Retriever", ageInYears: 5))
    self.dogs.append(Dog(id: "D492", name: "Pete", breed: "Maltese", ageInYears: 0))
    self.dogs.append(
      Dog(id: "D493", name: "Rosco", breed: "West Highland White Terrier", ageInYears: 4))
    self.dogs.append(
      Dog(id: "D494", name: "Sammie", breed: "German Shorthaired Pointer", ageInYears: 8))
    self.dogs.append(Dog(id: "D495", name: "Willy", breed: "French Bulldog", ageInYears: 1))
    self.dogs.append(
      Dog(id: "D496", name: "Atticus", breed: "English Springer Spaniel", ageInYears: 7))
    self.dogs.append(
      Dog(id: "D497", name: "Beauty", breed: "English Cocker Spaniel", ageInYears: 7))
    self.dogs.append(
      Dog(id: "D498", name: "Billie", breed: "West Highland White Terrier", ageInYears: 10))
    self.dogs.append(Dog(id: "D499", name: "Bunny", breed: "English Setter", ageInYears: 11))

  }

}
