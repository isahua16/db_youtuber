INSERT INTO youtuber(username, date_of_birth, is_partner, email) 
VALUES('user_one', '1993-06-16', true, 'user_one@fake.com'),
('user_two', '1993-06-16', true, 'user_two@fake.com'),
('user_three', '1994-06-16', false, 'user_three@fake.com'),
('user_four', '1995-06-16', false, 'user_four@fake.com'),
('user_five', '1996-06-16', false, 'user_five@fake.com');

INSERT INTO video_upload(title, description, `length`, youtuber_id)
VALUES('video_one', 'This is a fake description for video one', '0:10:34', 1),
('video_two', 'This is a fake description for video two', '0:55:01', 2),
('video_three', 'This is a fake description for video three', '0:2:53', 3),
('video_four', 'This is a fake description for video four', '0:45:9', 4),
('video_five', 'This is a fake description for video five', '1:9:12', 5);

INSERT INTO upload_view(youtuber_id, video_upload_id, percent_watched)
VALUES(1, 1, 12), (1, 2, 10), (1, 4, 100), (1, 3, 0), (1, 5, 54),
(2, 1, 3), (2, 2, 78), (2, 3, 100), (2, 4, 98), (2, 5, 0),
(3, 1, 0), (3, 2, 1), (3, 3, 67), (3, 4, 100), (3, 5, 100),
(4, 1, 40), (4, 2, 80), (4, 3, 76), (4, 4, 23), (4, 5, 11),
(5, 1, 100), (5, 2, 100), (5, 3, 100), (5, 4, 100), (5, 5, 100);

SELECT y.username FROM youtuber y INNER JOIN video_upload v ON y.id = v.youtuber_id GROUP BY v.youtuber_id;

SELECT v.title FROM video_upload v INNER JOIN upload_view u ON v.id = u.video_upload_id GROUP BY u.video_upload_id ORDER BY COUNT(u.video_upload_id) DESC LIMIT 1;

SELECT v.title, AVG(u.percent_watched) FROM video_upload v INNER JOIN upload_view u ON v.id = u.video_upload_id GROUP BY u.video_upload_id HAVING COUNT(u.video_upload_id) >= 5 ORDER BY AVG(u.percent_watched) DESC;

SELECT y.username, COUNT(v.id) FROM youtuber y INNER JOIN video_upload v ON y.id = v.youtuber_id INNER JOIN upload_view u ON v.id = u.video_upload_id GROUP BY y.username ORDER BY COUNT(v.id) DESC LIMIT 3; 