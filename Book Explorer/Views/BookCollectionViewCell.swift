import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    let coverView = UIImageView()
    let titleLabel = UILabel()
    let ratingLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(white: 0.96, alpha: 1)
        contentView.layer.cornerRadius = 12

        coverView.frame = CGRect(x: 6, y: 6, width: 100, height: 90)
        coverView.contentMode = .scaleAspectFill
        coverView.clipsToBounds = true
        coverView.layer.cornerRadius = 8
        contentView.addSubview(coverView)

        titleLabel.frame = CGRect(x: 5, y: 101, width: 102, height: 30)
        titleLabel.font = .systemFont(ofSize: 12, weight: .medium)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        contentView.addSubview(titleLabel)

        ratingLabel.frame = CGRect(x: 5, y: 132, width: 102, height: 16)
        ratingLabel.font = .systemFont(ofSize: 11)
        ratingLabel.textColor = .systemOrange
        ratingLabel.textAlignment = .center
        contentView.addSubview(ratingLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with book: Book) {
        coverView.image = UIImage(named: book.id)
        titleLabel.text = book.title
        ratingLabel.text = "★ \(book.rating)"
        accessibilityIdentifier = "card-\(book.id)"
    }
}
