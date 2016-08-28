#Protospace DB設計  
***  
##prototypes table  
 >カラム  
   integer :id  
   string :name  
   text :image_url  
   text :catch_copy  
   text :concept  
   string :tag_list  
 >アソシエーション  
   beongs_to :user  
   has_many :comments  
   has_many :likes  

##users table  
 >カラム  
   integer :user_id  
   string :nickname  
   text :email  
 >アソシエーション  
   has_many :prototypes  
   has_many :comments  
   has_manu :likes  
##comments table  
 >カラム  
   integer :comment_id  
   text :comment  
   text :text  
 >アソシエーション  
   belongs_to :user  
   belongs_to :prototype  
 ##likes table  
 >カラム  

 >アソシエーション  
   belongs_to :prototype  
   belpngs_to :user  