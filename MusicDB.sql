CREATE DATABASE Music;
GO
USE Music;
GO

CREATE TABLE [Users] (
    user_id INT PRIMARY KEY IDENTITY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
	role int not null
);

CREATE TABLE UserProfile (
    user_id INT PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Birth Date NOT NULL,
	Phone varchar(10) not null,
	Email varchar(50) not null,
	ImageUrl varchar(200),
	FOREIGN KEY (user_id) REFERENCES [Users](user_id) ON DELETE CASCADE,
);

CREATE TABLE Playlists (
    playlist_id INT PRIMARY KEY IDENTITY,
    user_id INT NOT NULL,
    name NVARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES [Users](user_id) ON DELETE CASCADE
);

CREATE TABLE Songs(
    song_id INT PRIMARY KEY IDENTITY,
    title NVARCHAR(255) NOT NULL,
    artist NVARCHAR(100),
    album NVARCHAR(100),
    genre NVARCHAR(50),
    file_path VARCHAR(500) NOT NULL,  -- Đường dẫn đến file nhạc
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE PlaylistSongs (
    playlistsong_id INT PRIMARY KEY IDENTITY,
    playlist_id INT NOT NULL,
    song_id INT NOT NULL,
    added_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id) ON DELETE CASCADE,
    FOREIGN KEY (song_id) REFERENCES Songs(song_id) ON DELETE CASCADE
);

INSERT INTO [Users] (username, password,role)
VALUES ('bao ', '1',1);

INSERT INTO [Users] (username, password,role)
VALUES ('admin ', '1',0);


-- Thêm playlist cho người dùng
INSERT INTO Playlists (user_id, name)
VALUES (1, N'Nhạc Trữ Tình');

-- Thêm bài hát vào bảng Songs
INSERT INTO Songs (title, artist, album, genre, file_path)
VALUES (N'Nghe Như Tình Yêu', N'HIEUTHUHAI', N'Say', N'Rap', 'D:\PE-SWT301\NgheNhuTinhYeu-HIEUTHUHAI-7045493.mp3');

INSERT INTO Songs (title, artist, album, genre, file_path)
VALUES (N'Từng Quen', N'TEN', N'Loi Choi', N'Balad', 'D:\PE-SWT301\6ge7qfphii.mp3');

INSERT INTO Songs (title, artist, album, genre, file_path)
VALUES (N'Âm Thầm Bên Em', N'MTP', N'Sky', N'Baladd', 'D:\PE-SWT301\amthambenem.mp3');

INSERT INTO Songs (title, artist, album, genre, file_path)
VALUES (N'Buồn Hay Vui', N'MCK', N'99', N'Rap', 'D:\PE-SWT301\BuonHayVuiFeatRptMckObitoRonboogz-VSOULRPTMCKObitoRonboogz-13159599.mp3');

INSERT INTO Songs (title, artist, album, genre, file_path)
VALUES (N'Không Thể Say', N'HIEUTHUHAI', N'Say', N'Rap', 'D:\PE-SWT301\KhongTheSay-HIEUTHUHAI-9293024.mp3');

INSERT INTO Songs (title, artist, album, genre, file_path)
VALUES (N'Ừ Thì Chia Tay', N'Captain Boy', N'Underthedog', N'Rap', 'D:\PE-SWT301\UThiChiaTay-CaptainfeatRHYDER-16421524.mp3');


-- Thêm mối quan hệ giữa playlist và bài hát
INSERT INTO PlaylistSongs (playlist_id, song_id)
VALUES (1, 1);

INSERT INTO PlaylistSongs (playlist_id, song_id)
VALUES (1, 2);

INSERT INTO PlaylistSongs (playlist_id, song_id)
VALUES (1, 3);

INSERT INTO PlaylistSongs (playlist_id, song_id)
VALUES (1, 4);

INSERT INTO PlaylistSongs (playlist_id, song_id)
VALUES (1, 5);