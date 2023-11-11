-- 1. エピソード視聴数トップ3のエピソードタイトルと視聴数を取得
SELECT
    Episodes.title AS エピソードタイトル,
    Viewership.viewership_count AS 視聴数
FROM Viewership
INNER JOIN Episodes ON Viewership.episode_id = Episodes.episode_id
ORDER BY Viewership.viewership_count DESC
LIMIT 3;




-- 2. エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得
SELECT
    Shows.title AS 番組タイトル,
    Seasons.season_number AS シーズン数,
    Episodes.episode_number AS エピソード数,
    Episodes.title AS エピソードタイトル,
    Viewership.viewership_count AS 視聴数
FROM
    Shows
    INNER JOIN Seasons ON Shows.show_id = Seasons.show_id
    INNER JOIN Episodes ON Seasons.season_id = Episodes.season_id
    INNER JOIN Viewership ON Episodes.episode_id = Viewership.episode_id
ORDER BY
    Viewership.viewership_count DESC
LIMIT 3;





-- 3. 本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。 *番組の開始時刻が本日のものを本日方法される番組とみなすものとします
SELECT
  Channels.channel_name,
  TimeSlots.start_time,
  TimeSlots.end_time,
  Seasons.season_number,
  Episodes.episode_number,
  Episodes.title AS episode_title,
  Episodes.description AS episode_description
FROM
  Shows
  JOIN Channels ON Shows.channel_id = Channels.channel_id
  JOIN Seasons ON Shows.show_id = Seasons.show_id
  JOIN Episodes ON Seasons.season_id = Episodes.season_id
  JOIN TimeSlots ON TimeSlots.episode_id = Episodes.episode_id
WHERE
  DATE(TimeSlots.start_time) = '2023-01-01'
ORDER BY
  TimeSlots.start_time;





-- 4. 一つのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください

SELECT
    TimeSlots.start_time,
    TimeSlots.end_time,
    Seasons.season_number,
    Episodes.episode_number,
    Episodes.title AS episode_title,
    Episodes.description AS episode_description
FROM
    TimeSlots
JOIN
    Episodes ON TimeSlots.episode_id = Episodes.episode_id
JOIN
    Seasons ON Episodes.season_id = Seasons.season_id
JOIN
    Shows ON Seasons.show_id = Shows.show_id
WHERE
    Shows.channel_id = 1  
    AND TimeSlots.start_time BETWEEN '2023-01-01 00:00:00' AND '2023-01-08 00:00:00'
ORDER BY
    TimeSlots.start_time;





-- 5. 直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください

SELECT
    Episodes.title AS episode_title,
    Shows.title AS show_title,
    SUM(ViewerShip.viewership_count) AS total_viewership
FROM
    ViewerShip
JOIN
    Episodes ON ViewerShip.episode_id = Episodes.episode_id
JOIN
    Seasons ON Episodes.season_id = Seasons.season_id
JOIN
    Shows ON Seasons.show_id = Shows.show_id
WHERE
    Episodes.release_date BETWEEN '2023-01-08' - INTERVAL 7 DAY AND '2023-01-08'
GROUP BY
    Episodes.title, Shows.title
ORDER BY
    total_viewership DESC
LIMIT 2;






-- 6. ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください
SELECT
    G.genre_id,
    G.genre_name AS genre,
    S.title AS show_title,
    E.title AS episode_title,
    AVG(V.viewership_count) AS average_viewership
FROM
    Episodes E
JOIN
    Seasons S ON E.season_id = S.season_id
JOIN
    Shows SH ON S.show_id = SH.show_id
JOIN
    Channels C ON SH.channel_id = C.channel_id
JOIN
    Genres G ON C.genre_id = G.genre_id
LEFT JOIN
    ViewerShip V ON E.episode_id = V.episode_id
GROUP BY
    G.genre_id, S.title, E.title
ORDER BY
    G.genre_id, average_viewership DESC;
