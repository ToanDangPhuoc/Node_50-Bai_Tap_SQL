
-- User
CREATE TABLE `Users` (

	`user_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT ,-- mặc định luôn luôn có  Int là số nguyên , PRIMARY KEY => khóa chính , AUTO_INCREMENT => là tự động tăng dần
	`fullName` VARCHAR(255),
	`email` VARCHAR(255),
	`password` VARCHAR(255),
	
	-- mặc định luôn có 
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` tinyint(1) NOT NULL DEFAULT 0,
	`delectedAt`TIMESTAMP NULL DEFAULT NULL,
	`createdAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updateAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP
) ;

	INSERT INTO `Users` ( `email`,`fullName`,`password`) VALUES
('A@gmail.com','Nguyen Van A','12344'),
('B@gmail.com','Nguyen Van B','12344'),
('C@gmail.com','Nguyen Van C','12344'),
('D@gmail.com','Nguyen Van D','12344'),
('E@gmail.com','Nguyen Van E','12344')

INSERT INTO `Users` ( `email`,`fullName`,`password`) VALUES
('F@gmail.com','Nguyen Van F','12344'),
('H@gmail.com','Nguyen Van H','12344'),
('J@gmail.com','Nguyen Van J','12344'),
('G@gmail.com','Nguyen Van G','12344'),
('Z@gmail.com','Nguyen Van Z','12344'),
('X@gmail.com','Nguyen Van X','12344')


--restaurant

CREATE TABLE `Restaurant`(
	`res_id` INT PRIMARY KEY NOT NULL auto_increment,
	`res_name` VARCHAR(255),
	`Image` VARCHAR (255),
	`desc`VARCHAR (255),


-- mặc định luôn có 
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` tinyint(1) NOT NULL DEFAULT 0,
	`delectedAt`TIMESTAMP NULL DEFAULT NULL,
	`createdAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updateAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP


);

INSERT INTO `Restaurant` ( `res_name`,`desc`) VALUES
('Tiệm Gà','Gà ngon'),
('Tiệm Vịt','Vịt ngon'),
('Tiệm Heo','Heo ngon'),
('Tiệm Bò','Bò ngon'),
('Tiệm Cá','Cá ngon')


-- rate_res

CREATE TABLE `rate_res` (
`user_id` INT,
`res_id` INT,
`amout` INT CHECK (`amout` BETWEEN 1 AND 5 ) ,
`date_rate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,

PRIMARY KEY (`user_id`,`res_id`) AUTO_INCREMENT,
FOREIGN KEY (`user_id`) REFERENCES  `Users` (`user_id`) on DELETE CASCADE,
FOREIGN KEY (`res_id`) REFERENCES  `Restaurant` (`res_id`) on DELETE CASCADE,

-- mặc định luôn có 
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` tinyint(1) NOT NULL DEFAULT 0,
	`delectedAt`TIMESTAMP NULL DEFAULT NULL,
	`createdAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updateAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP
);


--- Like_res

