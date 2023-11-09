## ステップ 1: データベースの作成
データベースを作成するために、データベース管理システム（今回はMySQL）にログインします。

SQLクエリを使用して、新しいデータベースを作成します。以下はMySQLの例です：

```
CREATE DATABASE InternetTVService;
```

<br>
<br>

## ステップ 2: テーブルの作成
データベース内に必要なテーブルを作成します。以下は各テーブルの作成方法の例です。

Channels テーブル:
```
CREATE TABLE Channels (
    channel_id INT AUTO_INCREMENT PRIMARY KEY,
    channel_name VARCHAR(255) NOT NULL
);
```

TimeSlots テーブル:
```
CREATE TABLE TimeSlots (
    time_slot_id INT AUTO_INCREMENT PRIMARY KEY,
    channel_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (channel_id) REFERENCES Channels(channel_id)
);
```
他のテーブルも同様に作成してください。

<br>
<br>

## ステップ 3: サンプルデータの挿入
各テーブルにサンプルデータを挿入します。以下はサンプルデータを挿入する例です。

Channels テーブルへのサンプルデータ挿入:
```
INSERT INTO Channels (channel_name) VALUES
('ドラマ1'),
('ドラマ2'),
('アニメ1'),
('アニメ2'),
('スポーツ'),
('ペット');
```
他のテーブルにも同様にサンプルデータを挿入してください。

<br>
<br>

## ステップ 4: データベースの保存と確認
すべてのテーブルとサンプルデータが正しく挿入されたことを確認します。

データベース管理システムでデータをクエリして、サンプルデータが期待通り格納されていることを確認します。

これでデータベースの構築とテーブル作成、サンプルデータの挿入が完了しました。他の人がこの手順通りに実施すれば、同じデータベースを作成し、サンプルデータを挿入できます。
