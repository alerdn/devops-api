package user

import "gorm.io/gorm"

type User struct {
	Id    int    `json:"id" gorm:"primaryKey"`
	Name  string `json:"name" gorm:"type:varchar(100);not null"`
	Email string `json:"email" gorm:"type:varchar(100);unique;"`
}

func Migrate(db *gorm.DB) {
	if err := db.AutoMigrate(&User{}); err != nil {
		panic("Failed to migrate User model: " + err.Error())
	}
}
