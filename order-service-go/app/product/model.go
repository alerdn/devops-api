package product

import "gorm.io/gorm"

type Product struct {
	Id    int     `json:"id" gorm:"primaryKey"`
	Name  string  `json:"name" gorm:"type:varchar(100);not null"`
	Price float64 `json:"price" gorm:"type:decimal(10,2);not null"`
}

func Migrate(db *gorm.DB) {
	if err := db.AutoMigrate(&Product{}); err != nil {
		panic("Failed to migrate Product model: " + err.Error())
	}
}
