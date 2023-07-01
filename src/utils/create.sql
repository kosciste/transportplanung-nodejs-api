CREATE TABLE users (
	user_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(20) NOT NULL,
    PRIMARY KEY(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE refresh_tokens (
    refresh_token_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    token VARCHAR(20000) NOT NULL,
    expires_at DATETIME NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(refresh_token_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE carriers (
    carrier_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    zip INT NOT NULL,
    contact VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME on UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(carrier_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE clients (
	client_id INT NOT NULL AUTO_INCREMENT,
    contact VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME on UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(client_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE companies (
    company_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    zip INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME on UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(company_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE holidays (
    holiday_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME on UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(holiday_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE weekdays (
    weekday_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY(weekday_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO weekdays (name) VALUES ("Montag");
INSERT INTO weekdays (name) VALUES ("Dienstag");
INSERT INTO weekdays (name) VALUES ("Mittwoch");
INSERT INTO weekdays (name) VALUES ("Donnerstag");
INSERT INTO weekdays (name) VALUES ("Freitag");
INSERT INTO weekdays (name) VALUES ("Samstag");
INSERT INTO weekdays (name) VALUES ("Sonntag");


CREATE TABLE tours (
    tour_id INT NOT NULL AUTO_INCREMENT,
    start_company_id INT NOT NULL,
    end_company_id INT NOT NULL,
    responsible_company_id INT NOT NULL,
    carrier_id INT NOT NULL,
    holiday_id INT NOT NULL,
    start_weekday_id INT NOT NULL,
    end_weekday_id INT NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    on_demand TINYINT(1) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME on UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(tour_id),
    FOREIGN KEY (start_company_id) REFERENCES companies(company_id),
    FOREIGN KEY (end_company_id) REFERENCES companies(company_id),
    FOREIGN KEY (responsible_company_id) REFERENCES companies(company_id),
    FOREIGN KEY (carrier_id) REFERENCES carriers(carrier_id),
    FOREIGN KEY (holiday_id) REFERENCES holidays(holiday_id),
    FOREIGN KEY (start_weekday_id) REFERENCES weekdays(weekday_id),
    FOREIGN KEY (end_weekday_id) REFERENCES weekdays(weekday_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;