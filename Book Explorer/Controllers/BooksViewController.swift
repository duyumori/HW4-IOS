import UIKit

class BooksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var books = Book.samples
    let tableView = UITableView(frame: .zero, style: .grouped)
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Book Explorer"
        view.backgroundColor = .white
        setupTableView()
        setupHeader()
    }

    func setupTableView() {
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.accessibilityIdentifier = "all-books"
        tableView.register(BookTableViewCell.self, forCellReuseIdentifier: "BookRow")
        view.addSubview(tableView)
    }

    func setupHeader() {
        let width = view.bounds.width
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 300))

        let titleLabel = UILabel(frame: CGRect(x: 20, y: 20, width: width - 40, height: 34))
        titleLabel.text = "Discover Books"
        titleLabel.font = .boldSystemFont(ofSize: 28)
        headerView.addSubview(titleLabel)

        let popularLabel = UILabel(frame: CGRect(x: 20, y: 72, width: width - 40, height: 24))
        popularLabel.text = "Popular Books"
        popularLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        headerView.addSubview(popularLabel)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 116, width: width, height: 154), collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth]
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.accessibilityIdentifier = "popular-books"
        collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: "BookCard")
        headerView.addSubview(collectionView)

        tableView.tableHeaderView = headerView
    }

    func reloadBooks() {
        tableView.reloadData()
        collectionView.reloadData()
    }

    func showBook(_ book: Book) {
        let message = "\(book.author)\n\(book.year) · \(book.genre)\n★ \(book.rating)/5\n\n\(book.summary)"
        let alert = UIAlertController(title: book.title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel))
        present(alert, animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookRow", for: indexPath) as! BookTableViewCell
        cell.configure(with: books[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "All Books"
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if books.isEmpty {
            return "No books left"
        }
        return "\(books.count) books"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showBook(books[indexPath.row])
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            reloadBooks()
        }
    }

    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete book"
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCard", for: indexPath) as! BookCollectionViewCell
        cell.configure(with: books[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        showBook(books[indexPath.item])
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 112, height: 154)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 0.3) {
            cell.alpha = 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.alpha = 0.6
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.alpha = 1
    }
}
