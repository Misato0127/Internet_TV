### Episodes テーブルのカラム

| カラム名         | データ型       | NULL  | キー      | 初期値           | AUTO INCREMENT  |
|------------------|--------------|-------|---------|------------------|------------------|
| episode_id       | bigint(20)   |       |         | PRIMARY          | YES              |
| season_id        | bigint(20)   |       |         |                  |                  |
| episode_number   | int(11)      |       |         |                  |                  |
| title            | varchar(255) |       |         |                  |                  |
| description      | text         |       |         |                  |                  |
| video_duration   | time         |       |         |                  |                  |
| release_date     | date         |       |         |                  |                  |

・外部キー制約： season_idに対して、Seasonsテーブルの id カラムから設定

<br>
<br>

### Seasons テーブルのカラム

| カラム名         | データ型       | NULL  | キー      | 初期値           | AUTO INCREMENT  |
|------------------|--------------|-------|---------|------------------|------------------|
| season_id        | bigint(20)   |       |         | PRIMARY          | YES              |
| show_id          | bigint(20)   |       |         |                  |                  |
| season_number    | int(11)      |       |         |                  |                  |
| title            | varchar(255) |       |         |                  |                  |

・外部キー制約： show_idに対して、Showsテーブルの id カラムから設定

<br>
<br>

### Shows テーブルのカラム

| カラム名      | データ型       | NULL  | キー      | 初期値  | AUTO INCREMENT  |
|--------------|--------------|-------|---------|--------|------------------|
| show_id      | bigint(20)   |       |         |        | PRIMARY          |
| title        | varchar(255) |       |         |        |                  |
| description  | varchar(255) |       |         |        |                  |
| channel_id   | bigint(20)   |       |         |        |                  |

・外部キー制約： channel_idに対して、Channelsテーブルの id カラムから設定

<br>
<br>

### Channels テーブルのカラム

| カラム名      | データ型   | NULL  | キー      | 初期値  |
|--------------|----------|-------|---------|--------|
| channel_id   | int(11)  |       |         |        |
| genre_id     | int(11)  |       |         |        |
| channel_name | varchar(255) |       |         |        |

・外部キー制約： genre_idに対して、Genresテーブルの id カラムから設定

<br>
<br>

### Genres テーブルのカラム

| カラム名    | データ型   | NULL  | キー      | 初期値  |
|------------|----------|-------|---------|--------|
| genre_id   | int(11)  |       | PRIMARY |        |
| genre_name | varchar(255) |       |         |        |


<br>
<br>


### TimeSlots テーブルのカラム

| カラム名      | データ型       | NULL  | キー      | 初期値  | AUTO INCREMENT  |
|--------------|--------------|-------|---------|--------|------------------|
| time_slot_id | bigint(20)   |       |         |        | PRIMARY          |
| start_time   | datetime     |       |         |        |                  |
| end_time     | datetime     |       |         |        |                  |
| episode_id   | bigint(20)   |       |         |        |                  |
| channel_id   | bigint(20)   |       |         |        |                  |


・外部キー制約： channel_idに対して、Channelsテーブルの id カラムから設定
・外部キー制約： episode_idに対して、Episodesテーブルの id カラムから設定

<br>
<br>

### Viewership テーブル

| カラム名          | データ型       | NULL  | キー      | 初期値  | AUTO INCREMENT  |
|------------------|--------------|-------|---------|--------|------------------|
| viewership_id    | bigint(20)   |       |         |        | PRIMARY          |
| episode_id       | bigint(20)   |       |         |        |                  |
| time_slot_id     | bigint(20)   |       |         |        |                  |
| viewership_count | int(11)      |       |         |        |                  |

・外部キー制約： episode_idに対して、Episodesテーブルの id カラムから設定
・外部キー制約： time_slot_idに対して、TimeSlotsテーブルの id カラムから設定
