from django.contrib import admin
from .models import Movie, Cart
from django.contrib.auth.models import User

class MovieAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'desc', 'stock', 'price']

class CartAdmin(admin.ModelAdmin):
    list_display = ['id', 'date_created', 'user', 'comment']
    list_filter = ['date_created']
    filter_horizontal = ('items',)

admin.site.register(Movie, MovieAdmin)
admin.site.register(Cart, CartAdmin)