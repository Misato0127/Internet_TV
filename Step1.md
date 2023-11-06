### Channels テーブルのカラム

| Field        | Type         | Null | Key | Default | Extra          |
| ------------ | ------------ | ---- | --- | ------- | -------------- |
| channel_id   | int          | NO   | PRI | NULL    | auto_increment |
| channel_name | varchar(255) | NO   |     | NULL    |                |


### Episodes テーブルのカラム

| Field          | Type         | Null | Key | Default | Extra          |
| -------------- | ------------ | ---- | --- | ------- | -------------- |
| episode_id     | int          | NO   | PRI | NULL    | auto_increment |
| season_id      | int          | YES  | MUL | NULL    |                |
| episode_number | int          | NO   |     | NULL    |                |
| title          | varchar(255) | NO   |     | NULL    |                |
| description    | text         | NO   |     | NULL    |                |
| video_duration | time         | YES  |     | NULL    |                |
| release_date   | date         | YES  |     | NULL    |                |

・外部キー制約： season_idに対して、Seasonsテーブルの id カラムから設定
<br>

### Genres テーブルのカラム

| Field      | Type         | Null | Key | Default | Extra          |
| ---------- | ------------ | ---- | --- | ------- | -------------- |
| genre_id   | int          | NO   | PRI | NULL    | auto_increment |
| genre_name | varchar(255) | NO   |     | NULL    |                |

### Shows テーブルのカラム

| Field       | Type         | Null | Key | Default | Extra          |
| ----------- | ------------ | ---- | --- | ------- | -------------- |
| show_id     | int          | NO   | PRI | NULL    | auto_increment |
| genre_id    | int          | YES  | MUL | NULL    |                |
| title       | varchar(255) | NO   |     | NULL    |                |
| description | text         | NO   |     | NULL    |                |

### TimeSlots テーブルのカラム

| Field        | Type     | Null | Key | Default | Extra          |
| ------------ | -------- | ---- | --- | ------- | -------------- |
| time_slot_id | int      | NO   | PRI | NULL    | auto_increment |
| channel_id   | int      | YES  | MUL | NULL    |                |
| start_time   | datetime | NO   |     | NULL    |                |
| end_time     | datetime | NO   |     | NULL    |                |

・外部キー制約： channel_idに対して、Channelsテーブルの id カラムから設定
<br>


### Seasons テーブルのカラム

| Field         | Type         | Null | Key | Default | Extra          |
| ------------- | ------------ | ---- | --- | ------- | -------------- |
| season_id     | int          | NO   | PRI | NULL    | auto_increment |
| show_id       | int          | YES  | MUL | NULL    |                |
| season_number | int          | NO   |     | NULL    |                |
| title         | varchar(255) | NO   |     | NULL    |                |

・外部キー制約： show_idに対して、Showsテーブルの id カラムから設定
<br>

### Viewership テーブル

| カラム名        | データ型          | NULL  | キー         | 初期値           | AUTO_INCREMENT |
| --------------- | ---------------- | ----- | ----------- | ----------------- | -------------- |
| viewership_id   | INT              |        | PRIMARY KEY |                   | YES            |
| episode_id      | INT              |       |             |                   |                |
| time_slot_id    | INT              |       |             |                   |                |
| viewership_count| INT              |       |             |                   |                |

・外部キー制約： episode_idに対して、Episodesテーブルの id カラムから設定
・外部キー制約： time_slot_idに対して、TimeSlotsテーブルの id カラムから設定
