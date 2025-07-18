package order

import "gorm.io/gorm"

type Order struct {
	ID        int `json:"id" gorm:"primaryKey"`
	UserID    int `json:"user_id" gorm:"not null"`
	ProductID int `json:"product_id" gorm:"not null"`
}

func Migrate(db *gorm.DB) {
	if err := db.AutoMigrate(&Order{}); err != nil {
		panic("failed to migrate order model: " + err.Error())
	}
}