from django.contrib.auth.models import User
from django.db import models

class Movie(models.Model):
    name = models.CharField(max_length=50, blank=False)
    desc = models.CharField(max_length=255)
    stock = models.PositiveIntegerField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    
    def __str__(self):
        return self.name
    
class Cart(models.Model):
    date_created = models.DateTimeField(auto_now_add=True)
    comment = models.CharField(max_length=50, blank=True, null=True)
    user = models.ForeignKey('auth.User', related_name="carts")
    items = models.ManyToManyField(Movie)
    
    # def __str__(self):
        # return self.items