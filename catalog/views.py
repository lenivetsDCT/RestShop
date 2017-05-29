from django.contrib.auth.models import User
from django.db.models import Q
from rest_framework import viewsets
from rest_framework.permissions import AllowAny
from .serializers import UserSerializer, MovieSerializer, CartSerializer
from .models import Movie, Cart


class UserSerializer(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    def get_permissions(self):
        if self.request.method == 'POST':
            self.permission_classes = [AllowAny,]
        return super().get_permissions()

class CartViewSet(viewsets.ModelViewSet):
    serializer_class = CartSerializer
    queryset = Cart.objects.all()
    
    def destroy(self, request, *args, **kwargs):
        if request.data['return']:
           instance = self.get_object()
           remove_items_id = request.data['return']
           items_remove = Movie.objects.get(name=remove_items_id)
           items_remove.stock += 1
           instance.items.remove(items_remove)
           items_remove.save()
           return self.retrieve(request)
        else:
           return super().destroy(request, *args, **kwargs)
        
    def get_queryset(self):
       queryset = Cart.objects.filter(user=self.request.user)
       return queryset
    
    def perform_create(self, serializer):
        serializer.save(user=self.request.user)
        
    def order_status_update(request):
        if request.method == 'POST':
           print(request.__dict__)
            

class MovieViewSet(viewsets.ModelViewSet):
    serializer_class = MovieSerializer
    
    def get_queryset(self):
         queryset = Movie.objects.filter(stock__gt=0)
         qr = self.request.query_params.get('query', False)
         if qr:
            queryset = queryset.filter(
                       (Q(desc__icontains=qr) | Q(name__icontains=qr)), 
                        Q(stock__gt=0) )
         return queryset
