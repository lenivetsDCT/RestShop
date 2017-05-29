from django.conf.urls import include, url
from rest_framework import routers
from . import views

router = routers.DefaultRouter()
router.register(r'account', views.UserSerializer, 'user')
router.register(r'cart', views.CartViewSet, 'cart')
router.register(r'movie', views.MovieViewSet, 'movie')

# Wire up API using automatic URL routing.
urlpatterns = [
#    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^api-token-auth/', 'rest_framework.authtoken.views.obtain_auth_token'),
    url(r'^', include(router.urls)),
]