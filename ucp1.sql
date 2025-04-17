-- Gunakan database
CREATE DATABASE PosyanduBalita;
GO
USE PosyanduBalita;
GO

-- Tabel Orang Tua
CREATE TABLE Orang_Tua (
    id_orang_tua INT PRIMARY KEY IDENTITY(1,1),
    nama VARCHAR(25) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    alamat VARCHAR(50) NOT NULL
);

-- Tabel Balita
CREATE TABLE Balita (
    id_balita INT PRIMARY KEY IDENTITY(1,1),
    nama VARCHAR(25) NOT NULL,
    tanggal_lahir DATE NOT NULL,
    jenis_kelamin CHAR(1) CHECK (jenis_kelamin IN ('L', 'P')) NOT NULL,
    id_orang_tua INT NOT NULL,
    FOREIGN KEY (id_orang_tua) REFERENCES Orang_Tua(id_orang_tua) ON DELETE CASCADE
);

-- Tabel Perawat
CREATE TABLE Perawat (
    id_perawat INT PRIMARY KEY IDENTITY(1,1),
    nama VARCHAR(25) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    username VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL
);

-- Tabel Rekam Medis
CREATE TABLE Rekam_Medis (
    id_rekam INT PRIMARY KEY IDENTITY(1,1),
    id_balita INT NOT NULL,
    id_orang_tua INT NOT NULL,
    id_perawat INT NULL,
    tanggal_pemeriksaan DATE NOT NULL,
    berat_badan DECIMAL(5,2) CHECK (berat_badan > 0),
    tinggi_badan DECIMAL(5,2) CHECK (tinggi_badan > 0),
    lingkar_kepala DECIMAL(5,2) CHECK (lingkar_kepala > 0),
    status_gizi VARCHAR(6) CHECK (status_gizi IN ('Baik', 'Kurang', 'Buruk')) NOT NULL,
    imunisasi VARCHAR(25),
    keluhan VARCHAR(50),
    email VARCHAR(50) NOT NULL,
    status_pemeriksaan VARCHAR(12) CHECK (status_pemeriksaan IN ('Lolos', 'Tidak Lolos')) NOT NULL,
	FOREIGN KEY (id_balita) REFERENCES Balita(id_balita),
	FOREIGN KEY (id_orang_tua) REFERENCES Orang_Tua(id_orang_tua),
	FOREIGN KEY (id_perawat) REFERENCES Perawat(id_perawat)
);

-- Insert data ke tabel Orang_Tua
INSERT INTO Orang_Tua (nama, email, alamat) VALUES
('Budi Santoso', 'budi@gmail.com', 'Jl. Merdeka No.10'),
('Siti Aisyah', 'siti@gmail.com', 'Jl. Raya Sukarno No.25'),
('Agus Wijaya', 'agus@gmail.com', 'Jl. Mawar No.5'),
('Dewi Lestari', 'dewi@gmail.com', 'Jl. Kenanga No.12'),
('Rudi Hartono', 'rudi@gmail.com', 'Jl. Anggrek No.8');

-- Insert data ke tabel Balita
INSERT INTO Balita (nama, tanggal_lahir, jenis_kelamin, id_orang_tua) VALUES
('Rina Santoso', '2021-05-15', 'P', 1),
('Ahmad Wijaya', '2020-08-20', 'L', 2),
('Salsa Dewi', '2022-01-10', 'P', 3),
('Bayu Hartono', '2019-07-25', 'L', 4),
('Nina Rudianti', '2023-03-12', 'P', 5);

-- Insert data ke tabel Perawat
INSERT INTO Perawat (nama, email, username, password) VALUES
('Dr. Andi Pratama', 'andi.pratama@gmail.com', 'andi_pratama', 'password123'),
('Suster Maya Wulandari', 'maya.wulandari@gmail.com', 'maya_wulandari', 'securepass');

-- Insert data ke tabel Rekam_Medis
INSERT INTO Rekam_Medis (id_balita, id_orang_tua, id_perawat, tanggal_pemeriksaan, berat_badan, tinggi_badan, lingkar_kepala, status_gizi, imunisasi, keluhan, email, status_pemeriksaan) VALUES
(1, 1, 1, '2024-03-10', 12.5, 85.0, 45.0, 'Baik', 'DPT, Polio', 'Tidak ada keluhan', 'budi@gmail.com', 'Lolos'),
(2, 2, 2, '2024-03-11', 10.8, 80.0, 43.5, 'Kurang', 'Campak, Polio', 'Diare ringan', 'siti@gmail.com', 'Tidak Lolos'),
(3, 3, NULL, '2024-03-12', 9.5, 78.0, 42.0, 'Baik', 'Hepatitis B, BCG', 'Demam ringan', 'agus@gmail.com', 'Lolos'),
(4, 4, NULL, '2024-03-13', 13.0, 90.0, 46.0, 'Baik', 'DPT, Polio', 'Batuk ringan', 'dewi@gmail.com', 'Lolos'),
(5, 5, NULL, '2024-03-14', 8.5, 75.0, 41.5, 'Kurang', 'Rotavirus', 'Muntah-muntah', 'rudi@gmail.com', 'Tidak Lolos');
