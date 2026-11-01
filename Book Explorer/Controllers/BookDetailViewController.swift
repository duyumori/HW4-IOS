import UIKit

class BookDetailViewController: UIViewController {
    var book: Book!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never

        let width = view.bounds.width
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(scrollView)

        let topView = UIView(frame: CGRect(x: 0, y: -500, width: width, height: 800))
        topView.backgroundColor = .systemGray6
        scrollView.addSubview(topView)

        let coverView = UIImageView(frame: CGRect(x: (width - 150) / 2, y: 30, width: 150, height: 220))
        coverView.image = UIImage(named: book.id)
        coverView.contentMode = .scaleAspectFill
        coverView.clipsToBounds = true
        coverView.layer.cornerRadius = 10
        scrollView.addSubview(coverView)

        let titleLabel = UILabel(frame: CGRect(x: 20, y: 320, width: width - 40, height: 60))
        titleLabel.text = book.title
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        scrollView.addSubview(titleLabel)

        let authorLabel = UILabel(frame: CGRect(x: 20, y: 380, width: width - 40, height: 22))
        authorLabel.text = book.author
        authorLabel.font = .systemFont(ofSize: 17)
        authorLabel.textColor = .gray
        authorLabel.textAlignment = .center
        scrollView.addSubview(authorLabel)

        let yearLabel = makeInfoLabel(title: "Year", value: "\(book.year)", x: 20, width: width)
        let genreLabel = makeInfoLabel(title: "Genre", value: book.genre, x: 20 + (width - 40) / 3, width: width)
        let ratingLabel = makeInfoLabel(title: "Rating", value: "⭐️ \(book.rating)", x: 20 + (width - 40) / 3 * 2, width: width)
        scrollView.addSubview(yearLabel)
        scrollView.addSubview(genreLabel)
        scrollView.addSubview(ratingLabel)

        let aboutLabel = UILabel(frame: CGRect(x: 20, y: 500, width: width - 40, height: 24))
        aboutLabel.text = "About"
        aboutLabel.font = .boldSystemFont(ofSize: 20)
        scrollView.addSubview(aboutLabel)

        let summaryLabel = UILabel(frame: CGRect(x: 20, y: 530, width: width - 40, height: 0))
        summaryLabel.text = book.summary
        summaryLabel.font = .systemFont(ofSize: 16)
        summaryLabel.numberOfLines = 0
        summaryLabel.sizeToFit()
        scrollView.addSubview(summaryLabel)

        scrollView.contentSize = CGSize(width: width, height: summaryLabel.frame.maxY + 40)
    }

    func makeInfoLabel(title: String, value: String, x: CGFloat, width: CGFloat) -> UILabel {
        let label = UILabel(frame: CGRect(x: x, y: 420, width: (width - 40) / 3, height: 56))
        label.text = "\(value)\n\(title)"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }
}
