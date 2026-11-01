# Book Explorer

Учебное приложение для Intro to iOS: **Swift + UIKit, интерфейс целиком в коде**.

Один экран по образцу Movie Explorer: Discover Books, горизонтальная коллекция Popular Books, ниже таблица All Books. Белый фон, серые карточки, оранжевые рейтинги.

## Как запустить

1. Откройте `Book Explorer.xcodeproj` в Xcode.
2. Выберите схему **Book Explorer** и симулятор iPhone.
3. Нажмите **Cmd + R**.

Минимальная версия iOS — 17.0. Проект проверяется в Xcode 26 на iPhone 17 Pro / iOS 26.5. Установка пакетов, ключи API и интернет для работы приложения не нужны.

## Что умеет приложение

- 12 книг с локальными обложками в **каждом** из двух списков.
- Горизонтальная прокрутка коллекции и вертикальная прокрутка таблицы.
- Нажатие на карточку или строку открывает окно с автором и описанием книги.
- Свайп влево по строке → **Delete book**. Книга удаляется из обоих списков.

Данные — обычный массив. После перезапуска восстанавливается исходный список. Рейтинги являются демонстрационными значениями по шкале 5.

## Простая структура

| Файл | Назначение |
| --- | --- |
| `AppDelegate.swift` | Точка входа приложения |
| `SceneDelegate.swift` | Создаёт окно и UINavigationController |
| `Models/Book.swift` | Структура Book и массив из 12 книг |
| `Controllers/BooksViewController.swift` | Экран и методы двух списков |
| `Views/BookTableViewCell.swift` | Обложка, название, год, жанр и рейтинг в строке |
| `Views/BookCollectionViewCell.swift` | Маленькая карточка книги |

Нет SwiftUI, storyboard, базы данных, сетевых запросов или сторонних библиотек в приложении.

## 10 методов UITableView

Все находятся в `BooksViewController.swift`, класс реализует `UITableViewDataSource, UITableViewDelegate`.

| № | Метод | Зачем нужен |
| --- | --- | --- |
| 1 | `numberOfSections(in:)` | Одна секция All Books |
| 2 | `tableView(_:numberOfRowsInSection:)` | Количество книг в массиве |
| 3 | `tableView(_:cellForRowAt:)` | Переиспользование и заполнение строки |
| 4 | `tableView(_:heightForRowAt:)` | Высота строки для обложки и текста |
| 5 | `tableView(_:titleForHeaderInSection:)` | Заголовок All Books |
| 6 | `tableView(_:heightForHeaderInSection:)` | Отступ для заголовка |
| 7 | `tableView(_:titleForFooterInSection:)` | Число книг или сообщение о пустом списке |
| 8 | `tableView(_:didSelectRowAt:)` | Описание выбранной книги |
| 9 | `tableView(_:commit:forRowAt:)` | Удаление свайпом и обновление обоих списков |
| 10 | `tableView(_:titleForDeleteConfirmationButtonForRowAt:)` | Подпись Delete book |

## 10 методов UICollectionView

Там же, класс реализует `UICollectionViewDataSource, UICollectionViewDelegateFlowLayout`. `UICollectionViewDelegateFlowLayout` наследует `UICollectionViewDelegate`.

| № | Метод | Зачем нужен |
| --- | --- | --- |
| 1 | `numberOfSections(in:)` | Одна горизонтальная секция |
| 2 | `collectionView(_:numberOfItemsInSection:)` | Количество карточек |
| 3 | `collectionView(_:cellForItemAt:)` | Переиспользование и заполнение карточки |
| 4 | `collectionView(_:didSelectItemAt:)` | Описание выбранной книги |
| 5 | `collectionView(_:layout:sizeForItemAt:)` | Размер карточки 112 × 154 |
| 6 | `collectionView(_:layout:insetForSectionAt:)` | Отступы по краям коллекции |
| 7 | `collectionView(_:layout:minimumLineSpacingForSectionAt:)` | Горизонтальный промежуток между карточками |
| 8 | `collectionView(_:didHighlightItemAt:)` | Затемнение карточки при нажатии |
| 9 | `collectionView(_:didUnhighlightItemAt:)` | Возвращение обычного вида после нажатия |
| 10 | `collectionView(_:willDisplay:forItemAt:)` | Плавное появление карточки при прокрутке |

## Что объяснить на защите

**DataSource** сообщает UIKit количество элементов и создаёт ячейки. **Delegate** обрабатывает выбор и другие действия. **FlowLayout** определяет размеры и отступы карточек.

`dequeueReusableCell` переиспользует ячейки при прокрутке, а `configure(with:)` заполняет их новыми данными. При удалении сначала меняется массив `books`, затем `reloadData()` обновляет оба списка.

## Проверка и сдача

Для сдачи используйте ZIP проекта и запись симулятора из папки `Submission`.

## Изображения и документация

Обложки 1984, The Little Prince, To Kill a Mockingbird, Dune, Harry Potter, The Alchemist, Jane Eyre и Frankenstein получены через [Open Library Covers API](https://openlibrary.org/dev/docs/api/covers). Обложка The Hobbit — [Google Books](https://books.google.com/books?id=LLSpngEACAAJ).

Обложки классики — Standard Ebooks: [The Great Gatsby](https://standardebooks.org/ebooks/f-scott-fitzgerald/the-great-gatsby), [Pride and Prejudice](https://standardebooks.org/ebooks/jane-austen/pride-and-prejudice), [Little Women](https://standardebooks.org/ebooks/louisa-may-alcott/little-women).

Справка Apple: [UITableViewDataSource](https://developer.apple.com/documentation/uikit/uitableviewdatasource), [UITableViewDelegate](https://developer.apple.com/documentation/uikit/uitableviewdelegate), [UICollectionViewDataSource](https://developer.apple.com/documentation/uikit/uicollectionviewdatasource), [UICollectionViewDelegateFlowLayout](https://developer.apple.com/documentation/uikit/uicollectionviewdelegateflowlayout).
# HW4-IOS
