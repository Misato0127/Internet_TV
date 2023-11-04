# Internet_TV

サービスの要件に基づいてデータベースを設計し、テーブルを作成します。以下はテーブルの設計です：

1. チャンネル (Channels) テーブル:

テーブル名: Channels
カラム名:
channel_id (INT, PRIMARY KEY, AUTO INCREMENT)
channel_name (VARCHAR)
NULL: NO
初期値: なし
番組枠 (Time Slots) テーブル:

1. テーブル名: TimeSlots
カラム名:
time_slot_id (INT, PRIMARY KEY, AUTO INCREMENT)
channel_id (INT, FOREIGN KEY REFERENCES Channels(channel_id))
start_time (DATETIME)
end_time (DATETIME)
NULL: NO
初期値: なし
番組 (Shows) テーブル:

1. テーブル名: Shows
カラム名:
show_id (INT, PRIMARY KEY, AUTO INCREMENT)
title (VARCHAR)
description (TEXT)
NULL: NO
初期値: なし
シーズン (Seasons) テーブル:

1. テーブル名: Seasons
カラム名:
season_id (INT, PRIMARY KEY, AUTO INCREMENT)
show_id (INT, FOREIGN KEY REFERENCES Shows(show_id))
season_number (INT)
title (VARCHAR)
NULL: NO
初期値: なし
エピソード (Episodes) テーブル:

1. テーブル名: Episodes
カラム名:
episode_id (INT, PRIMARY KEY, AUTO INCREMENT)
season_id (INT, FOREIGN KEY REFERENCES Seasons(season_id))
episode_number (INT)
title (VARCHAR)
description (TEXT)
video_duration (TIME)
release_date (DATE)
NULL: NO
初期値: なし
ジャンル (Genres) テーブル:

1. テーブル名: Genres
カラム名:
genre_id (INT, PRIMARY KEY, AUTO INCREMENT)
genre_name (VARCHAR)
NULL: NO
初期値: なし
視聴数 (Viewership) テーブル:

1. テーブル名: Viewership
カラム名:
viewership_id (INT, PRIMARY KEY, AUTO INCREMENT)
episode_id (INT, FOREIGN KEY REFERENCES Episodes(episode_id))
time_slot_id (INT, FOREIGN KEY REFERENCES TimeSlots(time_slot_id))
viewership_count (INT)
NULL: NO
初期値: 0

これらのテーブルは正規化されており、関連性を持っています。データベース設計により、番組、シーズン、エピソード、ジャンル、チャンネル、番組枠、および視聴数の情報を効果的に管理できます。外部キー制約を使用して、テーブル間の整合性を保ちます。アプリケーションを開発する際にこれらのテーブルを使用して、KPIの計測や情報のクエリを行うことができます。





