import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    let coverView = UIImageView()
    let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        coverView.frame = CGRect(x: 0, y: 0, width: 95, height: 140)
        coverView.contentMode = .scaleAspectFill
        coverView.clipsToBounds = true
        coverView.layer.cornerRadius = 8
        contentView.addSubview(coverView)

        titleLabel.frame = CGRect(x: 0, y: 144, width: 95, height: 30)
        titleLabel.font = .systemFont(ofSize: 12)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        contentView.addSubview(titleLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with book: Book) {
        coverView.image = UIImage(named: book.id)
        titleLabel.text = book.title
    }
}
