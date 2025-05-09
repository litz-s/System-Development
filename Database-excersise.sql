-- 出版社テーブル
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(50) NOT NULL,
    contact VARCHAR(100)
);

-- 書籍カテゴリーテーブル
CREATE TABLE category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(30) NOT NULL,
    description VARCHAR(200)
);

-- 書籍テーブル
CREATE TABLE book (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    publisher_id INT NOT NULL,
    category_id INT NOT NULL,
    publication_year INT NOT NULL,
    price INT NOT NULL
);

-- 貸出テーブル
CREATE TABLE lending (
    lending_id INT PRIMARY KEY,
    book_id INT NOT NULL,
    borrower_name VARCHAR(50) NOT NULL,
    lending_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE
);

-- 出版社データ
INSERT INTO publisher VALUES
(1, '技術書出版', 'tech@example.com'),
(2, '小説文庫', 'novel@example.com'),
(3, '学術出版社', 'academic@example.com'),
(4, 'マンガ出版', 'manga@example.com');

-- カテゴリデータ
INSERT INTO category VALUES
(1, '技術書', 'コンピュータ、IT関連の書籍'),
(2, '小説', 'フィクション作品'),
(3, '学術書', '研究、専門分野の書籍'),
(4, 'マンガ', 'コミック、グラフィックノベル'),
(5, '参考書', '学習参考書、辞典類');

-- 書籍データ
INSERT INTO book VALUES
(1, 'データベース入門', '鈴木一郎', 1, 1, 2022, 3800),
(2, 'SQL実践ガイド', '佐藤次郎', 1, 1, 2023, 4200),
(3, '星の王子さま', 'サン＝テグジュペリ', 2, 2, 1943, 1500),
(4, '風と共に去りぬ', 'ミッチェル', 2, 2, 1936, 2000),
(5, '人工知能概論', '田中博士', 3, 3, 2023, 5500),
(6, '日本史研究', '山本教授', 3, 3, 2022, 4800),
(7, 'ドラゴンボール 1', '鳥山明', 4, 4, 1985, 500),
(8, 'ONE PIECE 99', '尾田栄一郎', 4, 4, 2021, 500),
(9, '高校数学I', '教育研究会', 3, 5, 2021, 2500),
(10, '英語基礎文法', '英語学会', 3, 5, 2020, 2200);

-- 貸出データ
INSERT INTO lending VALUES
(1, 1, '高橋太郎', '2024-03-01', '2024-03-15', '2024-03-10'),
(2, 3, '伊藤花子', '2024-03-05', '2024-03-19', '2024-03-18'),
(3, 5, '渡辺研究員', '2024-03-10', '2024-03-24', NULL),
(4, 7, '小林子供', '2024-03-12', '2024-03-26', '2024-03-20'),
(5, 2, '中村学生', '2024-03-15', '2024-03-29', NULL),
(6, 9, '中村学生', '2024-03-15', '2024-03-29', NULL);

-- 書籍タイトル、著者、価格を価格の安い順に表示
SELECT title, author, price FROM book
ORDER BY price ASC;

-- 技術書カテゴリの書籍をすべて表示
SELECT * FROM book
WHERE category_id = 1;

-- 価格が3000円未満の書籍を価格の高い順に表示
SELECT title, price FROM book
WHERE price < 3000
ORDER BY price DESC;

-- 出版年が2022年以降の書籍を表示
SELECT title, author FROM book
WHERE publication_year >= 2022;

-- 書籍ID「2」の価格を4500に、出版年を2020に更新
UPDATE book SET
    price = 4500,
    publication_year = 2020
WHERE book_id = 2;

-- 「学術書」カテゴリのすべての書籍の価格を5%値上げ
UPDATE book SET 
    price = price * 1.05
WHERE category_id = 3;

-- 書籍ID「10」のデータを削除
DELETE FROM book
WHERE book_id = 10;