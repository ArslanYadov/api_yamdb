from django.contrib import admin

from reviews.models import (
    User,
    Category,
    Genre,
    Title,
    GenreTitle,
    Review,
    Comment
)


admin.site.register(User)
admin.site.register(Category)
admin.site.register(Genre)
admin.site.register(Title)
admin.site.register(GenreTitle)
admin.site.register(Review)
admin.site.register(Comment)
