#Protospace DB設計  
***  
##prducts table  
 >カラム  
   integer :id  
   string :name  
   text :catch_copy  
   text :concept  
 >アソシエーション  
   beongs_to :user  
   has_many :comments  
   has_many :likes  
   has_many :images  

##users table  
 >カラム  
   integer :id  
   string :nickname  
   text :email  
 >アソシエーション  
   has_many :products  
   has_many :comments  
   has_many :likes  
##comments table  
 >カラム  
   integer :id  
   text :comment  
 >アソシエーション  
   belongs_to :user  
   belongs_to :product  
##likes table  
 >カラム  
   integer :like_id  
   integer :user_id  
   integer :product_id  
 >アソシエーション 
   belongs_to :product  
   belpngs_to :user  
##images table  
 >カラム  
   integer :id  
   text :image  
   integer :product_id  
   integer :status  
 >アソシエーション  
   belongs_to :product  