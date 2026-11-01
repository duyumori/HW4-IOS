import UIKit

class BookTableViewCell: UITableViewCell {
    let coverView = UIImageView()
    let titleLabel = UILabel()
    let infoLabel = UILabel()
    let ratingLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        separatorInset = UIEdgeInsets(top: 0, left: 98, bottom: 0, right: 20)

        coverView.frame = CGRect(x: 20, y: 10, width: 64, height: 76)
        coverView.contentMode = .scaleAspectFill
        coverView.clipsToBounds = true
        coverView.layer.cornerRadius = 10
        contentView.addSubview(coverView)

        titleLabel.frame = CGRect(x: 98, y: 16, width: 250, height: 22)
        titleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        contentView.addSubview(titleLabel)

        infoLabel.frame = CGRect(x: 98, y: 40, width: 250, height: 18)
        infoLabel.font = .systemFont(ofSize: 13)
        infoLabel.textColor = .systemGray
        contentView.addSubview(infoLabel)

        ratingLabel.frame = CGRect(x: 98, y: 60, width: 250, height: 18)
        ratingLabel.font = .systemFont(ofSize: 14, weight: .medium)
        ratingLabel.textColor = .systemOrange
        contentView.addSubview(ratingLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with book: Book) {
        coverView.image = UIImage(named: book.id)
        titleLabel.text = book.title
        infoLabel.text = "\(book.year) · \(book.genre)"
        ratingLabel.text = "★ \(book.rating)/5"
        accessibilityIdentifier = "row-\(book.id)"
    }
}
