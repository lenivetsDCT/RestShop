from django.contrib.auth.models import User
from rest_framework import serializers
from .models import Movie, Cart

class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('url', 'username', 'email', 'password', 'carts' )
        write_only_fields = ('password',)
        read_only_fields = ('carts','id')
        
    def create(self, validated_data):
        user = User.objects.create(email=validated_data['email'], 
                                   username=validated_data['username'])
        user.set_password(validated_data['password'])
        user.save()
        return user
        
    def update(self, instance, validated_data):
        if 'password' in validated_data:
            password = validated_data.pop('password')
            instance.set_password(password)
        return super().update(instance, validated_data)

class MovieSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Movie
        fields = ( 'url', 'name', 'desc', 'stock', 'price' )
        
class CartSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Cart
        fields = ( 'url', 'date_created', 'user', 'comment', 'items' )
        read_only_fields = ('user',)  
        
    def update(self, instance, validated_data):
        print('Removing item :)')
        c_l= list(instance.items.values_list('name', flat=True))
        for item in validated_data['items']:
            if str(item) not in c_l:
               t_obj = Movie.objects.get(name=str(item))
               if t_obj.stock > 0: 
                  t_obj.stock -= 1
                  t_obj.save()
               else: raise serializers.ValidationError('OutOfStock: ',t_obj.name)
            else: c_l.remove(str(item))
        for r_i in c_l:
               t_obj = Movie.objects.get(name=r_i)
               t_obj.stock += 1
               t_obj.save()
               
        return super().update(instance, validated_data)
        
    def create(self, validated_data):
        for item in validated_data['items']:
            t_obj = Movie.objects.get(name=str(item))
            if t_obj.stock > 0:
               t_obj.stock -= 1
               t_obj.save()
               return super().create(validated_data)
            else: raise serializers.ValidationError('OutOfStock: '+ t_obj.name)
