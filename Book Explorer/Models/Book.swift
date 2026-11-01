import Foundation

struct Book {
    let id: String
    let title: String
    let author: String
    let year: Int
    let genre: String
    let rating: Double
    let summary: String

    static let samples: [Book] = [
        Book(id: "hobbit", title: "The Hobbit", author: "J. R. R. Tolkien", year: 1937,
             genre: "Fantasy", rating: 4.8,
             summary: "Bilbo Baggins enjoys a quiet life until a wizard and thirteen dwarves invite him on an unexpected adventure. Their journey to reclaim a lost kingdom takes him through wild mountains, dangerous encounters, and a discovery that will change his world."),
        Book(id: "gatsby", title: "The Great Gatsby", author: "F. Scott Fitzgerald", year: 1925,
             genre: "Classic", rating: 4.4,
             summary: "Nick Carraway moves to Long Island and becomes fascinated by his mysterious neighbor, Jay Gatsby. Behind the glittering parties lies a story of longing, reinvention, and the distance between a dream and reality."),
        Book(id: "little-prince", title: "The Little Prince", author: "Antoine de Saint-Exupéry", year: 1943,
             genre: "Fable", rating: 4.7,
             summary: "A pilot stranded in the desert meets a young traveler from a tiny planet. Through the prince's encounters with unusual grown-ups, a rose, and a fox, this short tale explores friendship, responsibility, and what makes something precious."),
        Book(id: "pride", title: "Pride and Prejudice", author: "Jane Austen", year: 1813,
             genre: "Romance", rating: 4.6,
             summary: "Elizabeth Bennet values her independence and quick judgment. When she meets the reserved Mr. Darcy, misunderstandings and social expectations stand between them. Both must reconsider their first impressions."),
        Book(id: "1984", title: "1984", author: "George Orwell", year: 1949,
             genre: "Dystopian", rating: 4.5,
             summary: "Winston Smith lives under a government that watches its citizens and rewrites the past. His private doubts lead him to search for truth and human connection in a world determined to control both."),
        Book(id: "mockingbird", title: "To Kill a Mockingbird", author: "Harper Lee", year: 1960,
             genre: "Classic", rating: 4.8,
             summary: "Scout Finch grows up in a small Alabama town while her father, Atticus, defends a man who has been unfairly accused. Seen through a child's eyes, the story considers courage, compassion, and injustice."),
        Book(id: "dune", title: "Dune", author: "Frank Herbert", year: 1965,
             genre: "Science Fiction", rating: 4.6,
             summary: "Paul Atreides travels to Arrakis, a desert planet whose rare spice shapes an entire empire. Rival families, a demanding landscape, and the people who call the desert home draw him into a struggle far larger than he expected."),
        Book(id: "harry-potter", title: "Harry Potter and the Sorcerer's Stone", author: "J. K. Rowling", year: 1997,
             genre: "Fantasy", rating: 4.7,
             summary: "On his eleventh birthday, Harry discovers that he is a wizard. At Hogwarts he finds friendship, a talent for flying, and clues to a mystery hidden within the school."),
        Book(id: "alchemist", title: "The Alchemist", author: "Paulo Coelho", year: 1988,
             genre: "Adventure", rating: 4.3,
             summary: "Santiago, a young shepherd, follows a recurring dream in search of treasure. His travels across North Africa introduce him to people who challenge how he thinks about ambition, chance, and listening to his own hopes."),
        Book(id: "jane-eyre", title: "Jane Eyre", author: "Charlotte Brontë", year: 1847,
             genre: "Classic", rating: 4.5,
             summary: "An orphan determined to make her own way becomes a governess at Thornfield Hall. As Jane grows close to its enigmatic owner, she must weigh love against her principles and independence."),
        Book(id: "frankenstein", title: "Frankenstein", author: "Mary Shelley", year: 1818,
             genre: "Gothic", rating: 4.2,
             summary: "Victor Frankenstein discovers how to create life, then turns away from what he has made. His creation's search for acceptance becomes a story about isolation, ambition, and a creator's responsibility."),
        Book(id: "little-women", title: "Little Women", author: "Louisa May Alcott", year: 1868,
             genre: "Coming of Age", rating: 4.6,
             summary: "Meg, Jo, Beth, and Amy March grow up together, each with a different dream for the future. Their everyday adventures and difficult choices trace the bonds of family and the many forms a meaningful life can take.")
    ]
}