CREATE TABLE `like_res` (

`user_id` INT,
`res_id` INT ,
`date_like` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,

PRIMARY KEY (`user_id`, `res_id`) AUTO_INCREMENT,

FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`) on DELETE CASCADE,

FOREIGN KEY (`res_id`) REFERENCES `Restaurant`(`res_id`) on DELETE CASCADE,


-- mặc định luôn có 
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` tinyint(1) NOT NULL DEFAULT 0,
	`delectedAt`TIMESTAMP NULL DEFAULT NULL,
	`createdAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updateAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP

);

INSERT `like_res`(`user_id`,`res_id`) VALUES
('1','2'),
('2','2'),
('3','2'),
('4','2'),
('5','2'),
('1','3'),
('1','4'),
('2','3'),
('2','4'),
('7','3'),
('7','1'),
('7','2'),
('8','3'),
('8','1'),
('8','2'),
('8','5'),
('10','3'),
('10','1'),
('10','2'),
('10','4')


--- food type

CREATE TABLE `Food_type`(
`type_id` INT PRIMARY key NOT NULL AUTO_INCREMENT,
`type_name` VARCHAR(255),
-- mặc định luôn có 
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` tinyint(1) NOT NULL DEFAULT 0,
	`delectedAt`TIMESTAMP NULL DEFAULT NULL,
	`createdAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updateAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP
);

INSERT `Food_type`(`type_name`) VALUES
('Đồ nước'),
('Đồ khô')


---food
CREATE TABLE `Foods`(
`food_id` INT PRIMARY key NOT NULL AUTO_INCREMENT,
`foodName` VARCHAR(255),
`Image` VARCHAR(255),
`price` FLOAT unsigned NOT NULL ,
`desc` VARCHAR(255),
`type_id` INT,

-- mặc định luôn có 
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` tinyint(1) NOT NULL DEFAULT 0,
	`delectedAt`TIMESTAMP NULL DEFAULT NULL,
	`createdAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updateAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP,
	
	FOREIGN KEY(`type_id`) REFERENCES `Food_type`(`type_id`)
	
);

INSERT `Foods` (`foodName` ,`type_id`,`price`) VALUES
('Mì','1','30000'),
('Mì Xào','2','45000'),
('Hủ Tiếu','1','30000'),
('Hủ Tiếu Xào','2','45000'),
('Cơm','2','30000')



--- oder 
CREATE TABLE `Oders`(
`user_id`INT,
`food_id`INT,
`amount`INT,
`code` VARCHAR(255),
`arr_sub_ib` VARCHAR(255),

-- mặc định luôn có 
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` tinyint(1) NOT NULL DEFAULT 0,
	`delectedAt`TIMESTAMP NULL DEFAULT NULL,
	`createdAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updateAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP,
	
	PRIMARY KEY(`user_id`,`food_id`),
	FOREIGN KEY (`user_id`)REFERENCES`Users`(`user_id`),
	FOREIGN KEY (`food_id`)REFERENCES`Foods`(`food_id`)
) ;

INSERT `Oders` (`user_id`,`food_id`,`amount`) VALUES
('7','1','1'),
('8','2','1'),
('9','3','1'),
('7','2','1'),
('7','3','1')





--- sub food
CREATE TABLE `Sub_food`(
`sub_id`INT PRIMARY KEY NOT NULL AUTO_INCREMENT ,
`sub_name` VARCHAR (255),
`sub_price`FLOAT unsigned NOT NULL,
`food_id`INT,
-- mặc định luôn có 
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` tinyint(1) NOT NULL DEFAULT 0,
	`delectedAt`TIMESTAMP NULL DEFAULT NULL,
	`createdAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updateAt`TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (`food_id`)REFERENCES`Foods`(`food_id`)
);




-- INER JOIN
SELECT `userId`,`foodId`,`email`,`fullName`,`password`

FROM (`Oders`)


INNER JOIN `User` ON `User`.id = `Oders`.userId ;

-- LEFT JOIN

SELECT `userId`,`foodId`,`email`,`fullName`,`password`

FROM (`User`) LEFT JOIN (`Oders`) on `User`.id = `Oders`.userId  ;

-- CROSS JOIN

SELECT `userId`,`foodId`,`email`,`fullName`,`password`

FROM (`User`)  CROSS JOIN (`Oders`) ;



-- Tìm 5 người like nhiều nhất

SELECT `like_res`.`user_id`,COUNT(*) AS total_likes
FROM `like_res` 
INNER JOIN  `Users`on `Users`.`user_id`=`like_res`.`user_id` 
GROUP BY `like_res`.`user_id`
ORDER BY total_likes DESC
LIMIT 5;

-- tìm ra 2 nhà hàng  được like nhiều nhất

SELECT `like_res`.`res_id`,COUNT(*) as total_like
FROM `like_res`
INNER JOIN `Restaurant` on `Restaurant`.`res_id`=`like_res`.`res_id`
GROUP BY `like_res`. `res_id`
ORDER BY total_like DESC
LIMIT 2;

-- Tìm ra người đã odeer nhiều nhất
SELECT `Oders`.`user_id`,COUNT(*)as total_oder
FROM`Oders`
INNER JOIN `Users`on `Users`.`user_id`=`Oders`.`user_id`
GROUP BY `Oders`.`user_id` 
ORDER by total_oder DESC
LIMIT 1;

-- Tìm ra người không oder,like,đánh giá
SELECT `Users`.`user_id`,`Users`.`fullName`
FROM `Users`
LEFT JOIN `Oders` on `Users`.`user_id`=`Oders`.`user_id`
LEFT JOIN `like_res` on `Users`.`user_id`=`like_res`.`user_id`
LEFT JOIN `rate_res` on `Users`.`user_id`=`rate_res`.`user_id`
WHERE `Oders`.`user_id` is	 NULL
AND `like_res`.`user_id` is NULL
AND `rate_res`.`user_id` is NULL;


