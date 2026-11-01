import UIKit

class BookTableViewCell: UITableViewCell {
    let coverView = UIImageView()
    let titleLabel = UILabel()
    let infoLabel = UILabel()
    let ratingLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        coverView.frame = CGRect(x: 16, y: 8, width: 42, height: 60)
        coverView.contentMode = .scaleAspectFill
        coverView.clipsToBounds = true
        contentView.addSubview(coverView)

        titleLabel.frame = CGRect(x: 70, y: 14, width: 230, height: 22)
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        contentView.addSubview(titleLabel)

        infoLabel.frame = CGRect(x: 70, y: 38, width: 230, height: 20)
        infoLabel.font = .systemFont(ofSize: 13)
        infoLabel.textColor = .gray
        contentView.addSubview(infoLabel)

        ratingLabel.frame = CGRect(x: 300, y: 26, width: 60, height: 24)
        ratingLabel.font = .boldSystemFont(ofSize: 15)
        ratingLabel.textColor = .orange
        ratingLabel.textAlignment = .right
        contentView.addSubview(ratingLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with book: Book) {
        coverView.image = UIImage(named: book.id)
        titleLabel.text = book.title
        infoLabel.text = "\(book.author) - \(book.genre)"
        ratingLabel.text = "\(book.rating)"
    }
}
